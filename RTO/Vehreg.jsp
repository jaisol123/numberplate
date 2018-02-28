<%-- 
    Document   : Vehreg
    Created on : Feb 14, 2018, 2:21:45 AM
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
            
            
            
            if(request.getParameter("rid")!=null)
        {
           session.setAttribute("cust_id", request.getParameter("rid"));
           
        //  String upd="update tbl_customer set status=1 where cust_id='"+request.getParameter("rid")+"'";
        //  boolean b=obj.executeCommand(upd);
         // response.sendRedirect("../RTO/Vehreg.jsp");
           
        }
         String name="", add="";
         String mail="", ph="", uname="";
            String sel = "select * from tbl_customer c inner join tbl_rtono r on r.rtono_id=c.rtono_id where c.cust_id='" + session.getAttribute("cust_id") + "'";
             ResultSet rs=obj.selectCommand(sel);
             while (rs.next())
             {
             name=rs.getString("cust_name");
             add=rs.getString("cust_address");
             mail=rs.getString("cust_email");
             ph=rs.getString("cust_contactno");
       
             }
             
              String engineno="",id="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            String vhno="";
            String mod=request.getParameter("model");
            engineno=request.getParameter("txt_eng");
            vhno=request.getParameter("vnoid");
            
            String insQry="insert into tbl_vehreg(veh_regno,mod_id,engineno,cust_id,rto_id)values('"+vhno+"','"+mod+"','"+engineno+"','"+session.getAttribute("cust_id")+"','"+session.getAttribute("rid")+"')";
           boolean b=obj.executeCommand(insQry);
           out.println(insQry);
        }
     
             %>
     <h1 align="center"> <b> VEHICLE REGISTRATION </b> </h1>
        <table align="center">
            <tr>
                <td>
                    NAME
                </td>
                <td>
                    <label>
                        <%=name%>
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
                    PHONE NO:
                </td>
                <td>
                   <label>
                        <%=ph%>
                    </label>
                </td>
            </tr>
            
    
            
            <tr>
                    <td>
                        VEHICLE REGISTER NO:
                    </td>
                    <td>
                       <%
                       int veno=0;
                       String vno="";
                       String sel1="select max(veh_regno) as veg from tbl_vehreg";
                       ResultSet rs3=obj.selectCommand(sel1);
                       if(rs3.next())
                       {
                           vno=rs3.getString("veg");
                          veno=Integer.parseInt(vno)+1;
                       }
                       %>
                       <label id="<%=veno%>"><%=veno%></label>
                       <input type="hidden" name="vnoid" value="<%=veno%>">
                    </td>
                </tr>
             <tr>
                    <td>
                        MODEL 
                    </td>
                    <td>
                        <select name="model" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_model";
                            ResultSet rs1=obj.selectCommand(str);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("mod_id")%>">
                               <%=rs1.getString("mod_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
            
             
             
                 <tr>
                    <td>
                        ENGINE NO:
                    </td>
                    <td>
                        <input type="text" name="txt_eng" required  >
                    </td>
                </tr>
                
                
                 
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
        </table>
    </form>
    </body>
</html>
