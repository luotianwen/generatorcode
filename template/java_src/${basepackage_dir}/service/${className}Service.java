<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
	package ${basepackage}.service;
	import java.util.List;

	import ${basepackage}.bean.${className}VO;
	import com.kkgame.feeop.util.DatabaseException;

	public interface ${className}Service {

		List<${className}VO> get${className}VOList(${className}VO ${classNameLower}VO) throws DatabaseException;
		

		void create(${className}VO ${classNameLower}VO) throws DatabaseException;
		
		void update(${className}VO ${classNameLower}VO) throws DatabaseException;
		

		${className}VO get${className}VO(${className}VO ${classNameLower}VO) throws DatabaseException;
		
		
		
	}

