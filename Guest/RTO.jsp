<%-- 
    Document   : RTO
    Created on : Feb 14, 2018, 12:21:02 AM
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
          
            if (request.getParameter("btnsub") != null)
            {
               
                    String log="";
                    String offreg = request.getParameter("regno");
                    String address = request.getParameter("adrs");
                    String phno = request.getParameter("phno");
                    String mail = request.getParameter("email");
                    String pl= request.getParameter("place");
                    String user=request.getParameter("uname");
                    String pswd=request.getParameter("upasswrd");
                    
                    
                     String insQry1="insert into tbl_login(uname,upasswrd,user_type) values('"+user+"','"+pswd+"','RTO')";
                    
                    boolean bool = obj.executeCommand(insQry1);
                    if(bool==true)
                    {
                        String sel="select max(login_id) as login from tbl_login";
                        ResultSet rs=obj.selectCommand(sel);
                        if(rs.next())
                        {
                          log=rs.getString("login");
                        }
                    }
            
              String insQry = "insert into tbl_rto(office_regno,address,phoneno,email,pl_id,login_id,status)values('" + offreg + "','" + address + "','" + phno + "','" + mail + "','" + pl + "','"+log+"',0)";
               boolean b = obj.executeCommand(insQry);

                
                    }
            
        %>
    <body>
    <center><h1>RTO</h1></center>
    <form>

        <table border="0" align="center">
            <tr>
                <td>
                    REG NO:
                </td>
                <td>
                    <input type="text" name="regno" >
                   
                </td>
            </tr>

            <tr>
                <td>
                    ADDRESS:
                </td>
                <td>
                    <input type="text" name="adrs"  >
                </td>
            </tr>

            <tr>
                <td>
                    PHONE NO:
                </td>
                <td>
                    <input type="text" name="phno" >
                </td>
            </tr>

            <tr>
                <td>
                    EMAIL:
                </td>
                <td>
                    <input type="text" name="email"  >
                </td>
            </tr>
            <tr>
                <td>
                    PLACE 
                </td>
                <td>
                    <select name="place" id="place" required="">
                        <option value="">
                            --select--
                        </option>
                        <%
                            String str = "select * from tbl_place";
                            ResultSet rs = obj.selectCommand(str);
                            while (rs.next()) {
                        %>
                        <option value="<%=rs.getString("pl_id")%>"><%=rs.getString("pl_name")%>
                        </option>
                        <%
                            }
                        %>

                    </select>
                </td>
            </tr>
            
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
                    <input type="password" name="upasswrd"   >
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">

                    <input type="submit" name="btnsub" value="SUBMIT">
                    <input type="reset" name="delid" value="Cancel">
                </td>
            </tr>
        </table>


</body>
</html>
