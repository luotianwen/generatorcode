<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.bean;
import com.kkgame.feeop.base.BasicVO; 

public class ${className}VO  extends BasicVO {
	 
	
	//columns START
	<#list table.columns as column>
    /**
     * ${column.columnAlias!}       db_column: ${column.sqlName} 
     */ 	
	private ${column.javaType} ${column.columnNameLower};
	</#list>
	//columns END

 
	<#list table.columns as column>
	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameLower} = value;
	}
	
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	</#list>

	
	 
}
 
 