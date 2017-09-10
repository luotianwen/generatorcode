<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
	package ${basepackage}.dao.impl;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import ${basepackage}.bean.${className}VO;
import ${basepackage}.dao.${className}DAO;
import com.kkgame.feeop.util.DatabaseException;

public class ${className}DAOImpl extends SqlMapClientDaoSupport implements
		${className}DAO { 

	//新增
	public void create(${className}VO ${classNameLower}VO) throws DatabaseException {
		int id = (Integer)getSqlMapClientTemplate().insert("${classNameLower}SqlMap.create", ${classNameLower}VO);
	}
	 
	
	public ${className}VO get${className}VO(${className}VO ${classNameLower}VO) throws DatabaseException {
		return (${className}VO) getSqlMapClientTemplate().queryForObject("${classNameLower}SqlMap.get${className}VO", ${classNameLower}VO);
	}
	
	public List<${className}VO> get${className}VOList(${className}VO ${classNameLower}VO)
			throws DatabaseException {
		int count = (Integer) getSqlMapClientTemplate().queryForObject("${classNameLower}SqlMap.get${className}VOListCount", ${classNameLower}VO);
		${classNameLower}VO.getPage().setTotalRow(count);
		return getSqlMapClientTemplate().queryForList("${classNameLower}SqlMap.get${className}VOList", ${classNameLower}VO);
	}
	
	
	//修改
	public void update(${className}VO ${classNameLower}VO) throws DatabaseException {
		getSqlMapClientTemplate().update("${classNameLower}SqlMap.update", ${classNameLower}VO);
	}
	
 

	 
	 

}
