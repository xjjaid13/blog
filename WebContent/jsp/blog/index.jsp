<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>blog</title>
<link rel="shortcut icon" type="image/x-icon" href="${base}/static/image/favicon.ico" media="screen" />
<%@include file="../css-file.jsp" %>
<link rel="stylesheet" href="${base}/static/js/jstree/dist/themes/default/style.min.css" />
<link href="${base}/static/js/xDialog-master/xDialog.css" rel="stylesheet" type="text/css"/>
<%@include file="../js-file.jsp" %>
<script src="${base}/static/js/jstree/dist/jstree.min.js"></script>
<script src="${base}/static/js/xDialog-master/xDialog.js"></script>
<script type="text/javascript" src="${base}/static/js/xheditor-1.2.1/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="${base}/static/js/xheditor-1.2.1/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript" src="${base}/static/js/xheditor-1.2.1/xheditor.js"></script>
<script>
	var jsTree;
	var page = 1;
	var pageSize = 10;
	var type = 0;
	$(function(){
		$('.btn-default').popover({
		    'trigger' : 'click'
		});
		$('#js-tree').jstree({ 'core' : {
				"check_callback" : true,
				'data' :  {
				    'url' :  function (node) {
				    	return "${base}/blog/myReturnBlogTypeTree";
				    },
				    'data' : function (node) {
				        return { 'id' : node.id };
			        }
			    }
			}
		});
		$("#js-tree").on("loaded.jstree",function(e, data){
			jsTree = $('#js-tree').jstree(true);
			jsTree.select_node('0');
		});
		$('#js-tree').on("select_node.jstree", function (e, data) {
			refresh();
		});
		$(document).on("click","#addSubject",function(){
			sel = jsTree.get_selected();
			if(!sel.length) { return false; }
			var subjectTitle = $("#subjectTitle").val();
			$.ajax({
				url : '${base}/blog/addSubject',
				data : 'subjectTitle='+subjectTitle+'&blogTypeId='+sel[0],
				dataType : 'json',
				success : function(ajaxData){
					ajaxHandle(ajaxData,function(){
						refresh();
					});
				}
			});
		}).on("click",".blogList",function(){
			var $this = $(this);
			var blogSubjectId = $this.attr("attr");
			articlePage(blogSubjectId);
			return false;
		});
	});
	function addRssType(){
		sel = jsTree.get_selected();
		if(!sel.length) { return false; }
		jsTree.open_node(sel,function(){
			var typeName = $("#typeName").val();
			$.ajax({
				url : '${base}/blog/myAddBlogType',
				type : 'post',
				data : 'parentId='+sel[0]+"&typeName="+typeName,
				dataType : 'json',
				success : function(ajaxData){
					ajaxHandle(ajaxData,function(){
						jsTree.create_node(sel, {"type":"file","id":ajaxData.blogTypeId,"text":typeName});
						jsTree.open_node(sel);
						closeDialog();
					});
				}
			});
		});
	}
	function refresh(subjectId){
		page = 1;
		if(subjectId == undefined){
			sel = jsTree.get_selected();
			if(sel[0] == 0){
				$("#renameTypeNameBtn").attr("disabled","true");
				$("#deleteTypeNameBtn").attr("disabled","true");
			}else{
				$("#renameTypeNameBtn").removeAttr("disabled");
				$("#deleteTypeNameBtn").removeAttr("disabled");
			}
			refreshPage();
		}else{
			refreshBlogPage(subjectId);
		}
		return false;
	}
	function refreshBlogPage(subjectId){
		$("#addSubjectBtn").hide();
		$("#addBlogBtn").show();
		$("#blogDetailContent").load("${base}/blog/myBlogView?subjectId="+subjectId+"&startPage=" + (page - 1) * pageSize,countPage);
	}
	function refreshPage(){
		$("#addSubjectBtn").show();
		$("#addBlogBtn").hide();
		sel = jsTree.get_selected();
		if(sel[0] == 0){
			$("#blogDetailContent").load("${base}/blog/myBlogSubjectView?startPage=" + (page - 1) * pageSize,countPage);
		}else{
			$("#blogDetailContent").load("${base}/blog/myBlogSubjectView?blogTypeId="+sel[0]+"&startPage=0",countPage);
		}
	}
	function countPage(){
		var subjectCount = parseInt($("#subjectCount").val());
		var pageCount = Math.ceil(subjectCount / pageSize);
		if(page == 1){
			preOff();
		}else{
			preOn();
		}
		if(page < pageCount){
			nextOn();
		}else{
			nextOff();
		}
	}
	function preOn(){
		$(".pre").on("click",function(){
			page = page - 1;
			refreshPage();
		}).removeClass("disabled");
	}
	function preOff(){
		$(".pre").off("click").addClass("disabled");
	}
	function nextOn(){
		$(".next").on("click",function(){
			page = page + 1;
			refreshPage();
		}).removeClass("disabled");
	}
	function nextOff(){
		$(".next").off("click").addClass("disabled");
	}
	function renameRssType(){
		sel = jsTree.get_selected();
		if(!sel.length) { return false; }
		var typeName = $("#typeName").val();
		$.ajax({
			url : '${base}/blog/myUpdateBlogType',
			data : 'blogTypeId='+sel[0]+"&typeName="+typeName,
			type : 'post',
			dataType : 'json',
			success : function(ajaxData){
				ajaxHandle(ajaxData,function(){
					jsTree.rename_node(sel, typeName);
					closeDialog();
				});
			}
		});
	}
	function closeDialog(){
		$(".btn-default").popover('hide');
	}
	function deleteType(){
		sel = jsTree.get_selected();
		if(!sel.length) { return false; }
		if(jsTree.is_leaf(sel)){
			$.ajax({
				url : '${base}/blog/myDleteblogType',
				data : 'blogTypeId='+sel[0],
				type : 'post',
				dataType : 'json',
				success : function(ajaxData){
					ajaxHandle(ajaxData,function(){
						jsTree.delete_node(sel);
					});
				}
			});
		}
	}
	function tipMessage(message){
		$.stickyInfo(message);
	}
	function ajaxHandle(ajaxData,callback){
		if(ajaxData.result == 'success'){
			callback();
		}else{
			tipMessage(ajaxData.message);
		}
	}
	var subjectId = 0;
	function articlePage(sId){
		subjectId = sId;
		refresh(subjectId);
	}
	function backSubject(subjectId){
		refresh();
	}
	var editor;
	function addBlog(){
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
					    refresh(subjectId);
			    	});
		    	}
		    	return false;
		    }
		});
	}
	 
	$(".deleteBlog").live("click",function(){
		 $.ajax({
			 url : '${base}/blog/myDeleteBlog?ids='+$(this).attr("attr"),
			 success : function(data){
				 refresh(subjectId);
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
					    	 $.post('${base}/blog/myAddBlog',{ title: title,keyword : keyword, content: content,article_type : article_type }, function(data) {
					    		 closeDialog();
					    		 refresh(subjectId);
					    	 });
				    	 }
				    	 return false;
				     }
				 });
			 }
		 });
	});
