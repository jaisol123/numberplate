<%-- 
    Document   : RtoSerialNo
    Created on : 28 Feb, 2018, 8:34:52 PM
    Author     : AkHiLeSh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="Db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name="",msg="";
         if(request.getParameter("btn_submit")!=null)
            { 
                
                name=request.getParameter("txt_name");
               
                
                String ins="insert into tbl_serialno(serial_no)values('"+name+"')";
               boolean b=obj.executeCommand(ins);
               if(b==true)
               {
                   msg="Inserted Succeessfully!";
                  
               }
               else
               {
                 msg="Insertion fail!";   
               }
            }
              

              
              
        %>
        <form>
            
            
        <table border="1" align="center">
            <tr>
                <td>
                    Serial no:
                </td>
                <td>
                    <input type="text" name="txt_name">
                </td>
            </tr>
          
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="Register">
                </td>
            </tr>
           
        </table>
            <table align="center">
                <tr>
                    <td>
                         <label><%=msg%></label>
                    </td>
                </tr>
            </table>
                    <br>
                    
                    <table border="1" align="center">
                        <tr>
                            <td>
                                ID
                            </td>
                            <td>
                                Serial no:
                            </td>
                            
                        </tr> 
                      <%
                        int i=0;
                        String sel="select * from tbl_serialno";
                        ResultSet rs=obj.selectCommand(sel);
                        while(rs.next())
                        {
                            i++;
                      %>
                      <tr>
                          <td>
                              <%=i%>
                          </td>
                          <td>
                              <%=rs.getString("serial_no")%>
                          </td>
                         
                      </tr>
                      <%
                        }
                      %>
                    </table>
            </form>
    </body>
</html>
