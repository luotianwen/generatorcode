<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<s:hidden id="cid" name="${classNameLower}VO.id"/>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h2><s:if test="${classNameLower}VO.id>0">修改资费组合配置</s:if><s:else >新建资费组合配置</s:else></h2>
</div>
<div class="modal-body">
	<form class="form-horizontal" style="margin: 0px;">
	<fieldset>
	
<!-- ONGL access static field: @package.class@field or @vs@field -->
<#list table.columns as column>
	<#if !column.htmlHidden>
	
	<div class="control-group">
		<label class="control-label" for="${column.columnNameLower}Key">${column.constantName}</label>
		<div class="controls">
			<input id="${column.columnNameLower}" type="text" class="input-medium" name="${classNameLower}VO.${column.columnNameLower}" onkeyup="this.value=this.value.replace(/[^\d]/g,'');"  size="11" value="<s:property value="${classNameLower}VO.${column.columnNameLower}"/>"/>
		</div>
	</div>
	 
	
	</#if>
</#list>
	
	   
	</fieldset>
	</form>
</div>
<div class="modal-footer">
 <button type="button" id="surebtn" onclick="javascript:update${classNameLower}('<%=path %>');" class="btn btn-primary"><s:if test="${classNameLower}VO.id>0">修 改</s:if><s:else >确 定</s:else></button>
 <button type="reset" class="btn">重设</button>
</div> 
