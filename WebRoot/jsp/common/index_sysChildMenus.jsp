<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<ul id="sysMenu_${param.id}" ></ul>
<script type="text/javascript">
	$().ready(function(){
		$("#sysMenu_"+'${param.id}').tree({
		    url:"<%=path%>/menuList!getList.do",
		  	lines:true,
  			loadFilter: function(data,parent){
  				var filterData = [];
  				$.each(data.menus,function(index,value){
  					var treeNote = {"id":value.id,"text":value.title,"iconCls":value.iconCls};
  					treeNote.attributes = {};
  					treeNote.attributes.isParent = value.isParent;
  					if(value.isParent){
						treeNote.state = "closed";
  					}else{
  						treeNote.attributes.url = value.url;
  					}
  					filterData[index] = treeNote;
  				});
  		    	return filterData;
  		    },
  		   	onClick:function(note){
  		   		if(!note.attributes.isParent){
  		   			if(note.attributes.url.indexOf("?") != -1){
  		   				$Index.loadPageCenter(note.attributes.url+"&note="+note.id,note.text);
  		   			}else{
  		   				$Index.loadPageCenter(note.attributes.url+"?note="+note.id,note.text);
  		   			}
  		   		}else{
  		   			$("#sysMenu_"+'${param.id}').tree('toggle',note.target);
  		   		}
  		    },
  		  	onBeforeLoad:function(node, param){
  		  		if(!param.id){
  		  			param.id = ${param.id};
  		  		}
  		  	}
		});	
	})
</script>