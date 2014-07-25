<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>jsTree test</title>
  <!-- 2 load the theme CSS file -->
  <link rel="stylesheet" href="${base}/js/jstree/dist/themes/default/style.min.css" />
  <!-- 4 include the jQuery library -->
  <script src="${base}/js/jquery.js"></script>
  <!-- 5 include the minified jstree source -->
  <script src="${base}/js/jstree/dist/jstree.min.js"></script>
  <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree_demo').jstree({
    	'core' : {
			"themes" : { "stripes" : true },
    		  'data' : {
    		    'url' : '${base}/rss/returnTree',
    		    dataType : 'json',
    		    'data' : function (node) {
    		      return { 'id' : node.id };
    		    }
    		  }
    		},
    		
    }); 
  });
  function demo_create() {
  		var ref = $('#jstree_demo').jstree(true),
  			sel = ref.get_selected();
  		if(!sel.length) { return false; }
  		sel = sel[0];
  		sel = ref.create_node(sel, {"type":"file"});
  		if(sel) {
  			ref.edit(sel);
  		}
  	};
  	function demo_rename() {
  		var ref = $('#jstree_demo').jstree(true),
  			sel = ref.get_selected();
  		if(!sel.length) { return false; }
  		sel = sel[0];
  		ref.edit(sel);
  	};
  	function demo_delete() {
  		var ref = $('#jstree_demo').jstree(true),
  			sel = ref.get_selected();
  		if(!sel.length) { return false; }
  		ref.delete_node(sel);
  	};
  </script>
</head>
<body>
	<div class="col-md-4 col-sm-8 col-xs-8">
						<button onclick="demo_create();" class="btn btn-success btn-sm" type="button"><i class="glyphicon glyphicon-asterisk"></i> Create</button>
						<button onclick="demo_rename();" class="btn btn-warning btn-sm" type="button"><i class="glyphicon glyphicon-pencil"></i> Rename</button>
						<button onclick="demo_delete();" class="btn btn-danger btn-sm" type="button"><i class="glyphicon glyphicon-remove"></i> Delete</button>
					</div>
  <!-- 3 setup a container element -->
  <div id="jstree_demo">
    
  </div>

  
</body>
</html>