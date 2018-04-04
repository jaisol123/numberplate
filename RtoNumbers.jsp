<%-- 
    Document   : RtoNumbers
    Created on : 28 Feb, 2018, 9:20:57 PM
    Author     : AkHiLeSh
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
            
        String sno="",eno="",rtoid="",serialid="",rnoid="",kl="",sr="";
        sno=request.getParameter("txt_start");
        eno=request.getParameter("txt_end");
        rtoid=request.getParameter("ddl_rto");
        serialid=request.getParameter("ddl_serial");
        //getting the serial number 
        
        String sels="select serial_no from tbl_serialno where serial_id='"+serialid+"'";
         ResultSet rss=obj.selectCommand(sels);
        if(rss.next())
        {
         sr=rss.getString("serial_no");
        }
        // getting the Reg.no Eg:KL17
        String selk="select rto_regno from tbl_rto where rto_id='"+rtoid+"'";
        ResultSet rsk=obj.selectCommand(selk);
        if(rsk.next())
        {
         kl=rsk.getString("rto_regno");
        }
        if(request.getParameter("btn_submit")!=null)
        {
        
        int startno=Integer.parseInt(sno);
        int endno=Integer.parseInt(eno);
        String ins="insert into tbl_rtonumbers (rno_date,rno_sno,rno_eno,rto_id,serial_id)values(curdate(),'"+sno+"','"+eno+"','"+rtoid+"','"+serialid+"')";
      boolean b=obj.executeCommand(ins);
    if(b==true)
    {
        String sel3="select max(rno_id) as rnoid from tbl_rtonumbers";
        ResultSet rs3=obj.selectCommand(sel3);
        if(rs3.next())
        {
          rnoid=rs3.getString("rnoid");
        }
    }
    else
    {
        out.println(ins);
    }
    while(startno<=endno)
    {
      String ins1="insert into tbl_rtonumbersdetails(rnod_numbers,rno_id)values('"+kl+"-"+sr+"-"+startno+"','"+rnoid+"')";
      obj.executeCommand(ins1);
      startno++;
    }
    
    
        }
        %>
        
        
        <h1 align="center">Alotted Vehicle Numbers</h1>

        <table  align="center" border="1">
            <tr>
                <td>
                    RTO Names:
                </td>
                <td>
                    <select name="ddl_rto">
                        <option>......Select......</option>
                        <%
                        String sel="select * from tbl_rto";
                        ResultSet rs=obj.selectCommand(sel);
                        while(rs.next())
                        {
                        %>
                        <option value=" <%=rs.getString("rto_id")%>">Reg.no:<%=rs.getString("rto_regno")%>&nbsp; RTO:<%=rs.getString("rto_name")%></option>
                        <%
                        }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Serials
                </td>
                <td>
                    <select name="ddl_serial" >
                        <option>......Select......</option>
                     <%
                        
                        String sel1="select * from tbl_serialno";
                        ResultSet rs1=obj.selectCommand(sel1);
                        while(rs1.next())
                        {
                           
                      %>
                      <option value="<%=rs1.getString("serial_id")%>">Serial:<%=rs1.getString("serial_no")%></option>
                      <%
                        }
                       %>
                     </select> 
                     
                </td>
            </tr>
            <tr>
                <td>
                Start From:
                </td>
                <td>
                    <input type="text" name="txt_start">
                </td>
               
            </tr>
            <tr>
                <td>
                END No:
                </td>
                <td>
                    <input type="text" name="txt_end">
                </td>
               
            </tr>
            <tr>
                <td>
                    <input type="submit" name="btn_submit" value="Submit">
                </td>
            </tr>
            
        </table>
                     <br>
                     
        <table align="center" border="1">
               <tr>
                   <td>
                       ID
                   </td>
                   <td>
                       Date
                   </td>
                   <td>
                       RTO
                   </td>
                   <td>
                       Serial
                   </td>
                   <td>
                      Start From 
                   </td>
                   <td>
                       END NO
                   </td>
                   <td>
                       Operations
                   </td>
                   
               </tr>
               <%
                        int i=0;
               String sel2="select * from tbl_rtonumbers rn inner join tbl_rto r on rn.rto_id=r.rto_id inner join tbl_serialno s on rn.serial_id=s.serial_id";
               ResultSet rs2=obj.selectCommand(sel2);
               while(rs2.next())
               {
                  i++;
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=rs2.getString("rno_date")%></td>
                   <td><%=rs2.getString("rto_name")%></td>
                   <td><%=rs2.getString("serial_no")%></td>
                   <td><%=rs2.getString("rno_sno")%></td>
                   <td><%=rs2.getString("rno_eno")%></td>
                   <td><a href="RtoNumberDetails.jsp?nid=<%=rs2.getString("rno_id")%>">ViewNumbers</a></td>
               </tr>
               <%
               }
               %>
        </table>
        </form>
    </body>
</html>
