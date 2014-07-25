package com.spring.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.entity.Blog;
import com.spring.entity.User;
import com.spring.service.BlogMapperService;
import com.util.Constant;
import com.util.DataHandle;
import com.util.HtmlHandle;
import com.util.Init;
import com.util.TimeHandle;

@Controller
@RequestMapping("blog")
public class BlogController {

	@Autowired
	private BlogMapperService blogMapperService;

	@RequestMapping("myBlog/{userid}")
	public String doMyBlog(HttpSession session, Model model,
			HttpServletRequest request,@PathVariable int userid){
		return "blog/index";
	}
	
	/**
	 * 我的博客(new)
	 * */
	@RequestMapping("my/{userid}")
	public String doMy(HttpSession session, Model model,
			HttpServletRequest request,@PathVariable int userid) {
		User user = (User) session.getAttribute(Constant.USER);
		boolean isOperator = false;
		/** 只有该博客的用户才能操作该博客 */
		if(user != null && user.getUserId() == userid){
			isOperator = true;
		}
		Blog blog = new Blog();
		int page = DataHandle.returnValueInt(request, "page");
		if (page == 0) {
			page = 0;
		} else {
			page = page - 1;
		}
		String keyword = DataHandle.returnValue(request, "keyword");
		if (!"".equals(keyword)) {
			Integer KeywordId = Init.keywordHm.get(userid).get(keyword);
			blog.setKeywords("," + KeywordId + ",");
		}
		blog.setUserId(userid);
		blog.setStartPage(page * Constant.BLOGPAGE);
		blog.setPage(Constant.BLOGPAGE);
		List<Blog> blogList = blogMapperService.selectList(blog);
		int countArticle = blogMapperService.count(blog);
		model.addAttribute("blogList", blogList);
		model.addAttribute("userid", userid);
		model.addAttribute("page", page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("countArticle", countArticle);
		model.addAttribute("isOperator",isOperator);
		return "blog/myIndex";
	}
	
	@RequestMapping("view/{userId}")
	public String doBlogList(@PathVariable int userId){
		return "blog/view";
	}

	/**
	 * 增加博客
	 * */
	@RequestMapping("my-addblog")
	public String doAdd() {
		return "blog/addblog";
	}

	@RequestMapping("my-blogList")
	public String doList() {
		return "blog/blog-list";
	}

	@RequestMapping("my-blogListist")
	public void doListAjax(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		User htUser = (User) session.getAttribute(Constant.USER);
		int page = DataHandle.returnValueInt(request, "page");
		int rp = DataHandle.returnValueInt(request, "rp");
		Blog blog = new Blog();
		blog.setUserId(htUser.getUserId());
		blog.setPage(rp);
		blog.setStartPage(page);
		List<Blog> blogList = blogMapperService
				.returnTitleEntity(blog);
		List<Blog> blogListNew = new ArrayList<Blog>();
		for (Blog blog1 : blogList) {
			String opearator = "<span attr="
					+ blog1.getBlogId()
					+ "><a class='alterArticle' href=\"#\">修改</a><a class='delArticle' href=\"#\">删除</a></span>";
			blog1.setIds(opearator);
			blogListNew.add(blog1);
		}
		int count = blogMapperService.count(blog);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("rows", blogList);
		map.put("total", count);
		map.put("page", page);
		JSONObject jsonObject = JSONObject.fromObject(map);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(jsonObject.toString());
	}

	/**
	 * 提交博客内容 
	 * */
	@RequestMapping("my-addblog-post")
	public void doAddblogPost(HttpServletRequest request,
			HttpServletResponse response, HttpSession httpSession)
			throws IOException {
		String title = DataHandle.returnValue(request, "title");
		String content = DataHandle.handleValue(request.getParameter("content"));
		int blogType = DataHandle.returnValueInt(request, "article_type");
		String keyword = DataHandle.returnValue(request, "keyword");
		User user = new User();
		user = (User) httpSession.getAttribute(Constant.USER);
		String short_content = "";
		short_content = HtmlHandle.filterTextToHTML(content);
		short_content = HtmlHandle.Html2Text(short_content);
		if (short_content.length() > 500) {
			short_content = short_content.substring(0, 500) + "...";
		}
		String keywordIds = insertKeywords(user.getUserId(), keyword);
		Blog blog = new Blog();
		blog.setContent(content);
		blog.setCreateDate(TimeHandle.currentTime());
		blog.setShortContent(short_content);
		blog.setTitle(title);
		blog.setBlogType(blogType);
		blog.setUserId(user.getUserId());
		blog.setKeywords(keywordIds);
		blogMapperService.insert(blog);
		response.getWriter().print("success");
	}

	/**
	 * 插入文章关键字,返回ids
	 * */
	public String insertKeywords(int userId, String keyword) {
		StringBuffer keywordIds = new StringBuffer(",");
		if (!keyword.isEmpty()) {
			String[] keywordSpl = keyword.split(" ");
			for (int i = 0; keywordSpl != null && i < keywordSpl.length; i++) {
				String keywordSingle = DataHandle.handleValue(keywordSpl[i]);
				if (keywordSingle == "") {
					continue;
				} else {
//					BgKeyword bgKeyword = new BgKeyword();
//					bgKeyword.setName(keywordSingle);
//					bgKeyword.setUserId(userId);
//					Integer isExistId = bgKeywordMapperService
//							.selectByKeyword(bgKeyword);
//					/** 如果已经 存在关键字,则将关键字id加入，否则插入关键字记录后插入 */
//					if (isExistId == null) {
//						bgKeywordMapperService.insert(bgKeyword);
//						keywordIds.append(bgKeywordMapperService.maxId(bgKeyword) + ",");
//					} else {
//						keywordIds.append(isExistId + ",");
//					}
				}
			}
		}
		return keywordIds.toString();
	}

	/**
	 * 单个博客文章页面
	 * */
	@RequestMapping("viewDetail/{blogId}")
	public String doArticle(@PathVariable int blogId, Model model) {
		Blog blog = new Blog();
		blog.setBlogId(blogId);
		blog = blogMapperService.select(blog);
//		blog
//				.setContent(HtmlHandle.filterTextToHTML(blog.getContent().toString()));
		model.addAttribute("blog", blog);
		return "blog/viewDetail";
	}

	/**
	 * 删除文章
	 * */
	@RequestMapping("del-article")
	public void doDelArticle(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String ids = DataHandle.returnValue(request, "ids");
		Blog blog = new Blog();
		blog.setIds(ids);
		blogMapperService.deleteByIds(blog);
		response.getWriter().write("success");
	}

	/**
	 * 更新文章
	 * */
	@RequestMapping("my-updateArticle/{article_id}")
	public String doMyArticle(@PathVariable int article_id, Model model) {
		Blog blog = new Blog();
		blog.setBlogId(article_id);
		blog = blogMapperService.select(blog);
		String keywords = blog.getKeywords();
		if(!keywords.isEmpty()){
			if(",".equals(keywords)){
				keywords = "";
			}else{
//				keywords = blog.getKeywords().substring(1,
//						blog.getKeywords().length() - 1);
//				BgKeyword bgKeyword = new BgKeyword();
//				bgKeyword.setIds(keywords);
//				keywords = bgKeywordMapperService.selectGroupKeywords(bgKeyword);
//				keywords = keywords.replaceAll(",", " ");
//				blog.setKeywords(keywords);
			}
		}
		model.addAttribute("article", blog);
		return "blog/my-updateArticle";
	}

	@RequestMapping("my-updateblog-post")
	public void doMyUpdateblogPost(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		int article_id = DataHandle.returnValueInt(request, "blogId");
		String title = DataHandle.returnValue(request, "title");
		String content = DataHandle.returnValue(request, "content");
		String keyword = DataHandle.returnValue(request, "keyword");
		User htUser = (User) session.getAttribute(Constant.USER);
		String keywordIds = insertKeywords(htUser.getUserId(), keyword);
		Blog blog = new Blog();
		blog.setBlogId(article_id);
		blog.setTitle(title);
		blog.setUserId(htUser.getUserId());
		blog.setContent(content);
		blog.setKeywords(keywordIds);
		blogMapperService.update(blog);
		response.getWriter().write("success");
	}
	
	/**
	 * 根据文章id范围文章entity
	 * @param request
	 * @param response
	 * @param session
	 * @throws IOException 
	 */
	@RequestMapping("returnSingleArticle")
	public void returnSingleArticle(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException{
		int blogId = DataHandle.returnValueInt(request, "blogId");
		Blog blog = new Blog();
		blog.setBlogId(blogId);
		blog = blogMapperService.select(blog);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("data", blog);
		response.getWriter().write(jsonObject.toString());
	}
	
	@RequestMapping("returnBlogList")
	public void returnBlogList(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		int startPage = DataHandle.returnValueInt(request, "startPage");
		int recordNum = DataHandle.returnValueInt(request, "recordNum");
		
		Blog blog = new Blog();
		blog.setUserId(user.getUserId());
		blog.setPage(recordNum);
		blog.setStartPage((startPage - 1) * recordNum);
		blog.setCondition(" order by createDate desc ");
		List<Blog> blogList = blogMapperService.returnTitleEntity(blog);
		int recordSum = blogMapperService.count(blog);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("dataList", blogList);
		jsonObject.put("recordSum", recordSum);
		response.getWriter().write(jsonObject.toString());
	}

	@RequestMapping("returnBlogListDateTables")
	public void returnBlogListDateTables(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException{
		User user = (User) session.getAttribute(Constant.USER);
		
		/** 开始页 */
        int sPage = DataHandle.returnValueInt(request, "iDisplayStart");
        /** 每页数量 */
        int sRows = DataHandle.returnValueInt(request, "iDisplayLength");
        /** 排序列位置 */
        String iSortCol = DataHandle.returnValue(request, "iSortCol_0");
        /** 排序方式 */
        String sOrderType = DataHandle.returnValue(request, "sSortDir_0");
        /** 排序列 */
        String sOrderCol = "";
        /** 所有列code */
        String sColumns = DataHandle.returnValue(request, "sColumns");
        String[] cols = new String[] {};
        if (sColumns != null) {
            cols = sColumns.split(",");
        }
        if (!DataHandle.isNullOrEmpty(iSortCol)) {
        	/** 获取当前排序列 */
            sOrderCol = cols[Integer.valueOf(iSortCol)];
        }
        
        String orderType = "";
        String orderCol = "";
        /** 设置排序参数 */
        if (!DataHandle.isNullOrEmpty(sOrderCol)) {
            orderCol = " order by " + sOrderCol;
            if (!DataHandle.isNullOrEmpty(sOrderType)) {
                orderType = sOrderType;
            }
            orderCol += " " + orderType;
        }
        
        Blog blog = new Blog();
        blog.setUserId(user.getUserId());
        blog.setStartPage(sPage);
        blog.setPage(sRows);
        blog.setCondition(" 1 = 1 " + orderCol);
		List<Blog> blogList = blogMapperService.returnTitleEntity(blog);
		int count = blogMapperService.count(blog);
		JSONObject json = new JSONObject();
		json = new JSONObject();
		json.put("iTotalRecords", 10);  //本次查询记录数
		json.put("iTotalDisplayRecords", count); //记录总数
		json.put("aaData", blogList); 
		response.getWriter().write(json.toString());
	}
	
	/**
     * 获得时间树的年份
     * */
    @RequestMapping("returnTreeYear")
    public void returnTreeYear(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	Blog blog = new Blog();
    	blog.setUserId(user.getUserId());
    	List<Map<String, Object>> noteList = blogMapperService.selectYear(blog);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
    
    /**
     * 获得时间树的月份
     * */
    @RequestMapping("returnTreeMonth")
    public void returnTreeMonth(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	String year = request.getParameter("year");
    	String condition = "createDate >= '" + year + "-01-01 00:00:00' and createDate <= '" + year + "-12-31 23:59:59'";
    	Blog blog = new Blog();
    	blog.setCondition(condition);
    	blog.setUserId(user.getUserId());
    	List<Map<String, Object>> noteList = blogMapperService.selectMonth(blog);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
    
    /**
     * 获得时间树的天数
     * */
    @RequestMapping("returnTreeDay")
    public void returnTreeDay(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException{
    	User user = (User) session.getAttribute(Constant.USER);
    	String year = request.getParameter("year");
    	String month = request.getParameter("month");
    	String condition = "createDate >= '" + year + "-" + month + "-01 00:00:00' and createDate <= '" + year + "-" + month + "-31 23:59:59'";
    	Blog blog = new Blog();
    	blog.setUserId(user.getUserId());
    	blog.setCondition(condition);
    	List<Map<String, Object>> noteList = blogMapperService.selectDay(blog);
    	JSONObject jsonObject = new JSONObject();
    	jsonObject.put("result", "success");
    	jsonObject.put("data", noteList);
    	response.getWriter().write(jsonObject.toString());
    }
	

}
