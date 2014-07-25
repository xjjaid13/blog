<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../../static/css-file.jsp" %>
<link type="text/css" rel="stylesheet" href="${base}/css/blog-new.css" />
<link href="${base}/js/datatables/css/datatables_bootstrap.css" rel="stylesheet" type="text/css"/>
<%@include file="../../static/js-file.jsp" %>
<script src="${base}/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="${base}/js/datatables/js/jquery.dataTables.rowGrouping.js"></script>
<script src="${base}/js/datatables/js/ColReorderWithResize.js"></script>
<script src="${base}/js/datatables/extras/ColVis/js/ColVis.min.js"></script>
<style>
	div.dataTables_length label {
	    width: 460px;
	    float: left;
	    text-align: left;
	}
	 
	div.dataTables_length select {
	    width: 75px;
	}
	 
	div.dataTables_filter label {
	    float: right;
	    width: 460px;
	}
	 
	div.dataTables_info {
	    padding-top: 8px;
	}
	 
	div.dataTables_paginate {
	    float: right;
	    margin: 0;
	}
	 
	table {
	    margin: 3px 0;
	    clear: both;
	}
	#sample-table-2_length label{
		padding-top: 5px;
	}
	#sample-table-2_wrapper .dt_foot{
		border-radius : 0 0 5px 5px;
	}
	.ui-dialog *{
		-moz-box-sizing : content-box
	}
	.row .tableGroup{
		padding : 0;
		float : left;
	}
