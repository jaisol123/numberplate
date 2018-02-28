<%-- 
    Document   : customerview
    Created on : Feb 21, 2018, 10:40:42 PM
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
        
         <%
        
        
        
    
        
        
        %>
        
        
        <h1 align="center">CUSTOMER LIST</h1>
        <form name="register" method=post">
                <table border="1" align="center">
                <tr><th>Sl.No</th><th>NAME</th><th>ADDRESS </th><th>ADHAR NO </th><th> PHONE NO</th><th> EMAIL</th><th>PLACE</th><th> RTO NO </th></tr>
                          
                        <%int i = 1;
                            String sel = "select * from tbl_customer c inner join tbl_place p on p.pl_id=c.pl_id inner join tbl_rtono r on r.rtono_id=c.rtono_id  where r.rto_id= '"+session.getAttribute("rid")+"'";
                            ResultSet sr=obj.selectCommand(sel);
                      while(sr.next())
                     {
                         %>
                <tr>
                    <td><%=i%></td>
                    <td><%=sr.getString("cust_name")%></td>
                    <td><%=sr.getString("cust_address")%></td>
                    <td><%=sr.getString("cust_adharno")%></td>
                    <td><%=sr.getString("cust_contactno")%></td>
                    <td><%=sr.getString("cust_email")%></td>
                    <td><%=sr.getString("pl_name")%></td>
                    <td><%=sr.getString("number")%></td>
                    <td><a href="Vehreg.jsp?rid=<%=sr.getString("cust_id")%>">REGISTER</a></td><br>
                    <td><a href="customerview.jsp?reid=<%=sr.getString("cust_id")%>">REJECT</a></td></tr>
                    <%
                    i++;
                        }
                  %>



            
  
  
  
        </form>            
    </body>
</html>
