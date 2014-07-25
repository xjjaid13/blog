<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>博客</title>
<link type="text/css" rel="stylesheet" href="${base}/css/blog.css">
<link href="${base}/js/levelMenu/levelMenu.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/xDialog-master/xDialog.css" rel="stylesheet" type="text/css"/>
<style>
	.btnCode{
		background : url("${base}/image/code.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0)
	}
	pre {
	    background-color: #F0F0F0;
	    margin: 4px 0;
	}
</style>
</head>     
<body>
<input type="hidden" name="page" value="${page+1}" >
<%@include file="../../static/headNew.jsp" %>
<!-- end navbar -->
<div class="main">
	<div class="container">
	    <div class="span10" style="margin:-25px 0 0 0;padding:0px;">
			<div class="row span9">
				<div class="box-wrapper">
					<div class="row" style="padding:10px 0 10px 30px;">
						<div class="title span12">
							<div>
							    <button id="addBlog" class="btn" type="button">新增博客</button>
							</div>
						</div><!-- end title -->
					</div>
					<ul class="fixed span9" id="blogContent" style="margin-right:30px;background-color:#EEEEEE;border-radius:5px;">
						
					</ul>
					<div id="bottomClass" style="position:fixed;bottom:0;">
						<div class="row span9" style="text-align:center;">
							<div id="pagination" class="navigation pagination" style="margin:0 30px;">
								
	   						</div>
						</div>
					</div>
				</div><!-- end  -->
			</div><!-- row -->
	    </div>
		<div class="span2" id="menu">
        	<div id="recordWrap">
				<div id="toolDiv" class="span2" style="margin-left:0;">
					<div id="timeMenu">
				        <ul id="timeTree">
				        </ul>
				    </div>
				    <div id="recordDiv">
				    	
				    </div>
				</div>
			</div>
        </div>
	</div><!-- end container -->
</div><!-- end main -->
<ul id="blogWrap" class="hide">
	<li class="contentMain" style="position:relative;padding:15px;height:20px;">
		<div class="span5">
			<a target="_blank" href="${base}/blog/viewDetail/#blogId#">#title#</a>
		</div>
		<div class="span1">
		           类别:技术
		</div>
		<div class="span1">
			#createDate#
		</div>
		<div class="span1">
			<span><a attr="#blogId#" class="modifyBlog pointer">编辑</a></span>
			<span><a attr="#blogId#" class="deleteBlog pointer">删除</a></span>
		</div>
	</li>
</ul>
<div id="blogContentWrap" class="hide">
	<div class="row-fluid">
		<div>
			<select id="article_type" style="width:80px;">
				<option value="0">原创</option>
				<option value="1">转载</option>
				<option value="2">翻译</option>
			</select>
			<input type="text" id="title" class="input_class">
		</div>
		<div class="title_div">
			<textarea id="content" name="content" rows="22" cols="80" style="width: 100%; height : 300px;"></textarea>
		</div>
		<div><label class="pull-left" style="padding:4px 6px;">关键字： </label><input type="text" class="input_class" name="keyword" id="keyword"></div>
	</div>
</div>
<%@include file="../../static/endNew.jsp" %>
</body>
<!-- js Boots_from -->
<script src="${base}/js/pagination/jquery.pagination.js"></script>
<script src="${base}/js/levelMenu/levelMenu.js"></script>
<script src="${base}/js/xDialog-master/xDialog.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor.js"></script>
<script src="${base}/js/sticky/jquery.sticky.js"></script>
<script>
	$(function(){
	    $("#toolDiv").sticky({ topSpacing: 65, center:true, className:"hey" });
		 
		$("#timeTree").levelMenu({
		    yearUrl : '${base}/blog/returnTreeYear',
	        monthUrl : '${base}/blog/returnTreeMonth',
	        dayUrl : '${base}/blog/returnTreeDay'
		});
		
		var editor;
		$("#addBlog").click(function(){
		    $.xDialog({
			    title:'新增博客',
			    content:$("#blogContentWrap").html(),
			    width : 900,
			    popCallBack : function(){
			        editor = $('.xDialog #content').xheditor({plugins:plugins,tools:'Source,|,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Removeformat,Align,List,|,Link,Unlink,Img,Flash,Media,|,Hr,Emot,Table,Code,|,Preview,Fullscreen,About',skin:'o2007silver',showBlocktag:false,forcePtag:false,emotMark:true});
			    },
			    ok : function(){
			        var title = $(".xDialog #title").val();
			    	var content = editor.getSource();
			    	var article_type = $(".xDialog #article_type").html();
			    	var keyword = $(".xDialog #keyword").val();
			    	if(title == "" || $.trim(content) == "<br>"){
			    	    alert("请输入标题或者内容");
			    	}else{
				        $.post('${base}/blog/my-addblog-post',{ title: title,keyword : keyword, content: content,article_type : article_type }, function(data) {
				    	    closeDialog();
						    returnBlogList(1);
				    	});
			    	}
			    	return false;
			    }
			});
		})
		 
		$(".deleteBlog").live("click",function(){
			 $.ajax({
				 url : '${base}/blog/del-article?ids='+$(this).attr("attr"),
				 success : function(data){
					 location.href = location.href;
				 }
			 });
		});
		 
		$(".modifyBlog").live("click",function(){
			 var blogId = $(this).attr("attr");
			 $.ajax({
				 url : '${base}/blog/returnSingleArticle.action',
				 data : 'blogId='+blogId,
				 type : 'post',
				 dataType : 'json',
				 success : function(ajaxData){
					 var data = ajaxData.data;
					 $.xDialog({
					     title:'修改博客',
					     content:$("#blogContentWrap").html(),
					     width : 900,
					     popCallBack : function(){
					    	 editor = $('.xDialog #content').xheditor({plugins:plugins,tools:'Source,|,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Removeformat,Align,List,|,Link,Unlink,Img,Flash,Media,|,Hr,Emot,Table,Code,|,Preview,Fullscreen,About',skin:'o2007silver',showBlocktag:false,forcePtag:false,emotMark:true});
					    	 $(".xDialog #title").val(data.title);
							 $(".xDialog #article_type").val(data.article_type);
							 $(".xDialog #keyword").val(data.keyword);
					    	 editor.setSource(data.content);
					     },
					     ok : function(){
					    	 var title = $(".xDialog #title").val();
					    	 var content = editor.getSource();
					    	 var article_type = $(".xDialog #article_type").html();
					    	 var keyword = $(".xDialog #keyword").val();
					    	 if(title == "" || $.trim(content) == "<br>"){
					    	 	alert("请输入标题或者内容");
					    	 }else{
						    	 $.post('${base}/blog/my-addblog-post',{ title: title,keyword : keyword, content: content,article_type : article_type }, function(data) {
						    		 closeDialog();
								     returnBlogList(1);
						    	 });
					    	 }
					    	 return false;
					     }
					 });
				 }
			 });
		});
		returnBlogList(1);
		
	});
	
	function returnBlogList(startPage){
		$.ajax({
			url : '${base}/blog/returnBlogList',
			data : {startPage : startPage , recordNum : 15},
			dataType : 'json',
			success : function(ajaxData){
				$("#pagination").pagination(ajaxData.recordSum,{
					items_per_page:15,
				    current_page : startPage - 1,
				    callback : function(startPage){
				    	startPage++;
				    	returnBlogList(startPage);
					}
				});
				var dataList = ajaxData.dataList;
				var content = "";
				var blogWrap = $("#blogWrap").html();
				for(var i = 0; i < dataList.length; i++){
					var tempWrap = blogWrap;
					var blog = dataList[i];
					var shortContent = blog.shortContent;
					var blogId = blog.blogId;
					var title = blog.title;
					var blogType = blog.blogType == 0;
					if(blogType == 0){
						blogType = '原';
					}else if(blogType == 1){
						blogType = '转';
					}else if(blogType == 2){
						blogType = '译';
					}
					var createDate = blog.createDate.substring(0,10);
					tempWrap = tempWrap.replace(/#shortContent#/,shortContent);
					tempWrap = tempWrap.replace(/#blogId#/g,blogId);
					tempWrap = tempWrap.replace(/#title#/,title);
					tempWrap = tempWrap.replace(/#blogType#/,blogType);
					tempWrap = tempWrap.replace(/#createDate#/,createDate);
					content += tempWrap;
				}
				$("#blogContent").html(content);
				<c:if test="${user != null}">
				$(".contentMain").mouseenter(function(event){
				    $(this).closest("li").find(".operate").fadeIn();
				    event.preventDefault();
				}).mouseleave(function(event){
				    $(this).closest("li").find(".operate").fadeOut();
				    event.preventDefault();
				});
				</c:if>

				$(".contentMain").hover(function(){
					$(this).css("background-color","#D8DDE0");
				},function(){
					$(this).css("background-color","#EEEEEE");
				});
			}
		});
	}

</script>
<!-- end Boots_from -->
</html>
