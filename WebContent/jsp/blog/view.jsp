<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>博客</title>
<link type="text/css" rel="stylesheet" href="${base}/css/blog.css">
<link href="${base}/js/levelMenu/levelMenu.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/xDialog-master/xDialog.css" rel="stylesheet" type="text/css"/>
</head>     
<body>
<input type="hidden" name="page" value="${page+1}" >
<%@include file="../../static/headNew.jsp" %>
<!-- end navbar -->
<div class="main">
	<div class="container fullHeight">
	    <div class="span10" style="margin:-25px 0 0 0;padding:0px;">
			<div class="row span9">
				<div class="box-wrapper">
					<ul class="" id="blogContent" >
						
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
				<div id="toolDiv" class="span2" style="margin-left:0;margin-top:-20px;">
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
<ul id="blogListWrap" class="hide">
	<li class="span9 contentMain" >
	    <div class="blogTitle"><a target="_blank" href="${base}/blog/viewDetail/#blogId#">#title#</a></div>
	    <div class="blogContent">
	    	#shortContent# 
	    </div>
	    <div class="blogBottom">#createDate#</div>
	</li>
</ul>
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
	    $("#toolDiv").sticky({ topSpacing: 85, center:true, className:"hey" });
		 
		$("#timeTree").levelMenu({
		    yearUrl : '${base}/blog/returnTreeYear',
	        monthUrl : '${base}/blog/returnTreeMonth',
	        dayUrl : '${base}/blog/returnTreeDay'
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
					items_per_page : 15,
				    current_page : startPage - 1,
				    callback : function(startPage){
				    	startPage++;
				    	returnBlogList(startPage);
					}
				});
				var dataList = ajaxData.dataList;
				var content = "";
				var blogWrap = $("#blogListWrap").html();
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
					var createDate = blog.createDate.substring(0,10);;
					tempWrap = tempWrap.replace(/#shortContent#/,shortContent);
					tempWrap = tempWrap.replace(/#blogId#/g,blogId);
					tempWrap = tempWrap.replace(/#title#/,title);
					tempWrap = tempWrap.replace(/#blogType#/,blogType);
					tempWrap = tempWrap.replace(/#createDate#/,createDate);
					content += tempWrap;
				}
				$("#blogContent").html(content);
			}
		});
	}
	
</script>
<!-- end Boots_from -->
</html>
