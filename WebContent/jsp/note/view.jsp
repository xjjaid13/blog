<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>便签</title>
<link href="${base}/js/xDialog-master/xDialog.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/sticky-info/sticky.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/contextMenu/src/jquery.contextMenu.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/levelMenu/levelMenu.css" rel="stylesheet" type="text/css"/>
<link href="${base}/js/recordMenu/recordMenu.css" rel="stylesheet" type="text/css"/>
<style>
    #content{
        width : 90%;
        height : 150px;
    }
    .divBtn{
        background-color : #87CEEB;
        border-radius:5px;
        cursor : pointer;
    }
    .flowClass{
        padding : 10px;
        margin : 5px;
        background-color : white;
        word-break : break-all;
        border-radius:5px;
        box-shadow:0px 0px 10px grey;
    }
</style>
</head>
<body style="overflow-x:hidden;">
<%@include file="../../static/headNew.jsp" %>
<div class="main">
    <div class="container">
        <div id="container" class="span10" style="margin:0px;padding:0px;">
        
        </div>
        <div class="span2" id="menu">
        	<div id="recordWrap">
				<div id="toolDiv" class="span2" style="margin-left : 0;">
					<div id="timeMenu">
				        <ul id="timeTree">
				        </ul>
				    </div>
				    <div id="recordDiv">
				    	
				    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<div>
    
</div>
<%@include file="../../static/endNew.jsp" %>
<script src="${base}/js/levelMenu/levelMenu.js"></script>
<script src="${base}/js/recordMenu/recordMenu.js"></script>
<script src="${base}/js/sticky-info/sticky.js"></script>
<script src="${base}/js/imageLoad/imagesloaded.pkgd.js"></script>
<script src="${base}/js/masonry/jquery.masonry.js"></script>
<script src="${base}/js/masonry/js/jquery.infinitescroll.min.js"></script>
<script src="${base}/js/sticky/jquery.sticky.js"></script>
<script src="${base}/js/mousewheel/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor-1.2.1.min.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor_lang/zh-cn.js"></script>
<script type="text/javascript" src="${base}/js/xheditor-1.2.1/xheditor.js"></script>
<script type="text/javascript" src="${base}/js/contextMenu/src/jquery.contextMenu.js"></script>
<script>
	var startPage = 0;
	var onContent = {
		$container : $("#container"),
		$loading   : $("#loading"),
		initValue  : 'init',
		reloadValue : 'reload',
		scrollValue : 'scroll',
		getPage    : function(){
			return parseInt($("#page").html());
		},
		getRecordNum : function(){
			return parseInt($("#recordNum").html());
		},
		isLoad 	   : false,
		onInitLoad : function(){
			onContent.onCommon(onContent.initValue);
		},
		onReload : function(){
			onContent.onCommon(onContent.reloadValue);
		},
		onCommon : function(type){
			clearTimeout(scrollTime);
			onContent.$loading.show();
			onContent.isLoad = true;
			if(onContent.getPage() >= onContent.getRecordNum()){
				return false;
			}
			var pageValue = parseInt($("#page").html());
			var $this = onContent;
			$.ajax({
				url : '${base}/note/returnNoteContent.action',
				data : 'startPage='+pageValue+'&recordNum='+this.getRecordNum(),
				type : 'post',
				dataType : 'json',
				success : function(ajaxData){
					var data = ajaxData.data;
					if(data.length == 0){
						$this.$loading.html('未查询到记录');
						setTimeout(function(){
							$this.$loading.fadeOut();
						},5000);
						return;
					}
					$this.$loading.hide();
					var htmlContent = '';
					for(var i = 0; i < data.length; i++){
						var record = data[i];
						htmlContent += "<div class='flow flowClass' attr='"+record.noteId+"'>"+record.content+"</div>";
					}
					if(type == $this.initValue){
						$this.$container.html(htmlContent);
						$this.$container.masonry({
				            itemSelector: '.flow',
				            columnWidth: 15
				        });
						$this.$container.imagesLoaded(function(){ 
				            $(this).masonry('reload');
				        }); 
					}else if(type == $this.reloadValue || type == $this.scrollValue){
						$this.$container.append(htmlContent);
						$this.$container.imagesLoaded(function(){ 
				            $(this).masonry('reload');
				        }); 
					}
					$("#recordSum").html(ajaxData.recordSum);
					$("#pageSum").html(ajaxData.pageSum);
					handleColor();
					$this.isLoad = false;
				}
			});
		}
	};
    $(function(){
    	$("#timeTree").levelMenu({
    		yearUrl : '${base}/note/returnTreeYear',
            monthUrl : '${base}/note/returnTreeMonth',
            dayUrl : '${base}/note/returnTreeDay'
    	});
    	$("#recordDiv").recordMenu();
   	    
    	$("#toolDiv").sticky({ topSpacing: 70, center:true, className:"hey" });
    	
    });
	
</script>
</body>
</html>