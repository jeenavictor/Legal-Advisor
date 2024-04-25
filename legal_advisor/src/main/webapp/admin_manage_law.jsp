

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
if(request.getParameter("login")!= null)
{
   String ctype=request.getParameter("product");
   String des=request.getParameter("des");
   String ipc=request.getParameter("ipc");
   String penalty=request.getParameter("penalty");
      st1.executeUpdate("insert into law_details values(null,'"+ctype+"','"+ipc+"','"+des+"','"+penalty+"')");
   
%>
   <script>
       alert("Added successfully");
   window.location="admin_manage_law.jsp";
   </script>
<%
}

%>    
    
<%
if(request.getParameter("updatess")!= null)
{
  String ctype=request.getParameter("product");
   String des=request.getParameter("des");
   String ipc=request.getParameter("ipc");
   String penalty=request.getParameter("penalty");
   

   String uid=request.getParameter("uid");

   
 st2.executeUpdate("UPDATE law_details SET title='"+ctype+"',description='"+des+"',ipc_code='"+ipc+"',penalty='"+penalty+"' WHERE law_id='"+uid+"' ");
  
 %>
   <script>
       alert("updated successfully");
       window.location="admin_manage_law.jsp";
   </script>
<%
}
%>    
    
    
	<%  
  if(request.getParameter("did")!=null)
  {
      String did=request.getParameter("did");
      st.executeUpdate("delete from law_details where law_id='"+did+"'");     
%>
<script>
    alert("Deleted successfully");
            windows.location="admin_manage_law.jsp";
</script>

<%
  }
 
%>


                
                
 <!-- Page Header Start -->
    <div class="container-fluid bg-page-header" style="margin-bottom: 90px;">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
<!--                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">About</p>
                </div>-->
           
       </div>
        </div>
    </div>
    <!-- Page Header End -->     




		<% 
                
        String uid=request.getParameter("uid");
       rs1= st.executeQuery("select * from law_details where law_id='"+uid+"'");
        if(rs1.next())
        {
                
                
                %>
                
       
                
       <form method="POST"  >

                        
                <h1 style="">Update Law Details</h1>
			


            <table class="table" style="color: #8D4585;width: 500px">
                     <tr>
                     <th style="border: none"> Title</th>
                     <td style="border: none"><input type="text" name="product" value="<%=rs1.getString("title")%>" required="" class="form-control"></td>
                </tr>
                    
                    
                
                <tr>
                     <th style="border: none"> description</th>
                     <td style="border: none"><input type="text" name="des" value="<%=rs1.getString("description")%>" required="" class="form-control"></td>
                </tr>

                <tr>
                     <th style="border: none"> IPC Code</th>
                     <td style="border: none"><input type="text" name="ipc" value="<%=rs1.getString("ipc_code")%>" required="" class="form-control"></td>
                </tr>
                           
                <tr>
                     <th style="border: none"> Penalty</th>
                     <td style="border: none"><input type="text" name="penalty" value="<%=rs1.getString("penalty")%>" required="" class="form-control"></td>
                </tr>                
                
                
                
                 
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="updatess" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>

    </table>
</form>
    <% }else{ %>


                  
              
              
              
              <form method="post" >
        
            <center>
                <h1 style="">Add Law Details</h1>
                <table class="table" style="width: 500px">
                     <tr>
                     <th style="border: none"> Title</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="product" required="" class="form-control"></td>
                </tr>
                    
             
                <tr>
                     <th style="border: none"> IPC Code</th>
                     <td style="border: none"><input type="text" name="ipc" required="" class="form-control"></td>
                </tr>
                <tr>
                     <th style="border: none"> Description</th>
                     <td style="border: none"><input type="text" name="des" required="" class="form-control"></td>
                </tr>                 
                <tr>
                     <th style="border: none"> Penalty</th>
                     <td style="border: none"><input type="text" name="penalty" required="" class="form-control"></td>
                </tr>                 
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="login" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>
                <%}%>
                 </center>
        </form>

    <center>
                                  <h1 style="color:black">View Law Details </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Title</th>
                        <th>IPC code</th>
                        <th>Description</th>
                        <th>Penalty</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from law_details");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("ipc_code")%></td>
                      <td><%=rs.getString("description")%></td>
                      <td><%=rs.getString("penalty")%></td>

                      <td><a class="btn btn-info" href="?uid=<%=rs.getString("law_id")%>">Update</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("law_id")%>">Delete</a></td>
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>
