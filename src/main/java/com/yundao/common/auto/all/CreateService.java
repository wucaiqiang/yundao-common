package com.yundao.common.auto.all;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.yundao.core.service.AbstractService;

/**
 * ibatis模板代码生成工具dao生成类
 * @author
 * 创建时间:2012-07-03
 */
public class CreateService {

	public List<String> colClassList;//类中字段名-类型
	public String className;//类名
	public String classPackageName;//类所在包名
	public String parentPackageName;//上层类名
	public String pk = "";//主键名
	public String dbpk = "";//数据库中主键名
	public String classNameMapper;
	public String classMapper;
	public String classNameModel;
	public String classNameModelExmaple;
	public String lowerClassName;
	public String classNameService;
	public String classNameServiceImpl;
	public CreateService(List<String> colClassList,String className,String classPackageName,String parentPackageName,String pk,String dbpk) {
		this.colClassList = colClassList;
		this.className = className;
		this.classPackageName = classPackageName;
		this.parentPackageName = parentPackageName;
		this.pk = pk;
		this.dbpk = dbpk;
		this.classNameModel = className + "Model";
		this.classNameService = className + "Service";
		this.classNameServiceImpl = className + "ServiceImpl";
		this.classNameMapper = className + "ModelMapper";
		this.classMapper = className + "Mapper";
		this.lowerClassName = Util.toLowerFrist(this.className);
		this.classNameModelExmaple = classNameModel + "Example";
	}
	
	public void createServiceJava(Util util) throws FileNotFoundException, UnsupportedEncodingException {
		List<String> fileStrList = new ArrayList<String>();
		fileStrList.add("package " + classPackageName+".service."+util.toLower(className)+";");
		fileStrList.add("");
		fileStrList.add("import java.util.List;");
		fileStrList.add("import " + classPackageName+".mapper.base." +className + "ModelMapper;");
		fileStrList.add("import " + classPackageName+".dto.BasePageDto;");
		fileStrList.add("import "+util.getUserPackageName()+".model.base."+classNameModel+";");
		fileStrList.add("import com.yundao.core.code.Result;");
		fileStrList.add("import com.yundao.core.pagination.PaginationSupport;");
		fileStrList.add("");
		fileStrList.add("import java.util.Map;");
		fileStrList.add("");
		fileStrList.add("public interface "+classNameService+"{");
		fileStrList.add("");
		fileStrList.add("");
		
		if(!pk.equals("")){
			fileStrList.add("    public Result<Integer> insert("+classNameModel+" " + lowerClassName + ") throws Exception;");
			fileStrList.add("");
			
//			fileStrList.add("    public Result<Integer> insert"+className+"List(List<"+classNameModel+"> list) throws Exception;");
			fileStrList.add("");
			
			fileStrList.add("    public Result<Integer> update("+classNameModel+" " + lowerClassName + ") throws Exception;");
			fileStrList.add("");
			
//			fileStrList.add("    public Result<Integer> update"+className+"List(List<"+classNameModel+"> list) throws Exception;");
			fileStrList.add("");
		}
		
		fileStrList.add("    public Result<Integer> delete(Long id) throws Exception;");
		fileStrList.add("");
		
//		fileStrList.add("    public Result<Integer> delete"+className+"ListByCond(List<"+classNameModel+"> list) throws Exception;");
		fileStrList.add("");
		
		if(!pk.equals("")){
			fileStrList.add("    public Result<"+classNameModel+"> select(Long id) throws Exception;");
			fileStrList.add("");
		}

		fileStrList.add("    public Result<PaginationSupport<"+classNameModel+">> selectPage("+classNameModel+" " + util.toLowerFrist(classNameModel) + ", BasePageDto pageDto) throws Exception;");
		fileStrList.add("");
		
		fileStrList.add("}");
		util.writeFile(fileStrList, "service/"+util.toLower(className)+"/", classNameService+".java");
	}
	
