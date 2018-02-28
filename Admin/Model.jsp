<%-- 
    Document   : model
    Created on : Feb 7, 2018, 8:06:09 PM
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
            String modelId="",modename="",cName="",vehName=""; 
            if(request.getParameter("btnsub")!=null)
            {
                if (!request.getParameter("hid").equals("")) 
                {
                    String mname = request.getParameter("model");
                
                    String upQuery = "update tbl_model set mod_name='" + mname + "'where mod_id='" + request.getParameter("hid") + "'";
                    out.println(upQuery);
                    boolean b = obj.executeCommand(upQuery);
                    if (b == true) 
                    {
                        response.sendRedirect("Model.jsp");
                    } else
                    {
                        out.println(upQuery);
                    }

                } 
                else
                {
                    String modname = request.getParameter("model");
                    String cmpname = request.getParameter("cmpname");
                    String vhname = request.getParameter("vehicles");
               
                    String insQry = "insert into tbl_model(mod_name,comp_id,vhtype_id) values('" + modname + "','"+cmpname+"','"+vhname+"');";
                    out.println(insQry);
                    boolean b = obj.executeCommand(insQry);
                    if (b == true)
                    {
                        response.sendRedirect("Model.jsp");
                    } 
                    else
                    {
                    out.println(insQry);
                    }
                    
                }
            }
            
            
            
         if(request.getParameter("did")!=null)
        {
        //  String stri=request.getParameter("did");
           
           String del="delete from tbl_model where mod_id='"+request.getParameter("did")+"'";
          boolean b=obj.executeCommand(del);
            
          
                        
          }
         
        
        
            if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_model where mod_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
                modelId= rs1.getString("mod_id");
                modename = rs1.getString("mod_name");
                cName=rs1.getString("comp_id");
                vehName=rs1.getString("vhtype_id");
                

            }

        }
           
        %>
   
 <center><h1>MODEL</h1></center>
        <input type="hidden" name="hid" value="<%=modelId%>">
            <table border="0" align="center">
                <tr>
                    <td>
                        model:
                    </td>
                    <td>
                        <input type="text" name="model" value="<%=modename%>">
                    </td>
                </tr>
                <tr>
                    <td>
                        company 
                    </td>
                    <td>
                        <select name="cmpname" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_company";
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("comp_id")%>"<% if(cName.equals(rs.getString("comp_id"))){%> selected="true" <%}%>>
                               <%=rs.getString("comp_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                
                
                
                <tr>
                    <td>
                        vehicle 
                    </td>
                    <td>
                        <select name="vehicles" required="">
                            <option value="">
                               --select--
                            </option>
                            <%
                            String st="select * from tbl_vehtype";
                            ResultSet sl=obj.selectCommand(st);
                            while (sl.next())
                            {
                           %>
                           <option value="<%=sl.getString("vhtype_id")%>"<% if(vehName.equals(sl.getString("vhtype_id"))){%> selected="true" <%}%>>
                               <%=sl.getString("vhtype_name")%>
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
                <input type="reset" name="delid" value="CANCEL">
                </td>
                </tr>
            </table>
           
                          
                         <table border="1" align="center">
                <tr><th>Sl.No</th><th>Model Name</th><th>company name</th><th> vehicle name</th></tr>
                          
                        <%int i = 1;
                            String sel = "select * from tbl_model m,tbl_vehtype v,tbl_company c where c.comp_id=m.comp_id and  v.vhtype_id=m.vhtype_id;";
                            ResultSet sr = obj.selectCommand(sel);
                            while (sr.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=sr.getString("mod_name")%></td>
                    <td><%=sr.getString("comp_name")%></td>
                    <td><%=sr.getString("vhtype_name")%></td>
                    
                    
                    <td><a href="Model.jsp?did=<%=sr.getString("mod_id")%>">Delete</a></td><br>
                    <td><a href="Model.jsp?eid=<%=sr.getString("mod_id")%>">Edit</a></td></tr>
                    <%
                    i++;
                        }


                    %>



            </table>

        </form>
</html>
