<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kkgame.feeop.base.BaseAction;
import com.kkgame.feeop.base.PkigConstants;
import ${basepackage}.action.${className}Action;
import ${basepackage}.bean.${className}VO;
import ${basepackage}.service.${className}Service;
/**
 * @author luotianwen
 * @version 1.0
 * @since 1.0
 */
public class ${className}Action extends BaseAction {
	private static Log logger = LogFactory.getLog(${className}Action.class);	
	private ${className}VO ${classNameLower}VO;
	private List<${className}VO> ${classNameLower}VOList;
	private ${className}Service ${classNameLower}Service;
	 

	public String doList() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		try {	
			${classNameLower}VOList = ${classNameLower}Service.get${className}VOList(${classNameLower}VO);
		} catch (Exception e) {
			logger.debug(e);
			printMessage(PkigConstants.RESPONSE_ERROR);
			return null;
		}
		return ACTION_RESULT_LIST;
	}
	
	public String doCreate() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		return ACTION_RESULT_CREATE;
	}
	
	//新增配置
	public String doSave() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		try {
			${classNameLower}Service.create(${classNameLower}VO);
		} catch (Exception e) {
			logger.debug(e);
			printMessage(PkigConstants.RESPONSE_ERROR);
			return null;
		}
		printMessage("创建配置信息成功");
		return null;
	}
	 
	
	//修改通道
	public String doUpdate() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		try {
			${classNameLower}Service.update(${classNameLower}VO);
		} catch (Exception e) {
			logger.debug(e);
			printMessage(PkigConstants.RESPONSE_ERROR);
			return null;
		}
		printMessage("更新配置信息成功");
		return null;
	}
	public String doModify() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		try {
			${classNameLower}VO = ${classNameLower}Service.get${className}VO(${classNameLower}VO);
		} catch (Exception e) {
			logger.debug(e);
			printMessage(PkigConstants.RESPONSE_ERROR);
			return null;
		}
		
		return ACTION_RESULT_CREATE;
	}
	
	public String doDetail() {
		if(${classNameLower}VO == null) {
			${classNameLower}VO = new ${className}VO();
		}
		try {
			${classNameLower}VO = ${classNameLower}Service.get${className}VO(${classNameLower}VO);
		} catch (Exception e) {
			logger.debug(e);
			printMessage(PkigConstants.RESPONSE_ERROR);
			return null;
		}
		return ACTION_RESULT_DETAIL;
	}

	public ${className}VO get${className}VO() {
		return ${classNameLower}VO;
	}

	public void set${className}VO(${className}VO ${classNameLower}VO) {
		this.${classNameLower}VO = ${classNameLower}VO;
	}

	public List<${className}VO> get${className}VOList() {
		return ${classNameLower}VOList;
	}

	public void set${className}VOList(List<${className}VO> ${classNameLower}VOList) {
		this.${classNameLower}VOList = ${classNameLower}VOList;
	}

	public ${className}Service get${className}Service() {
		return ${classNameLower}Service;
	}

	public void set${className}Service(${className}Service ${classNameLower}Service) {
		this.${classNameLower}Service = ${classNameLower}Service;
	}
	 
	 

}
