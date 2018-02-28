<%-- 
    Document   : rtoapprovel
    Created on : Feb 20, 2018, 10:48:30 PM
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
        if(request.getParameter("Aid")!=null)
        {
           session.setAttribute("rtoid", request.getParameter("Aid"));
           
          String upd="update tbl_rto set status=1 where rto_id='"+request.getParameter("Aid")+"'";
          boolean b=obj.executeCommand(upd);
          response.sendRedirect("../Admin/rto_number.jsp");
        }
        
        
         if(request.getParameter("rid")!=null)
        {
          String del="update tbl_rto set status=2 where rto_id='"+request.getParameter("rid")+"'";
          boolean b=obj.executeCommand(del);
          
        }
        
        
        %>
        <h1 align="center">RTO APPROVEL</h1>
        <form name="approve" method=post">
                <table border="1" align="center">
                <tr><th>Sl.No</th><th>RTO OFFICE</th><th>ADDRESS </th><th> PHONE NO:</th><th> EMAIL</th></tr>
                          
                        <%int i = 1;
                            String sel = "select * from tbl_rto where status=0";
                            ResultSet sr=obj.selectCommand(sel);
                      while(sr.next())
                     {
                         %>
                <tr>
                    <td><%=i%></td>
                    <td><%=sr.getString("office_regno")%></td>
                    <td><%=sr.getString("address")%></td>
                    <td><%=sr.getString("phoneno")%></td>
                    <td><%=sr.getString("email")%></td>
                    
                    <td><a href="rtoapprovel.jsp?Aid=<%=sr.getString("rto_id")%>">APPROVEL</a></td><br>
                <td><a href="rtoapprovel.jsp?rid=<%=sr.getString("rto_id")%>">REJECT</a></td></tr>
                    <%
                    i++;
                        }
  %>



            </table>
  
  <br><br>
  <h1 align="center"><b> APPROVED LIST</b></h1>
  <table align="center" border="1">
      
      <tr><th>Sl.No</th><th>RTO OFFICE</th><th>ADDRESS </th><th> PHONE NO:</th><th> EMAIL</th></tr>
                          
                        <%
                      int a = 1;
                            String sel1 = "select * from tbl_rto where status=1";
                            ResultSet rs=obj.selectCommand(sel1);
                      while(rs.next())
                     {
                         %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("office_regno")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("phoneno")%></td>
                    <td><%=rs.getString("email")%></td>
                </tr>
                    
                    
                    <%
                    i++;
                        }
  %>

   
      
      
      
  </table>
  
  
  
  
        </form>             
    </body>
</html>
