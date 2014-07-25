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
    <div style="position:fixed;width:60%;height:300px;background-color:white;
        border-radius:5px;text-align:center;padding:5px;
        box-shadow:0 0 10px grey;top:-248px;z-index:10;right:10px;" id="noteContentDiv">
        <textarea style="width:99%;height:265px;margin:0px;padding:0px;" id="content" ></textarea>
        <div style="position:absolute;right:20px;bottom:-25px;height:30px;
            background-color:white;width:100px;border-radius:5px;line-height:30px;">
            <div id="addNoteBtn" class="pointer">新建笔记</div>
        </div>
    </div>
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
	editor = $('#content').xheditor({plugins:plugins,tools:'Source,|,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,|,Removeformat,Align,List,|,Link,Unlink,Img,Flash,Media,|,Hr,Emot,Table,Code,|,Preview,Fullscreen,About',skin:'o2007silver',showBlocktag:false,forcePtag:false,emotMark:true});
	editor.addShortcuts('ctrl+enter',toggleEnter);
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
    	$.contextMenu({
   	        selector: '.flowClass',
   	        callback: function(key, options) {
   	        	var noteId = $(this).attr("attr");
   	            if(key == 'edit'){
   	            	returnNote(noteId);
   	            }else if(key == 'delete'){
   	            	answer=window.confirm('确认删除?');
   	            	if(answer == true){
	   	            	deleteNote(noteId);
   	            	}
   	            }
   	        },
   	        items: {
   	        	"edit": {name: "编辑", rIcon: "edit"},
   	            "delete": {name: "删除", rIcon: "delete"},
   	            "sep1": "---------",
   	            "quit": {name: "退出", icon: "quit"}
   	        }
   	    });
   	    
    	$("#toolDiv").sticky({ topSpacing: 70, center:true, className:"hey" });
    	
    	$("#addNoteBtn").click(function(){
    		toggleEnter();
    	});
    	var $noteContent = $("#noteContentDiv");
    	$(document).click(function(e){
    		if($(e.target).closest("#noteContentDiv").length == 0 && $noteContent.css("top") == '60px'){
    			editor.setSource('');
    			$("#noteContentDiv").animate({"top":"-248px"});
    		}
    	});
    	
    	$("body").keydown(function(e){
    		ctrlEnter(e,toggleEnter);
    	});
    });
	 
	function isKeyTrigger(e,keyCode){
	    var argv = isKeyTrigger.arguments;
	    var argc = isKeyTrigger.arguments.length;
	    var bCtrl = false;
	    if(argc > 2){
	        bCtrl = argv[2];
	    }
	    var bAlt = false;
	    if(argc > 3){
	        bAlt = argv[3];
	    }
	    var nav4 = window.Event ? true : false;
	    if(typeof e == 'undefined') {
	        e = event;
	    }
	    if( bCtrl && 
	        !((typeof e.ctrlKey != 'undefined') ? 
	            e.ctrlKey : e.modifiers & Event.CONTROL_MASK > 0)){
	        return false;
	    }
	    if( bAlt && 
	        !((typeof e.altKey != 'undefined') ? 
	            e.altKey : e.modifiers & Event.ALT_MASK > 0)){
	        return false;
	    }
	    var whichCode = 0;
	    if (nav4) whichCode = e.which;
	    else if (e.type == "keypress" || e.type == "keydown")
	        whichCode = e.keyCode;
	    else whichCode = e.button;

	    return (whichCode == keyCode);
	}

	function ctrlEnter(e,fuc){
	    var ie =navigator.appName=="Microsoft Internet Explorer"?true:false; 
	    if(ie){
	        if(event.ctrlKey && window.event.keyCode==13){fuc(e);}
	    }else{
	        if(isKeyTrigger(e,13,true)){fuc();}
	    }
	}
	
	function toggleEnter(){
		var $noteContent = $("#noteContentDiv");
		if($noteContent.css("top") == '60px'){
			var noteId = $("#content").attr("attr");
			if(noteId == '' || noteId == undefined){
				addNoteContentSubmit();
			}else{
				updateNoteContentSubmit(noteId);
			}
			noteContentDivUp();
		}else{
			noteContentDivDown();
		}
	}
	
	function noteContentDivUp(){
		$("#noteContentDiv").css({"top":"-248px"});
		editor.setSource('');
		editor.blur();
	}
	
	function noteContentDivDown(){
		editor.focus();
		$("#noteContentDiv").css({"top":"60px"});
	}
	
	
	function addNoteContentSubmit(){
		$.ajax({
            url : '${base}/note/my-addNote',
            data : {'content':editor.getSource()},
            type : 'post',
            dataType : 'json',
            success : function(data){
            	$("#page").html(1);
            	tipMessage(data.message);
            	onContent.onInitLoad();
            }
        });
	}
	
	function updateNoteContentSubmit(noteId){
		$.ajax({
            url : '${base}/note/my-updateNote',
            data : {'content':editor.getSource(),'noteId':noteId},
            type : 'post',
            dataType : 'json',
            success : function(data){
            	$("#page").html(1);
            	tipMessage(data.message);
            	onContent.onInitLoad();
            }
        });
	}
	
	function returnNote(noteId){
		$.ajax({
			url : '${base}/note/returnNote',
			data : {'noteId' : noteId},
			type : 'post',
			dataType : 'json',
			success : function(data){
				$("#content").attr("attr",noteId);
				editor.setSource(data.data.content);
				noteContentDivDown();
			}
		});
	}
	
	function deleteNote(noteId){
		$.ajax({
			url : '${base}/note/my-deleteNote',
			data : {'noteId' : noteId},
			type : 'post',
			dataType : 'json',
			success : function(data){
				tipMessage(data.message);
				onContent.onReload();
			}
		});
	}
	
	function tipMessage(message){
		$.stickyInfo(message);
	}
	
</script>
</body>
</html>