<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航</title>
<link type="text/css" rel="stylesheet" href="${base}/css/weblinkNew.css" />
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="${base}/js/cookie/jquery.cookie.js"></script>
<%@include file="../../static/css-file.jsp" %>
<%@include file="../../static/js-file.jsp" %>
<script>
	$(function(){
		var startIndex = 0;
		
		$("#toggleedit").toggle(function(){
			$(this).html('取消编辑');
			$("#nav").removeClass("view");
			$("#nav>ul").sortable({
				disabled: false
			});
			$(".nav-panel").sortable({
				disabled: false
			});
		},function(){
			$(this).html('编辑');
			$("#nav").addClass("view");
			$("#nav>ul").sortable({
				disabled: true
			});
			$(".nav-panel").sortable({
				disabled: true
			});
		});
		
		$("#nav>ul").sortable({
			start : function(event, ui){
				startIndex = ui.item.index();
			},
			stop : function(event, ui){
				var item = ui.item;
				if(item.index() != startIndex){
					$.ajax({
						url : '${base}/weblink/updateWebLinkData',
						data : 'handleType=webLinktype&fromIndex='+startIndex+'&toIndex='+item.index(),
						type : 'post',
						dataType : 'json',
						success : function(ajaxData){
							
						}
					});
				}
			},
			disabled: true
		});
		
		
		dragUrlInit();
		
		$("#addUrlTypeDiv" ).dialog({
			autoOpen: false,
			width : '400px',
			modal: true,
			buttons: {
				"保存": function() {
					var typeName = $("#typeName").val();
					if($.trim(typeName) == ''){
						alert('类型不能为空');
						return false;
					}
					
					$( this ).dialog( "close" );
					var $thisDialog = $(this);
					$.ajax({
						url : '${base}/weblink/addWebLinkData',
						data : 'handleType=webLinktype&title='+typeName,
						type : 'post',
						dataType : 'json',
						success : function(ajaxData){
							var htmlContent = '<li class="nav-grid" attr="${linkType.index}" >';
							htmlContent += '<span style="left:10px;">'+typeName+'</span>';
							htmlContent += '<ul class="connectedSortable nav-panel">';
							htmlContent += '</ul><ul class="cb"></ul></li>';
							$("#nav-ul").append(htmlContent);
							dragUrlInit();
							$thisDialog.dialog( "close" );
						}
					});
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		$("#addUrlType").click(function(){
			$("#addUrlTypeDiv" ).dialog('open');
		});
		
		$("#addUrlDiv" ).dialog({
			autoOpen: false,
			width : '400px',
			modal: true,
			buttons: {
				"保存": function() {
					var url = $("#url").val();
					var urlName = $("#urlName").val();
					if($.trim(url) == ''){
						alert('url不能为空');
						return false;
					}
					var $thisDialog = $(this);
					var urlTypeIndex = $("#urlType").get(0).selectedIndex;
					$.ajax({
						url : '${base}/weblink/addWebLinkData',
						data : 'handleType=webLink&title='+urlName+'&url='+url+'&typeIndex='+urlTypeIndex,
						type : 'post',
						dataType : 'json',
						success : function(ajaxData){
							if(ajaxData.result == 'success'){
								var webLink = ajaxData.webLink;
								var webLinkName = '';
								if(webLink.name.length > 9){
									webLinkName += webLink.name.substring(0,9) + '...';
								}else{
									webLinkName += webLink.name;
								}
								var urlContent = '';
								urlContent += '<a class="panel-content btn btn-default" >';
								urlContent += '<img class="iconClass" src="' + webLink.icon + '" />';
								urlContent += '<span title="'+webLink.name+'">';
								urlContent += webLinkName;
								urlContent += '</span>';
								urlContent += '<button class="btn btn-default fr" type="submit"><span class="ui-icon ui-icon-close"></span></button>';	
								urlContent += '</a>';
								$(".nav-grid").eq(urlTypeIndex + 1).find(".nav-panel").append(urlContent);
								$("#urlName").val("");
								$("#url").val("");
								$thisDialog.dialog( "close" );
							}else{
								alert('URL解析错误，重新输入url');
							}
							
						}
					});
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		$("#addUrl").click(function(){
			var selectContent = '';
			$(".nav-grid>span").each(function(){
				var $this = $(this);
				selectContent += '<option>'+$this.html()+'</option>';
			});
			$("#urlType").html(selectContent);
			$("#addUrlDiv").dialog('open');
		});
		
		$(document).on( "click", ".deleteUrl", function(e) {
			var $this = $(this);
			var urlIndex = $this.closest("a").index();
			var urlType = $this.closest("li").index();
			$.ajax({
				url : '${base}/weblink/my-deleteWebLink',
				data : 'typeIndex='+urlType + '&urlIndex=' + urlIndex,
				type : 'post',
				dataType : 'json',
				success : function(data){
					if(data.result == 'success'){
						$this.parent().fadeOut();
					}
				}
			});
			return false;
			e.stopPropagation();  
		}).on("click",".deleteUrlType",function(e){
			if($(event.target).is(".ui-icon-close")){
				var $this = $(this);
				var urlIndex = $this.closest("li").index();
				$.ajax({
					url : '${base}/weblink/my-deleteWebLinktype',
					data : 'typeIndex='+urlIndex,
					type : 'post',
					dataType : 'json',
					success : function(data){
						if(data.result == 'success'){
							$this.closest("li").fadeOut();
						}
					}
				});
			}
		}).on("mouseenter",".nav-grid",function(){
			var $this = $(this);
			if($this.find(".panel-content").attr("class") == undefined){
				$this.find(".nav-panel").append("<a class='deleteUrlType fr cursor-pointer'>删除类型</a>");
			}
		}).on("mouseleave",".nav-grid",function(){
			var $this = $(this);
			if($this.find(".panel-content").attr("class") == undefined){
				$this.find(".nav-panel").html('');
			}
		});
		
	});
	
	function dragUrlInit(){
		$(".nav-panel").sortable({
			placeholder: "sort-placeholder panel-content",
			connectWith: ".connectedSortable",
			start : function(event, ui){
				startIndex = ui.item.index();
				oringType = ui.item.closest('.nav-grid').index();
			},
			stop : function(event, ui){
				var item = ui.item;
				var currentType = item.closest('.nav-grid').index();
				if(item.index() != startIndex || oringType != currentType){
					$.ajax({
						url : '${base}/weblink/updateWebLinkData',
						data : 'handleType=webLink&fromIndex='+startIndex+'&toIndex='+item.index()+'&currentType='+currentType+'&oringType='+oringType,
						type : 'post',
						dataType : 'json',
						success : function(ajaxData){
							
						}
					});
				}
			},
			disabled: true
		});
	}
</script>
</head>
<body>
<div id="addUrlDiv" class="form-horizontal" title="新增链接">
	<div class="form-group  col-md-12">
		<label class="col-md-4 control-label">选择类型<font class="requiredFlag">*</font></label><select id="urlType" class="col-md-8 input-sm"></select>
	</div>
	<div class="form-group  col-md-12">
		<label class="col-md-4 control-label">输入url<font class="requiredFlag">*</font></label><input id="url" type="text" class="col-md-8">
	</div>
	<div class="form-group  col-md-12">
		<label class="col-md-4 control-label">输入标题</label><input type="text" id="urlName" class="col-md-8">
	</div>
</div>
<div id="addUrlTypeDiv" class="form-horizontal" title="新增类型">
	<div class="form-group  col-md-12">
		<label class="col-md-4 control-label">类型名称<font class="requiredFlag">*</font></label><input type="text" id="typeName" class="col-md-8">
	</div>
</div>
<div class="container">
	<%@include file="../../static/left-nav.jsp" %>
	
	<div id="nav" class="view">
		<ul id="nav-ul">
			<li class="nav-grid">
				<a class="fr cursor-pointer" id="toggleedit">编辑</a>
				<a class="fr cursor-pointer" id="addUrl" class="mr5">新增</a>
				<a class="fr cursor-pointer" id="addUrlType" class="mr5">新增类型</a>
			</li>
			<c:forEach items="${webLinktypeList}" var="webLinktype" varStatus="linkType" >
				<li class="nav-grid">
					<span>${webLinktype.name}</span>
					<c:choose>
						<c:when test="${webLinktype.webLinkList == null || webLinktype.webLinkList[0].name == null}">
							<div class="connectedSortable nav-panel">
							
							</div>
						</c:when>
						<c:otherwise>
							<div class="connectedSortable nav-panel">
								<c:forEach items="${webLinktype.webLinkList}" var="webLink" >
									<a href="${webLink.link}" target="_blank" class="panel-content btn btn-default">
										<img class="iconClass" src="${webLink.icon}" />
										<span title="${webLink.name}">
												<c:choose>
												   <c:when test="${fn:length(webLink.name) > 9}">
												   	   <c:out value="${fn:substring(webLink.name, 0, 9)}..." /> 
												   </c:when>
												   <c:otherwise>
												       ${webLink.name}
												   </c:otherwise>
												</c:choose>
										</span>
										<button class="deleteUrl btn btn-default fr" type="submit"><span class="ui-icon ui-icon-close"></span></button>
									</a>
								</c:forEach> 
							</div>
					   </c:otherwise>
					</c:choose>
					<ul class="cb"></ul>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>
