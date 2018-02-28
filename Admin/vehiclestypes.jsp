<%-- 
    Document   : District
    Created on : Jan 31, 2018, 10:46:03 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="Db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <form>
        
    <% 
        String vhId="", vhname=""; 
        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String vname = request.getParameter("txtname");
                
                String upQuery = "update tbl_vehtype set vhtype_name='" + vname + "'where vhtype_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("vehiclestypes.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } else
                {

                String name = request.getParameter("txtname");
               
                String insQry = "insert into tbl_vehtype(vhtype_name) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("vehiclestypes.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }
                
                
                
                
                
        if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_vehtype where vhtype_id='"+request.getParameter("did")+"'";
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
            String sel = "select * from tbl_vehtype where vhtype_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
                vhId= rs1.getString("vhtype_id");
                vhname = rs1.getString("vhtype_name");
                

            }

        }
          %>
    
         <center><h1> <b>Vehicle Types </b></h1></center>
       <input type="hidden" name="hid" value="<%=vhId%>">
        <table align="center">
            <tr>
                <td>District Name</td>
                <td>
                    <input type="text" name="txtname" value="<%=vhname%>" required >
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
                <tr><th>Sl.No</th><th>Vehicle Name</th></tr>
                <%int i=1;
                String sel="select * from tbl_vehtype";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr><td><%=i%></td><td><%=rs.getString("vhtype_name")%></td>
                    <td><a href="vehiclestypes.jsp?did=<%=rs.getString("vhtype_id")%>">Delete</a></td>
                    <td><a href="vehiclestypes.jsp?eid=<%=rs.getString("vhtype_id")%>">Edit</a></td></tr>
                <%
                i++;
                }
                
                
                %>
                
                
            </table>
         
    </form>
    </body>
</html>