</script>
<style>
	.pager .disabled{
		background-color: #fff;
	    color: #777;
	    cursor: not-allowed;
	}
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
<div class="hide" id="blogListTemplateDiv">
	<div class="js-topic-item topic-item zg-clear">
		<div class="topic-item-content">
			<div>
				<h3 class="topic-item-title">
					<a class="topic-item-title-link">#blogTitle#</a>
					<a attr="#blogId#" class="cancelSubscribe pointer">取消blog</a>
				</h3>
			</div>
			<div class="topic-item-feed-digest">
				#blogContent#
				<a class="more-link cursor" attr1="#blogId#" attr2="1" >more&nbsp;»</a>
			</div>
		</div>
	</div>
</div>

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

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">angrycat</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Rss</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.username} <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="${base}/login/out">quit</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div style="margin-left:auto;margin-right:auto;width:80%;margin-top:60px;">
	<div class="panel panel-default " style="width:200px;position:fixed;z-index:0;">
	  <div class="panel-heading">title</div>
	  <div class="panel-body">

		 <div class="btn-group">
			  <button type="button" id="addTypeNameBtn" class="btn btn-default" data-placement="right" data-html="true" title="新增类型" data-content='<form role="form" class="form-inline" style="width:300px;">
			        <div class="form-group" >
			        <label for="exampleInputEmail2" class="sr-only">类型</label>
			        <input type="text" placeholder="类型" id="typeName" class="form-control">
			        </div>
			        <button class="btn btn-default" onClick="addRssType();" type="button">新增</button><button class="btn btn-default" style="margin-left:5px;" onClick="closeDialog();" type="button">关闭</button>
			        </form>' title="" data-toggle="popover" class="btn btn-large btn-danger" href="#" data-original-title="标题" >新增
			  </button>
			  <button type="button" class="btn btn-default" data-placement="right" data-html="true" title="改名" data-content='<form role="form" class="form-inline" style="width:300px;">
			        <div class="form-group" >
			        <label for="exampleInputEmail2" class="sr-only">类型</label>
			        <input type="text" placeholder="类型" id="typeName" class="form-control">
			        </div>
			        <button class="btn btn-default" onClick="renameRssType();" type="button">修改</button><button class="btn btn-default" style="margin-left:5px;" onClick="closeDialog();" type="button">关闭</button>
			        </form>' title="" data-toggle="popover" class="btn btn-large btn-danger" href="#" data-original-title="标题" id="renameTypeNameBtn">修改
			  </button>
			  <button type="button" class="btn btn-default" onclick="deleteType();" id="deleteTypeNameBtn">删除</button>
			</div>
	  </div>
		
		<div class="well">
			<div id="js-tree">
				
			</div>
	    </div>
	</div>


	<div class="content-wrapper col-lg-12" style="padding-left:210px;min-width:500px;z-index:-1;">
		<div class="panel panel-default">
			<div class="panel-heading">
			    <button class="btn btn-default">返回</button>
				<button type="button" class="btn btn-default" style="float:right;" data-placement="bottom" data-html="true" title="新增" data-content='<form role="form" class="form-inline" style="width:300px;">
			        <div class="form-group" >
			        <label for="exampleInputEmail2" class="sr-only">新增主题</label>
			        <input type="text" placeholder="subject" id="subjectTitle" class="form-control">
			        </div>
			        <button class="btn btn-default" id="addSubject" type="button">新增</button><button class="btn btn-default" style="margin-left:5px;" onClick="closeDialog();" type="button">关闭</button>
			        </form>' title="" data-toggle="popover" class="btn btn-large btn-danger" href="#" data-original-title="blog地址" id="addSubjectBtn">新增主题
			    </button>
			    <button type="button" id="addBlogBtn" onclick="addBlog();" style="float:right;display:none;" class="btn btn-default">新增博客</button>
			</div>
			<div class="panel-body">
				<div class="main-content">
					
					<div class="row blogList">
						<div style="margin:10px;">
							<table id="blogDetailContent" class="table">
								
							</table>
							<ul class="pager">
							  <li><a class="pre pointer">Pre</a></li>
							  <li><a class="next pointer">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>