	public void createServiceImplJava(Util util) throws FileNotFoundException, UnsupportedEncodingException {
		List<String> fileStrList = new ArrayList<String>();
		fileStrList.add("package " + classPackageName+".service."+util.toLower(className)+".impl;");
		fileStrList.add("");
		fileStrList.add("import java.util.List;");
		fileStrList.add("import java.util.Date;");
		fileStrList.add("import " + classPackageName+".mapper.base." +className + "ModelMapper;");
		fileStrList.add("import " + classPackageName+".mapper."+util.toLower(className)+"." +className + "Mapper;");
		fileStrList.add("import " + classPackageName+".dto.BasePageDto;");
		fileStrList.add("import "+util.getUserPackageName()+".model.base."+classNameModel+";");
		fileStrList.add("import "+util.getUserPackageName()+".service.AbstractService;");
		fileStrList.add("import "+util.getUserPackageName()+".service."+util.toLower(className)+"."+classNameService+";");
		fileStrList.add("import com.yundao.core.code.Result;");
		fileStrList.add("import com.yundao.core.pagination.PaginationSupport;");
		fileStrList.add("import com.yundao.core.constant.CommonConstant;");
		fileStrList.add("import " + classPackageName+".model.base." +classNameModelExmaple + ";");
		fileStrList.add("import com.yundao.core.utils.Limit;");
		fileStrList.add("import org.apache.commons.lang3.StringUtils;");
		fileStrList.add("import org.springframework.stereotype.Service;");
		fileStrList.add("");
		fileStrList.add("import org.springframework.beans.factory.annotation.Autowired;");
		fileStrList.add("");
		fileStrList.add("@Service");
		fileStrList.add("public class "+classNameServiceImpl+" extends AbstractService  implements "+classNameService+"{");
		fileStrList.add("");
		fileStrList.add("    @Autowired");
		fileStrList.add("    private "+classNameMapper+" "+util.toLowerFrist(classNameMapper)+";");
		fileStrList.add("");
		fileStrList.add("    @Autowired");
		fileStrList.add("    private "+classMapper+" "+util.toLowerFrist(classMapper)+";");
		fileStrList.add("");

		if(!pk.equals("")){
			fileStrList.add("    public Result<Integer> insert("+classNameModel+" " + lowerClassName + ") throws Exception{");
			fileStrList.add("        "+lowerClassName+".setCreateDate(new Date());");
			fileStrList.add("        "+lowerClassName+".setId(null);");
			fileStrList.add("        int count = "+util.toLowerFrist(classNameMapper)+".insertSelective(" + lowerClassName + ");");
			fileStrList.add("        return Result.newSuccessResult(count);");
			fileStrList.add("    }");
			fileStrList.add("");
			
//			fileStrList.add("    public Result<Integer> insert"+className+"List(List<"+classNameModel+"> list) throws Exception{");
//			fileStrList.add("        log.begin(model);");
//			fileStrList.add("        int count = 0;");
//			fileStrList.add("        if (null != list) {");
//			fileStrList.add("            for (int i = 0; i < list.size(); i++) {");
//			fileStrList.add("                count += "+util.toLowerFrist(classNameMapper)+".insert"+className+"(list.get(i));");
//			fileStrList.add("            }");
//			fileStrList.add("        log.info(\"执行影响行数:\" + count);");
//			fileStrList.add("        log.end();");
//			fileStrList.add("        return Result.newSuccessResult(count);");
//			fileStrList.add("        }");
//			fileStrList.add("    }");
//			fileStrList.add("");

			fileStrList.add("    public Result<Integer> update("+classNameModel+" " + lowerClassName + ") throws Exception{");
			fileStrList.add("        "+lowerClassName+".setUpdateDate(new Date());");
			fileStrList.add("        int count = "+util.toLowerFrist(classNameMapper)+".updateByPrimaryKeySelective(" + lowerClassName + ");");
			fileStrList.add("        return Result.newSuccessResult(count);");
			fileStrList.add("    }");
			fileStrList.add("");
			
//			fileStrList.add("    public Result<Integer> update"+className+"List(List<"+classNameModel+"> list) throws Exception{");
//			fileStrList.add("        log.begin(model);");
//			fileStrList.add("        int count = 0;");
//			fileStrList.add("        if (null != list) {");
//			fileStrList.add("           for (int i = 0; i < list.size(); i++) {");
//			fileStrList.add("                count += update"+className+"ByPK(list.get(i));");
//			fileStrList.add("            }");
//			fileStrList.add("        log.info(\"执行影响行数:\" + count);");
//			fileStrList.add("        log.end();");
//			fileStrList.add("        return Result.newSuccessResult(count);");
//			fileStrList.add("        }");
//			fileStrList.add("    }");
//			fileStrList.add("");
		}
		
		fileStrList.add("    public Result<Integer> delete(Long id) throws Exception{");
		fileStrList.add("        " + classNameModel + " " + lowerClassName + " = new " + classNameModel + "();");
		fileStrList.add("        " + lowerClassName + ".setId(id);");
		fileStrList.add("        " + lowerClassName + ".setIsDelete(CommonConstant.ONE);");
		fileStrList.add("        int count = "+util.toLowerFrist(classNameMapper)+".updateByPrimaryKeySelective(" + lowerClassName + ");");
		fileStrList.add("        return Result.newSuccessResult(count);");
		fileStrList.add("    }");
		fileStrList.add("");
		
//		fileStrList.add("    public Result<Integer> delete"+className+"ListByCond(List<"+classNameModel+"> list) throws Exception{");
//		fileStrList.add("        log.begin(model);");
//		fileStrList.add("        int count = 0;");
//		fileStrList.add("        if (null != list) {");
//		fileStrList.add("           for (int i = 0; i < list.size(); i++) {");
//		fileStrList.add("                count += delete"+className+"ByCond(list.get(i));");
//		fileStrList.add("            }");
//		fileStrList.add("        log.info(\"执行影响行数:\" + count);");
//		fileStrList.add("        log.end();");
//		fileStrList.add("        return Result.newSuccessResult(count);");
//		fileStrList.add("        }");
//		fileStrList.add("    }");
//		fileStrList.add("");
		
		if(!pk.equals("")){
			fileStrList.add("    public Result<"+classNameModel+"> select(Long id) throws Exception{");
			fileStrList.add("       " + classNameModel + " model = " + util.toLowerFrist(classNameMapper)+".selectByPrimaryKey(id);");
			fileStrList.add("       return Result.newSuccessResult(model);");
			fileStrList.add("    }");
			fileStrList.add("");
		}
		
//		fileStrList.add("    public List<" + classNameModel + "> get"+className+"ListByCond("+classNameModel+" " + lowerClassName + ") throws Exception{");
//		fileStrList.add("        List<"+classNameModel+"> list="+util.toLowerFrist(classNameMapper)+".get"+className+"ListByCond(" + lowerClassName + ");");
//		fileStrList.add("        return list;");
//		fileStrList.add("    }");
//		fileStrList.add("");
		
		fileStrList.add("    public Result<PaginationSupport<"+classNameModel+">> selectPage("+classNameModel+" " + util.toLowerFrist(classNameModel) + ", BasePageDto pageDto) throws Exception{");
		fileStrList.add("		"+classNameModelExmaple+" "+util.toLowerFrist(classNameModelExmaple)+" = new "+classNameModelExmaple+"().setLimit(Limit.buildLimit(pageDto.getCurrentPage(), pageDto.getPageSize()));");

		fileStrList.add("		"+classNameModelExmaple+".Criteria criteria = "+util.toLowerFrist(classNameModelExmaple)+".createCriteria();");
		
		fileStrList.add("		String orderByClause=\"create_date desc\";");
		fileStrList.add("		if(StringUtils.isNotBlank(pageDto.getOrderColumn())){");
		fileStrList.add("		  StringBuilder orderBuider=new StringBuilder();");
		fileStrList.add("		  orderBuider.append(pageDto.getOrderColumn()).append(\" \");");
		fileStrList.add("		  if(StringUtils.isNotBlank(pageDto.getSort())){");
		fileStrList.add("			orderBuider.append(pageDto.getSort());");
		fileStrList.add("		  }else{");
		fileStrList.add("			orderBuider.append(\"desc\");");
		fileStrList.add("		  }");
		fileStrList.add("		  orderByClause=orderBuider.toString();");
		fileStrList.add("		}");
		
		fileStrList.add("		"+util.toLowerFrist(classNameModelExmaple)+".setOrderByClause(orderByClause);");
		fileStrList.add("		List<"+classNameModel+"> list = "+util.toLowerFrist(classNameMapper)+".selectByExample("+util.toLowerFrist(classNameModelExmaple)+");");
		fileStrList.add("		int totalCount = "+util.toLowerFrist(classNameMapper)+".countByExample("+util.toLowerFrist(classNameModelExmaple)+");");
		fileStrList.add("		PaginationSupport<"+classNameModel+"> result = pageDto.getPaginationSupport();");
		fileStrList.add("		result.setDatas(list);");
		fileStrList.add("		result.setTotalCount(totalCount);");
		fileStrList.add("		return Result.newSuccessResult(result);");
		fileStrList.add("    }");
		fileStrList.add("");
		
		fileStrList.add("}");
		util.writeFile(fileStrList, "service/"+util.toLower(className)+"/impl/", classNameServiceImpl+".java");
	}
}