</style>
<script>
	//DOM ready
	$(function() {
		
		// Add a <span> to every .nav-item that has a <ul> inside
		$('.nav-item').has('ul').prepend('<span class="nav-click"><a><span class="glyphicon glyphicon-arrow-down"></span></a></span>');
		
		// Click to reveal the nav
		$('.nav-mobile').click(function(){
			$('.nav-list').toggle();
		});
	
		// Dynamic binding to on 'click'
		$('.nav-list').on('click', '.nav-click', function(){
		
			// Toggle the nested nav
			$(this).siblings('.nav-submenu').toggle();
			
			// Toggle the arrow using CSS3 transforms
			$(this).children('.nav-arrow').toggleClass('nav-rotate');
			
		});
		
		$("#addParentTypeDiv" ).dialog({
			autoOpen: false,
			width : '400px',
			modal: true,
			buttons: {
				"保存": function() {
					var parentTypeName = $("#parentTypeName").val();
					if($.trim(parentTypeName) == ''){
						alert('类型不能为空');
						return false;
					}
					$(".nav-list").append('<li class="nav-item nav-li" attr=10><a>'+parentTypeName+'</a>'
							+ $("#dropdown-div").html()
							+'</li>');
					$( this ).dialog( "close" );
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		$("#addParentType").click(function(){
			$("#addParentTypeDiv" ).dialog('open');
		});
		
		$("#addTypeDiv" ).dialog({
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
					var parentTypeSelect = $("#parentTypeSelect").val();
					var $li = $(".nav-item[attr="+parentTypeSelect+"]");
					if($.trim($li.find(">ul").attr("class")) == ''){
						$li.append('<ul class="nav-submenu"><li class="nav-submenu-item nav-li"><a>'+typeName+'</a>'
								+$("#dropdown-div").html()
								+'</li></ul>')
						   .prepend('<span class="nav-click"><span class="glyphicon glyphicon-arrow-down"></span></span>');
					}else{
						$li.find("ul").append('<li class="nav-submenu-item nav-li"><a>'+typeName+'</a>'
								+$("#dropdown-div").html()
								+'</li>');
					}
					
					$( this ).dialog( "close" );
				},
				"取消": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		$("#addType").click(function(){
			var htmlConent = '';
			$(".nav-list>li").each(function(){
				var $this = $(this);
				var id = $this.attr("attr");
				var title = $this.find(">a").html();
				htmlConent += '<option value="'+id+'">'+title+'</option>';
				$("#parentTypeSelect").html(htmlConent);
			})
			$("#addTypeDiv" ).dialog('open');
		});
		
		$(document).on("click",".rename-type",function(){
			alert('rename');
		}).on("click",".delete-type",function(){
			var $this = $(this);
			var $ul = $this.closest(".nav-submenu");
			$this.closest(".nav-li").fadeOut().remove();
			if($ul.attr("class") != undefined && $ul.find(">li").size() == 0){
				$ul.closest(".nav-item").find(">span").fadeOut().remove();
				$ul.remove();
			}
		});
		
		$('#blog-table').dataTable({
		    "sDom": "rt<'row dt_foot'<'col-md-4'l><'col-md-3'i><'col-md-5'p>>",
			"bServerSide": true,
            "sAjaxSource": "${base}/blog/returnBlogListDateTables",
            "aoColumnDefs": [ 
                    { 'bSortable': false, 'aTargets': [0] } ,
                    { "sClass": "center", "aTargets": [0] }
            ], 
            "aaSorting": [[ 2, 'desc' ]],
            "fnDrawCallback": function ( oSettings ) {
                    var that = this;
                    this.$('td:first-child').each( function (i) {
                        that.fnUpdate(oSettings._iDisplayStart + i+1, this.parentNode, 0, false, false );
                    });
                },
            "aoColumns" : [ {
                "sTitle" : "编号",
                "sName" : "blogId",
                "mData" : "blogId",
                "sClass":"table-number center"
            },{
                "sTitle" : "title",
                "sName" : "title",
                "mData" : function(data,type,row){
                    return data.title;
                }
            }, {
                "sTitle" : "createDate",
                "sName" : "createDate",
                "mData" : function(data,type,row){
                    return data.createDate;
                }
            }, {
                "sTitle" : "<s:text name='common.table.operator'/>",
                "mData" : function(data,type,row){
                	return "<a href='javascript:void()' class='blue'><i class='icon-zoom-in bigger-130'></i></a>";
                }
            }]
		});
		
		jqUpdateSize();
		$(window).resize(jqUpdateSize);
	});
	function jqUpdateSize(){
	    var height = $(window).height()-50;
	    $(".nav-list").height(height);
	};
</script>
</head>
<body>
	<div id="dropdown-div" class="hide">
		<div class="dropdown">
			<span data-toggle="dropdown" class="ui-icon ui-icon-wrench"></span>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<li role="presentation"><a class="rename-type" tabindex="-1" role="menuitem">修改名称</a></li>
				<li class="divider" role="presentation"></li>
				<li role="presentation"><a class="delete-type" tabindex="-1" role="menuitem">删除类别</a></li>
			</ul>
		</div>
	</div>
	
	<div id="addParentTypeDiv" class="form-horizontal" title="新增父类">
		<div class="form-group  col-md-12">
			<label class="col-md-4 control-label">父类名称<font class="requiredFlag">*</font></label><input type="text" id="parentTypeName" class="col-md-8">
		</div>
	</div>
	<div id="addTypeDiv" class="form-horizontal" title="新增子类">
		<div class="form-group  col-md-12">
			<label class="col-md-4 control-label">子类名称<font class="requiredFlag">*</font></label><input type="text" id="typeName" class="col-md-8">
		</div>
		<div class="form-group  col-md-12">
			<label class="col-md-4 control-label">父类<font class="requiredFlag">*</font></label>
			<select id="parentTypeSelect" class="col-md-8 input-sm">
				
			</select>
		</div>
	</div>
	<%@include file="../../static/left-nav.jsp" %>
    <div style="margin-left:100px;">
		<nav class="nav" style="float:left;margin-left:20px;margin-top:20px;">
			<span class="nav-btn" id="addParentType">新增父类</span>
			<span class="nav-btn" id="addType">新增子类</span>
			<div style="clear:both;height:0;"></div>
			<ul class="nav-list">
				<li attr="1" class="nav-item nav-li">
					<a href="?=home">Home</a>
					<div class="dropdown">
					    <span data-toggle="dropdown" class="ui-icon ui-icon-wrench"></span>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
					    	<li role="presentation"><a class="rename-type" tabindex="-1" role="menuitem">alter</a></li>
					    	<li class="divider" role="presentation"></li>
			                <li role="presentation"><a class="delete-type" tabindex="-1" role="menuitem">delete</a></li>
					    </ul>
					</div>	
					<ul class="nav-submenu">
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-1">Submenu item 1111</a>
							<div class="dropdown">
							    <span data-toggle="dropdown" class="ui-icon ui-icon-wrench"></span>
							    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							    	<li role="presentation"><a class="rename-type" tabindex="-1" role="menuitem">alter</a></li>
							    	<li class="divider" role="presentation"></li>
					                <li role="presentation"><a class="delete-type" tabindex="-1" role="menuitem">delete</a></li>
							    </ul>
							</div>
						</li>
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-2">Submenu item 2</a>
							<div class="dropdown">
							    <span data-toggle="dropdown" class="ui-icon ui-icon-wrench"></span>
							    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
							    	<li role="presentation"><a class="rename-type" tabindex="-1" role="menuitem">alter</a></li>
							    	<li class="divider" role="presentation"></li>
					                <li role="presentation"><a class="delete-type" tabindex="-1" role="menuitem">delete</a></li>
							    </ul>
							</div>
						</li>
					</ul>
				</li>
				<li attr="2" class="nav-item nav-li">
					<a href="?=about">About</a>
					<div class="dropdown">
					    <span data-toggle="dropdown" class="ui-icon ui-icon-wrench"></span>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
					    	<li role="presentation"><a class="rename-type" tabindex="-1" role="menuitem">alter</a></li>
					    	<li class="divider" role="presentation"></li>
			                <li role="presentation"><a class="delete-type" tabindex="-1" role="menuitem">delete</a></li>
					    </ul>
					</div>
				</li>
				<li attr="3" class="nav-item nav-li">
					<a href="?=services">Services</a>
					<ul class="nav-submenu">
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-1">Submenu item 1</a>
						</li>
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-2">Submenu item 2</a>
						</li>
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-3">Submenu item 3</a>
						</li>
						<li class="nav-submenu-item nav-li">
							<a href="?=submenu-4">Submenu item 4</a>
						</li>
					</ul>
				</li>
				<li attr="4" class="nav-item nav-li">
					<a href="?=portfolio">Portfolio</a>
				</li>
				<li attr="5" class="nav-item">
					<a href="?=testimonials">Testimonials</a>
				</li>
				<li attr="6" class="nav-item">
					<a href="?=contact">Contact</a>
				</li>
			</ul>
		</nav>
		<div class="table-response col-md-8" style="margin-top:20px;">
			<table id="blog-table" class="table table-striped table-bordered bootstrap-datatable datatable">
									
			</table>
		</div>
	</div>
</body>
</html>