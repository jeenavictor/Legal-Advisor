

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
if(request.getParameter("login")!= null)
{
   String ctype=request.getParameter("product");
   String des=request.getParameter("des");
   
      st1.executeUpdate("insert into case_types values(null,'"+ctype+"','"+des+"','user')");
   
%>
   <script>
       alert("Added successfully");
   window.location="admin_manage_casetype.jsp";
   </script>
<%
}

%>    
    
<%
if(request.getParameter("update")!= null)
{
  String ctype=request.getParameter("product");
   String des=request.getParameter("des");
   

   String uid=request.getParameter("uid");

   
 st2.executeUpdate("UPDATE case_types SET type_name='"+ctype+"',description='"+des+"' WHERE type_id='"+uid+"' ");
  
 %>
   <script>
       alert("updated successfully");
       window.location="admin_manage_casetype.jsp";
   </script>
<%
}
%>    
    
    
	<%  
  if(request.getParameter("did")!=null)
  {
      String did=request.getParameter("did");
      st.executeUpdate("delete from case_types where type_id='"+did+"'");     
%>
<script>
    alert("Deleted successfully");
            windows.location="admin_manage_casetype.jsp";
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
       rs1= st.executeQuery("select * from case_types where type_id='"+uid+"'");
        if(rs1.next())
        {
                
                
                %>
                
       
                
       <form method="POST"  >

                        
                <h1 style="">Update Case Types</h1>
			


            <table class="table" style="color: #8D4585">
                     <tr>
                     <th style="border: none"> Case Types</th>
                     <td style="border: none"><input type="text" name="product" value="<%=rs1.getString("type_name")%>" required="" class="form-control"></td>
                </tr>
                    
                    
                
                <tr>
                     <th style="border: none"> description</th>
                     <td style="border: none"><input type="text" name="des" value="<%=rs1.getString("description")%>" required="" class="form-control"></td>
                </tr>
               
                 
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="login" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>

    </table>
</form>
    <% }else{ %>


                  
              
              
              
              <form method="post" >
        
            <center>
                <h1 style="">Add Case Types</h1>
                <table class="table" style="width: 500px">
                     <tr>
                     <th style="border: none"> Case Types</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="product" required="" class="form-control"></td>
                </tr>
                    
             
                <tr>
                     <th style="border: none"> Description</th>
                     <td style="border: none"><input type="text" name="des" required="" class="form-control"></td>
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
                                  <h1 style="color:black">View Case Types </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Case Type</th>
                        <th>Description</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from case_types");
                while(rs.next()){
                %>

                <tr>
                      <td><%=rs.getString("type_name")%></td>
                      <td><%=rs.getString("description")%></td>
                      <td><a class="btn btn-info" href="?uid=<%=rs.getString("type_id")%>">Update</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("type_id")%>">Delete</a></td>
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>
