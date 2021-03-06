<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="/WEB-INF/tld/pkig-page-ajax.tld" prefix="page"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<s:if test="${classNameLower}VO.isPage==0">
<div class="row-fluid" style="min-height: 40px;padding-top: 20px">
   	<div class="span12">
   		<div class="form-inline">
   			<fieldset>   				
		   		<table style="width:99%"><tr><td>
		   		<input class="btn btn-primary" type="button" onclick="create${classNameLower}('<%=path %>/sp')" value="新增"></td>
				<td align="right"><div id="ajax-modal" class="modal hide fade" tabindex="-1"></div>
            	<label class="control-label inline" for="pname">ID</label>
   				<input id="qid" type="text" class="input-medium inline" name="${classNameLower}VO.id" value="<s:property value="${classNameLower}VO.id"/>" style="width: 100px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		<label class="control-label inline" for="pname">需组合的资费</label>
   				<input id="qname" type="text" class="input-medium inline" name="${classNameLower}VO.countFee" value="<s:property value="${classNameLower}VO.countFee"/>" style="width: 100px">
           		<button type="button" class="btn btn-primary" onclick="searchList('<%=path%>')">查 询</button>
           		<button type="reset" class="btn">清 空</button></td></tr></table>
   			</fieldset>
   		</div>
   	</div>
</div>
<div class="row">
  	<div class="span12">
  	<form class="form-horizontal" id="dataForm">
  		<fieldset>
   			<div id="dataList">
				<table id="dataTable" style="width:95%" class="table table-bordered table-striped table-hover">
					 	</s:if>
					<thead>
						<tr>
						 		
					   <#list table.columns as column>
						<#if !column.htmlHidden>
						<th >${column.constantName}</th>
						</#if>
						</#list>
						<th>操作</th>
					    </tr>
					</thead>
				<tbody>
		    	<s:iterator value="${classNameLower}VOList">  
		    		<tr >
		    		 <#list table.columns as column>
						<#if !column.htmlHidden>
						<td><#rt>
							<#compress>
							<td><s:property value="${column.columnNameLower}"/></td>
							</#compress>
						<#lt></td>
						</#if>
						</#list>
		    		<td>
	    				<a class="btn btn-info" href="javascript: detail${classNameLower}('<%=path%>/sp/${className}!detail.action','<s:property value="id"/>')" title="详情">
						详情
						</a>
						&nbsp;&nbsp;|&nbsp;&nbsp;
						<a class="btn btn-warning" href="javascript: modify${classNameLower}('<%=path%>/sp','<s:property value="id"/>')" title="修改">
						修改
						</a> </td>
		    		</tr>
				</s:iterator>
				<tr>
					<td colspan="8">
					<div class="pagelist" id="pagelist1" align="right">
						<page:paginationAjax formName="productForm" property="${classNameLower}VO.page" operation="/sp/${className}!list.action"/>
 					</div>					
				</td>
				</tr>
				</tbody>
				 	<s:if test="${classNameLower}VO.isPage==0">
				</table>
   			</div>
   			<div style='text-align:center;'>
			<img id="load" src="<%=request.getContextPath() %>/img/ajax-loader.gif" style="display: none"/>
   			</div>
  		</fieldset>
  	</form>
	</div>
</div>
<script type="text/javascript">		
	function getArgus() {		
		var argus ="";
		argus += "${classNameLower}VO.page.pageNum=";
		argus += $("#pageNum").val();
		argus += "&${classNameLower}VO.page.pageSize=";
		argus += $("#pageSize").val();
		var id = $("#qid").val();
		var name = $("#qname").val();		
        argus += "&${classNameLower}VO.id=";
        argus += id;
        argus += "&${classNameLower}VO.countFee=";
        argus += name;
        argus += "&${classNameLower}VO.isPage=1";
		return argus;
	}
	function searchList() {
		$("#load").css({"display":""});
		jQuery("#dataTable").html("");  		
		var id = $("#qid").val();
		var name = $("#qname").val();		
		url = "<%=request.getContextPath()%>/sp/${className}!list.action";
		jQuery.post(url,{"${classNameLower}VO.id":id,"${classNameLower}VO.countFee":name,"${classNameLower}VO.isPage":1
		},function(response){
			if(response=="-1") {
				showErrorToastMiddle("系统出错，请重试或联系管理员");
				$("#load").css({"display":"none"});
			} else {
				jQuery("#dataTable").html(jQuery.trim(response));
				$("#load").css({"display":"none"});
			}
		});
	}
	
	var $modal = $('#ajax-modal'); 
	$modal.on('click', '.update', function(){
		$modal.modal('loading');
	  	setTimeout(function(){
	    	$modal.modal('loading').find('.modal-body')
	        .prepend('<div class="alert alert-info fade in">' +
	        'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
	        '</div>');
	  	}, 100);
	});
	function modify${classNameLower}(path,id) {
		$('body').modalmanager('loading');
		  setTimeout(function(){
	  		$modal.load(path+'/${className}!modify.action', {"${classNameLower}VO.id":id}, function(){
	     		$modal.modal();
	    	});
		  }, 100);
	}
	function create${classNameLower}(path) {
		$('body').modalmanager('loading');
		  setTimeout(function(){
	  		$modal.load(path+'/${className}!create.action', {}, function(){
	     		$modal.modal();
	    	});
		  }, 100);
	}
	
	function detail${classNameLower}(url,id) {
		$("#breadcrumb").html("<a href=\"#\" title=\"首页\" class=\"tip-bottom\"><i class=\"icon-home\"></i>渠道中心</a><a href=\"javascript: mainLoadData('<%=request.getContextPath() %>/sp/${className}!list.action',212)\" class=\"tip-bottom\">降低资费配置列表</a><a href=\"#\" class=\"current\">降低资费配置详情</a>");
		var loading_img = $("<div class='container-fluid' style='text-align:center;padding-top:150px;min-height:350px'><img src='../img/ajax-loader.gif' /></div>");
		$("#dataContent").html('').append(loading_img);
		$.post(url,{"${classNameLower}VO.id":id},function(response){
			if(response==-1) {
				showErrorToast("提示","系统出错，请重试或联系管理员");
			} else {
				$("#dataContent").html(jQuery.trim(response));
			}
		});
	}
	//修改or新增
	function update${classNameLower}(path) {
		var id = $("#cid").val();
		 
		var url = path +'/sp/${className}!update.action';
		if(id==0) {
			url = path+'/sp/${className}!save.action';
		}
		<#list table.columns as column>
		 var ${column.columnNameLower}=$("#${column.columnNameLower}").val();
			</#list>
		$("#surebtn").attr("disabled","disabled");
		jQuery.post(url, {"${classNameLower}VO.id":id,
			 <#list table.columns as column>
			"${classNameLower}VO.${column.columnNameLower}":${column.columnNameLower},
			</#list>
		 }, 
    	function(response){   
    	 	if(jQuery.trim(response) == "-1"){
	       		showErrorToastMiddle("系统出错，请重试或联系管理员");
	        	jQuery("#surebtn").attr('disabled', 'disabled');	           
	       	} else {
	       		showInfoToastMiddle(response);
	           	doPageBottom('turn');
	            
	        }
	   });
	}
	 
	 
</script>
</s:if>
