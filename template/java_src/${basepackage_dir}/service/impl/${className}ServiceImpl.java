<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service.impl;

import java.util.List;

import ${basepackage}.bean.${className}VO;
import ${basepackage}.dao.${className}DAO;
import ${basepackage}.service.${className}Service;
import com.kkgame.feeop.util.DatabaseException;

public class ${className}ServiceImpl implements ${className}Service {

	private ${className}DAO ${classNameLower}DAO;

	public ${className}DAO get${className}DAO() {
		return ${classNameLower}DAO;
	}

	public void set${className}DAO(${className}DAO ${classNameLower}DAO) {
		this.${classNameLower}DAO = ${classNameLower}DAO;
	}

	public void create(${className}VO ${classNameLower}VO) throws DatabaseException {

		${classNameLower}DAO.create(${classNameLower}VO);
	}

	public ${className}VO get${className}VO(${className}VO ${classNameLower}VO) throws DatabaseException {

		return ${classNameLower}DAO.get${className}VO(${classNameLower}VO);
	}

	public List<${className}VO> get${className}VOList(${className}VO ${classNameLower}VO)
			throws DatabaseException {

		return ${classNameLower}DAO.get${className}VOList(${classNameLower}VO);
	}

	public void update(${className}VO ${classNameLower}VO) throws DatabaseException {

		${classNameLower}DAO.update(${classNameLower}VO);
	}

}
