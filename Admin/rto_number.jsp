<%-- 
    Document   : rto_number
    Created on : Feb 21, 2018, 9:04:22 PM
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
        <form>
    <%
         String reg="", add="", phno="";
         String mail="",pl="";
            String sel = "select * from tbl_rto r inner join tbl_place p on r.pl_id=p.pl_id where rto_id='" + session.getAttribute("rtoid") + "'";
             ResultSet rs=obj.selectCommand(sel);
             while (rs.next())
             {
             reg=rs.getString("office_regno");
             add=rs.getString("address");
             phno=rs.getString("phoneno");
             mail=rs.getString("email");
             pl=rs.getString("pl_name");
             }
             
             
             
              String num="",id="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            
            num=request.getParameter("txtname");
            
            String insQry="insert into tbl_rtono(number,rto_id)values('"+num+"','"+session.getAttribute("rtoid")+"')";
           boolean b=obj.executeCommand(insQry);
        }
        %>
        <h1 align="center"> <b> Register number </b> </h1>
        <table align="center" width="60%">
            <tr>
                <td>
                    REG NO:
                </td>
                <td>
                    <label>
                        <%=reg%>
                    </label>
                   
                </td>
            </tr>

            <tr>
                <td>
                    ADDRESS:
                </td>
                <td>
                   <label>
                        <%=add%>
                    </label>
                </td>
            </tr>

            <tr>
                <td>
                    PHONE NO:
                </td>
                <td>
                    <label>
                        <%=phno%>
                    </label>
                </td>
            </tr>

            <tr>
                <td>
                    EMAIL:
                </td>
                <td>
                    <label>
                        <%=mail%>
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    PLACE 
                </td>
                <td>
                   <label>
                        <%=pl%>
                    </label>
                </td>
            <tr>
                <td>
                    NUMBER: 
                </td>
                <td>
                        <input type="text" name="txtname">
                    </td>
            </tr>
            
            <tr>
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
        </table>
        </form>
    </body>
</html>
