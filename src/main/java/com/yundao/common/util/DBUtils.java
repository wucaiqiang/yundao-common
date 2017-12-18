

package com.yundao.common.util;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.ibatis.jdbc.ScriptRunner;

import com.esotericsoftware.minlog.Log;
import com.yundao.common.dto.tenant.TenantInitReqDto;
import com.yundao.core.utils.BooleanUtils; 

/**
 * Function: 
 * Reason:	  
 * Date:     2017年10月11日 下午4:19:17 
 * @author   欧阳利
 * @version   
 */
public class DBUtils {
	
	
	
	
    public static void excelDBFile(String fileName, String url, String username, String password) {
        try {
//              url = "jdbc:mysql://rds996n72786ft1i3ee4o.mysql.rds.aliyuncs.com:3306/wm_tenant_zr?useUnicode=true&characterEncoding=UTF-8";
                String driver ="com.mysql.jdbc.Driver";
//              username = "yundao_dev";
//              password = "YunDao_Dev@com";

            Class.forName(driver).newInstance();
            Connection conn =DriverManager.getConnection(url, username, password);
            ScriptRunner runner = new ScriptRunner(conn);
            runner.setEscapeProcessing(false);
            runner.setSendFullScript(true); 
            ClassLoader classLoader = DBUtils.class.getClassLoader();  
            URL resource = classLoader.getResource("db/create_tenant/"+fileName);  
            String path = resource.getPath();  
            runner.runScript(new InputStreamReader(new FileInputStream(path), "UTF-8"));
            runner.closeConnection();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
//    public static void main(String[] args){
//    	excelDBFile("2-tenant_schema.sql", 
//    			"jdbc:mysql://rds996n72786ft1i3ee4o.mysql.rds.aliyuncs.com:3306/wm_tenant_zr?useUnicode=true&characterEncoding=UTF-8", 
//    			"yundao_dev",
//    			"YunDao_Dev@com");
//    }
	
	
	/**
	 * 测试数据是否存在
	 * testDBExist:
	 * @author: 欧阳利
	 * @return
	 * @description:
	 */
    public static boolean testDBExist(String url, String user, String password) throws Exception{
    	// 获取连接
    	Connection conn =  getConnection( url,  user,  password);
    	if(conn == null){
    		return false;
    	}else{
    		// 关闭连接
        	close(conn);
    		return true;
    	}
    }
    
    public static void insertTenantId(String url, String user, String password,Long tenandId,TenantInitReqDto dto)throws Exception{
    	//INSERT INTO tenant_temp_table(tenant_id)VALUES(1)
    	Connection conn = null;
    	Statement stmt = null;
    	try{
    		conn =  getConnection(url,user, password);
    		stmt = conn.createStatement();
    		String sql = "INSERT INTO tenant_temp_table(tenant_id,sms_access_key_id,sms_access_key_secret,sms_sign,sms_is_default)VALUES("
    		                                          +tenandId+",'"+dto.getSmsAccessKeyId()+"','"+dto.getSmsAccesskeySecret()+"','"+dto.getSmsSign()+"',"+dto.getSmsIsDefault()+")";
    		stmt.executeUpdate(sql);
			
    	}finally {
    		try{
    	       if(stmt!=null)
    	            conn.close();
    	      }catch(SQLException se){
    	    }
    		
    		close(conn);
		}
    }
    
    
    
    /**
     * 测试数据库表是否存在
     * testTableExist:
     * @author: 欧阳利
     * @return
     * @description:
     */
    public static boolean testTableExist(String url, String user, String password,List<String> tableNames)throws Exception{
    	if(BooleanUtils.isEmpty(tableNames)){
    		return false;
    	}
    	boolean isExistTable = false;
    	Connection conn = null;
    	try{
    		conn =  getConnection(url,user, password);
	    	for(String tableName : tableNames){
	    		String sql = "select count(1) from "+tableName;
	    		PreparedStatement pst = null;
				try {
					pst = conn.prepareStatement(sql);// 准备执行语句
					pst.executeQuery();//执行语句，得到结果集  
				}
				catch (Exception e) {
					continue;
				}finally {
					 close(pst);
				}
				isExistTable = true;
				 
	    	}
    	}finally {
    		close(conn);
		}
    	
    	return isExistTable;
    }
    
    
    /**
     * 获取连接
     * getConnection:
     * @author: 欧阳利
     * @param url
     * @param user
     * @param password
     * @return
     * @description:
     */
    private static Connection getConnection(String url, String user, String password){
    	// url = "jdbc:mysql://rds996n72786ft1i3ee4o.mysql.rds.aliyuncs.com:3306/wm_tenant_zcm?useUnicode=true&characterEncoding=UTF-8";
    	String name = "com.mysql.jdbc.Driver";
    	Connection conn = null;
    	try {  
            Class.forName(name);//指定连接类型  
            conn = DriverManager.getConnection(url, user, password);//获取连接  
        } catch (Exception e) {  
            return conn;
        } 
    	return conn;
    }
    
    /**
     * 关闭连接
     * close:
     * @author: 欧阳利
     * @param conn
     * @throws SQLException
     * @description:
     */
    public static void close(Connection conn) throws SQLException {  
        try {  
        	if(conn != null){
        		 conn.close();  
        	}
        } catch (SQLException e) {  
            Log.error("关闭数据库连接异常",e); 
            throw e;
        }  
    } 
    
    /**
     * 关闭预处理
     * close:
     * @author: 欧阳利
     * @param pst
     * @throws SQLException
     * @description:
     */
    public static void close(PreparedStatement pst) throws SQLException{  
        try {  
        	if(pst != null){
        		pst.close();  
        	}
        } catch (SQLException e) {  
        	 Log.error("关闭预处理异常",e); 
             throw e; 
        }  
    } 
}

