<%-- 
    Document   : company
    Created on : Feb 7, 2018, 8:05:57 PM
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
    <%
        String compid = "", compname = ""; 
        String compregno = "" ,compcont ="";
        String compaddress="", compmail ="";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String Cname = request.getParameter("txtname");
                String Creg = request.getParameter("regno");
                String Cadd = request.getParameter("address");
                String Ccont = request.getParameter("contact");
                String Cmail = request.getParameter("email");
                
                String upQuery = "update tbl_company set comp_name='" + Cname + "',comp_regno='" + Creg + "',comp_address='" + Cadd + "',comp_contactno='" + Ccont + "',comp_email='" + Cmail + "' where comp_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("Company.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String reg = request.getParameter("regno");
                String addrs = request.getParameter("address");
                String cont = request.getParameter("contact");
                String mail = request.getParameter("email");
                String pid= request.getParameter("place");
                String insQry = "insert into tbl_company(comp_name,comp_regno,comp_address,comp_contactno,comp_email,pl_id) values('" + name + "','"+reg+"','"+addrs+"','"+cont+"','"+mail+"','"+pid+"')";
                out.println(insQry);
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("Company.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_company where comp_id='" + request.getParameter("did") + "'";
            boolean b = obj.executeCommand(del);
            if (b) {
                response.sendRedirect("Company.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_company where comp_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
               // compid = rs1.getString("comp_id");
                compname = rs1.getString("comp_name");
                compregno=rs1.getString("comp_regno");
                compaddress=rs1.getString("comp_address");
                compcont=rs1.getString("comp_contactno");
                compmail=rs1.getString("comp_email");


            }

        }


    %>
    <body>
        <h1 align="center">District</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=compid%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        Company Name
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=compname%>" required  />
                    </td>
                </tr>
                
                
               
                <tr>
                    <td>
                        Company Reg.no
                    </td>
                    <td>
                        <input type="text" name="regno" value="<%=compregno%>" required  />
                    </td>
                </tr>
                 <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <input type="text" name="address" value="<%=compaddress%>" required  />
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Contact number:
                    </td>
                    <td>
                        <input type="text" name="contact" value="<%=compcont%>" required  />
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Company email
                    </td>
                    <td>
                        <input type="email" name="email" value="<%=compmail%>" required  />
                    </td>
                </tr>
                <tr>
                    <td>
                        Place 
                    </td>
                    <td>
                        <select name="place" value="sel">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_place";
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("pl_id")%>">
                               <%=rs.getString("pl_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr><th>Sl.No</th><th>company Name</th><th>company reg. no</th><th> address</th><th> contact no: </th><th> email</th><th>Place</th>/tr>
                          
                        <%int i = 1;
                            String sel = "select * from tbl_company c,tbl_place p where c.pl_id=p.pl_id";
                            ResultSet sl = obj.selectCommand(sel);
                            while (sl.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=sl.getString("comp_name")%></td>
                    <td><%=sl.getString("comp_regno")%></td>
                    <td><%=sl.getString("comp_address")%></td>
                    <td><%=sl.getString("comp_contactno")%></td>
                    <td><%=sl.getString("comp_email")%></td>
                    <td><%=sl.getString("pl_name")%></td>
                    
                    <td><a href="Company.jsp?did=<%=sl.getString("comp_id")%>">Delete</a></td>
                    <td><a href="Company.jsp?eid=<%=sl.getString("comp_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>


    </body>
</html>
