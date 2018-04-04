<%-- 
    Document   : RtoRegistration
    Created on : 28 Feb, 2018, 7:58:49 PM
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
            
            if(request.getParameter("btn_submit")!=null)
            { 
                
            String name="",regno="",msg="";
            String uname="", pswd="", log="";
            name=request.getParameter("txt_name");
            regno=request.getParameter("txt_regno");
            uname=request.getParameter("txt_uname");
            pswd=request.getParameter("txt_pswd");
            
            
             String insQry1="insert into tbl_login(uname,upasswrd,user_type) values('"+uname+"','"+pswd+"','RTO')";
            
            boolean b1=obj.executeCommand(insQry1);
            
            
               if(b1==true)
               {
                   String sel="select max(login_id) as login from tbl_login";
                        ResultSet rs=obj.selectCommand(sel);
                        if(rs.next())
                        {
                          log=rs.getString("login");
                         
                        }
                  
               }
               
               String ins="insert into tbl_rto (rto_name,rto_regno,login_id)values('"+name+"','"+regno+"','"+log+"')";
               boolean b=obj.executeCommand(ins);
               out.println(ins);
            }
        %>
        
        <h1 align="center">Registration</h1>

        <form>
        <table border="1" align="center">
            <tr>
                <td>
                    Rto Name
                </td>
                <td>
                    <input type="text" name="txt_name">
                </td>
            </tr>
            <tr>
                <td>
                    Rto Reg.no
                </td>
                <td>
                    <input type="text" name="txt_regno">
                </td>
            </tr>
            
            <tr>
                <td>
                    username
                </td>
                <td>
                    <input type="text" name="txt_uname">
                </td>
            </tr>
            
            <tr>
                <td>
                    password
                </td>
                <td>
                    <input type="password" name="txt_pswd">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="Register">
                </td>
            </tr>
           
        </table>
            
            
            
            <h1 align="center">Registered RTO</h1>

                    <br>
                    
                    <table border="1" align="center">
                        <tr>
                            <td>
                                ID
                            </td>
                            <td>
                                RTO Name
                            </td>
                            <td>
                               RTO Reg.no
                            </td>
                        </tr> 
                      <%
                        int i=0;
                        String sel="select * from tbl_rto";
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
                              <%=rs.getString("rto_name")%>
                          </td>
                          <td>
                              <%=rs.getString("rto_regno")%>
                          </td>
                      </tr>
                      <%
                        }
                      %>
                    </table>
            </form>
    </body>
</html>
