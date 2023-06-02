/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project.tracking.system.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import project.tracking.system.entity.IdName;

/**
 *
 * @author hp
 */
public class ExtractProjectIdNameEmp {
    
    public List<IdName> getAllIdName(int pid, String profile){
        Connection con=null;
        try {
            
            con = ConnectionProvider.getConncection();
            Statement insert = con.createStatement();
            ResultSet set = insert.executeQuery("select pts_"+profile+".eid, emp_name from pts_"+profile+" Inner Join pts_employee on pts_"+profile+".eid=pts_employee.eid where pts_"+profile+".pid="+pid);
            List<IdName> list = new ArrayList<IdName>();
            while (set.next()) {                
                IdName idname = new IdName(set.getInt(1),set.getString(2));
                list.add(idname);
            }
            return list;
            
        } catch (Exception e) {
             return null;
        } finally {
            try {
            con.close();
            } catch (Exception e) {}
        }
    }
    
}
