
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
if(request.getParameter("login")!= null)
{
   String name=request.getParameter("name");
   String place=request.getParameter("place");
   String pincode=request.getParameter("pincode");
   String phone=request.getParameter("phone");
   String email=request.getParameter("email");
   
   String h=request.getParameter("uname");
   String i=request.getParameter("pass");
   
   st1.executeUpdate("insert into login values(null,'"+h+"','"+i+"','court')");
   st1.executeUpdate("insert into court values(null,(select max(logid) from login),'"+name+"','"+place+"','"+pincode+"','"+phone+"','"+email+"')");
   
%>
   <script>
       alert("Added successfully");
       window.location="admin_manage_court.jsp";
   </script>
<%
}

%>    
 


<%
if(request.getParameter("updatess")!= null)
{
   String name=request.getParameter("name");
   String place=request.getParameter("place");
   String pincode=request.getParameter("pincode");
   String phone=request.getParameter("phone");
   String email=request.getParameter("email");
   
   

   String uid=request.getParameter("uid");

   
 st2.executeUpdate("UPDATE court SET name='"+name+"',place='"+place+"',pincode='"+pincode+"',phone='"+phone+"',email='"+email+"' WHERE court_id='"+uid+"' ");
  
 %>
   <script>
       alert("updated successfully");
       window.location="admin_manage_court.jsp";
   </script>
<%
}
%>    
    
    
	<%  
  if(request.getParameter("did")!=null)
  {
      String did=request.getParameter("did");
      st.executeUpdate("delete from court where court_id='"+did+"'");     
%>
<script>
    alert("Deleted successfully");
            windows.location="admin_manage_court.jsp";
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
       rs1= st.executeQuery("select * from court where court_id='"+uid+"'");
        if(rs1.next())
        {
                
                
                %>
                
       
                
       <form method="POST"  >

                        
                <h1 style="">Update Court</h1>
			


            <table class="table" style="color: #8D4585;width: 500px">
                     <tr>
                     <th style="border: none"> Name</th>
                     <td style="border: none"><input type="text" name="name" value="<%=rs1.getString("name")%>" required="" class="form-control"></td>
                </tr>
                    
                    
                
                <tr>
                     <th style="border: none"> Place</th>
                     <td style="border: none"><input type="text" name="place" value="<%=rs1.getString("place")%>" required="" class="form-control"></td>
                </tr>

                <tr>
                     <th style="border: none"> Pincode</th>
                     <td style="border: none"><input type="text" name="pincode" value="<%=rs1.getString("pincode")%>" required="" class="form-control"></td>
                </tr>
                           
                <tr>
                     <th style="border: none"> Phone</th>
                     <td style="border: none"><input type="text" name="phone" value="<%=rs1.getString("phone")%>" required="" class="form-control"></td>
                </tr>                

                
                
                <tr>
                     <th style="border: none"> Email</th>
                     <td style="border: none"><input type="text" name="email" value="<%=rs1.getString("email")%>" required="" class="form-control"></td>
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
                <h1 style="">Add Court</h1>
                <table class="table" style="width: 500px">
                     <tr>
                     <th style="border: none"> Name</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="name" required="" class="form-control"></td>
                </tr>
                    
             
                <tr>
                     <th style="border: none"> Place</th>
                     <td style="border: none"><input type="text" name="place" required="" class="form-control"></td>
                </tr>
                <tr>
                     <th style="border: none"> Pincode</th>
                     <td style="border: none"><input type="text" name="pincode" required="" class="form-control"></td>
                </tr>                 
                <tr>
                     <th style="border: none"> Phone</th>
                     <td style="border: none"><input type="text" name="phone" required="" class="form-control"></td>
                </tr> 
                
                <tr>
                     <th style="border: none"> Email</th>
                     <td style="border: none"><input type="text" name="email" required="" class="form-control"></td>
                </tr> 
                <tr>
                        <th style="border: none">Username</th>
                        <td style="border: none"><input type="text" name="uname" class="form-control" required=""></td>
                </tr>
                <tr>
                        <th style="border: none">Password</th>
                        <td style="border: none"><input type="password" name="pass" class="form-control" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast one number and one uppercase and lowercase letter, and atleast 8 or more characters" ></td>
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
                                  <h1 style="color:black">View Court </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Name</th>
                        <th>Place</th>
                        <th>Pincode</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from court");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("name")%></td>
                      <td><%=rs.getString("place")%></td>
                      <td><%=rs.getString("pincode")%></td>
                      <td><%=rs.getString("phone")%></td>
                      <td><%=rs.getString("email")%></td>

                      <td><a class="btn btn-info" href="?uid=<%=rs.getString("court_id")%>">Update</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("court_id")%>">Delete</a></td>
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>