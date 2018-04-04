<%-- 
    Document   : RtoNumberDetails
    Created on : 28 Feb, 2018, 10:19:26 PM
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
       
       <table>
           <tr>
               <td>ID</td>
               <td>Numbers alloted to Rto</td>
           </tr>
           <%
               int i=0;
       String sel="select * from tbl_rtonumbersdetails  where rno_id='"+request.getParameter("nid") +"'";
       ResultSet rs=obj.selectCommand(sel);
       while(rs.next())
       {
           %>
           <tr>
               <td><%=i%></td>
               <td align="center"><%=rs.getString("rnod_numbers")%></td>
           </tr>
           
           <%
         i++; 
       }
       
       %>
       </table>
    </body>
</html>
