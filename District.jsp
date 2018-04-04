<%-- 
    Document   : vehiclestypes
    Created on : Feb 7, 2018, 10:55:27 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="Db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> district names</title>
    </head>
    <body>
        <form>
        <% 
        String disId="", disname=""; 
        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String dname = request.getParameter("txtname");
                
                String upQuery = "update tbl_district set dis_name='" + dname + "'where dis_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("District.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } else
                {

                String name = request.getParameter("txtname");
               
                String insQry = "insert into tbl_district(dis_name) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("District.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }
                
                
                
                
                
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_district where dis_id='"+request.getParameter("did")+"'";
            boolean b=obj.executeCommand(del);
            
            if(b==true)
            {
                
              %>
              <script>
                  alert("succesfully deleted");
               </script>
                           
              <%
            }
                else
                {
                   %>
                <script>
                  alert("not deleted");
               </script>
                    <%
                        
                }
                        
            }
        
        
        
        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_district where dis_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
                disId= rs1.getString("dis_id");
                disname = rs1.getString("dis_name");
                

            }

        }
          %>
    
         <center><h1> <b>DISTRICT </b></h1></center>
       <input type="hidden" name="hid" value="<%=disId%>">
        <table align="center">
            <tr>
                <td>District Name</td>
                <td>
                    <input type="text" name="txtname" value="<%=disname%>" required >
                </td>
                
            </tr>
        
            <tr colspan="2" align="center">
            <td>
               <input type="submit" name="btnsub" value="SUBMIT">
               <input type="reset" name="cancel" value="CANCEL">
             </td>
            </tr>
            
       </table>
         
         
         
         
         
          <table border="1" align="center">
                <tr><th>Sl.No</th><th>District Name</th></tr>
                <%int i=1;
                String sel="select * from tbl_district";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr><td><%=i%></td><td><%=rs.getString("dis_name")%></td>
                    <td><a href="District.jsp?did=<%=rs.getString("dis_id")%>">Delete</a></td>
                    <td><a href="District.jsp?eid=<%=rs.getString("dis_id")%>">Edit</a></td></tr>
                <%i++;}
                
                
                %>
                
                
            </table>
         
         
         
         
        </form>  
    </body>
</html>
