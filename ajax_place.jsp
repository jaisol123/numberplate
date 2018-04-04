<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="Db.ConnectionClass"></jsp:useBean>
    <option>--Select--</option>
<%
    String id=request.getParameter("id");
                            String str="select * from tbl_place where dis_id="+id;
                            ResultSet rs1=obj.selectCommand(str);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("pl_id")%>">
                               <%=rs1.getString("pl_name")%>
                           </option>
                            <%
                            }
                            %>

