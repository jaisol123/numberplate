<%-- 
    Document   : login
    Created on : Feb 14, 2018, 10:41:48 PM
    Author     : ckc
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
        <form
        <% 
        String username="";
        String password="";
        if(request.getParameter("btnsub")!=null)
        {
            username=request.getParameter("uname");
            password=request.getParameter("upaswrd");
            
            String sel="select * from tbl_customer c inner join tbl_login l on l.login_id=c.login_id where uname='"+username+"'and upasswrd='"+password+"'";
            
                      ResultSet rs=obj.selectCommand(sel);
                        if(rs.next())
                        {
                         session.setAttribute("cid", rs.getString("cust_id"));
                         response.sendRedirect("../Customer/home.jsp");
                        } 
                        else
                        {
                           String sel1="select * from tbl_rto r inner join tbl_login l on l.login_id=r.login_id where uname='"+username+"'and upasswrd='"+password+"' and status=1";
            
                          ResultSet rs1=obj.selectCommand(sel1);
                          if(rs1.next())
                           {
                           session.setAttribute("rid", rs1.getString("rto_id"));
                           response.sendRedirect("../RTO/home.jsp");
                          }
                        }
        
        }
        
        
        %>
        
        
        
        <h1 align="center"> <b>Login </b></h1>
        <table align="center">
            
        <tr>
                <td>
                    USERNAME 
                </td>
                <td>
                    <input type="text" name="uname"  >
                </td>
            </tr>
            
            <tr>
                <td>
                    PASSWORD 
                </td>
                <td>
                    <input type="password" name="upaswrd"   >
                </td>
            </tr>
            
             <tr colspan="2" align="center">
            <td>
               <input type="submit" name="btnsub" value="SUBMIT">
               <input type="reset" name="cancel" value="CANCEL">
             </td>
            </tr>
        </table>
        </form>
    </body>
</html>
