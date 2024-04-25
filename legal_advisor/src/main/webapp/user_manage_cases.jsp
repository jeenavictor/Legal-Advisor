



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'user_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
                String client_id=session.getAttribute("client_id").toString();

if(request.getParameter("login")!= null)
{
   String a=request.getParameter("a");
   String b=request.getParameter("b");
   String name=request.getParameter("name");
   String des=request.getParameter("des");
   String pincode=request.getParameter("pincode");
   String phone=request.getParameter("phone");
   String ps=request.getParameter("ps");
   
   String h=request.getParameter("uname");
   String i=request.getParameter("pass");
   
   st1.executeUpdate("insert into cases values(null,'"+client_id+"','"+a+"','"+b+"','"+name+"','"+des+"','pending','"+ps+"','"+pincode+"','"+phone+"','pending')");
   
%>
   <script>
       alert("Added successfully");
       window.location="user_manage_cases.jsp";
   </script>
<%
}

%>    
 


<%
if(request.getParameter("updatess")!= null)
{
   String a=request.getParameter("a");
   String b=request.getParameter("b");
   String name=request.getParameter("title");
   String des=request.getParameter("des");
   String pincode=request.getParameter("pincode");
   String phone=request.getParameter("phone");
   String ps=request.getParameter("ps");
   
   

   String uid=request.getParameter("uid");

   
 st2.executeUpdate("UPDATE cases SET type_id='"+a+"',court_id='"+b+"',title='"+name+"',pincode='"+pincode+"',phone='"+phone+"',description='"+des+"',police_station='"+ps+"' WHERE case_id='"+uid+"' ");
  
 %>
   <script>
       alert("updated successfully");
       window.location="user_manage_cases.jsp";
   </script>
<%
}
%>    
    
    
	<%  
  if(request.getParameter("did")!=null)
  {
      String did=request.getParameter("did");
      st.executeUpdate("delete from cases where case_id='"+did+"'");     
%>
<script>
    alert("Deleted successfully");
            windows.location="user_manage_cases.jsp";
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
       rs1= st.executeQuery("select * from cases where case_id='"+uid+"'");
        if(rs1.next())
        {
                
                
                %>
                
       
                
       <form method="POST"  >

                        
                <h1 style="">Update Court</h1>
			


            <table class="table" style="color: #8D4585;width: 500px">
                
                <tr>
			<th>Types</th>
                        <td>
                    <select class="form-control" name="a" required>
                    <option value="<%=rs1.getString("type_id")%>"> <%=rs1.getString("type_name")%> </option>
                    <% 
                            rs3=st1.executeQuery("SELECT * FROM `case_types`");
                            while(rs3.next())
                            {
                            %>
                            <option value="<%=rs3.getString("type_id")%>"> <%=rs3.getString("type_name")%> </option>
                       <%
                            }
                       %>
                    </select>                        
                        </td>
		</tr>   
                <tr>
			<th>Courts</th>
                        <td>
                    <select class="form-control" name="b" required>
                    <option value="<%=rs1.getString("court_id")%>"> <%=rs1.getString("name")%> </option>
                    <% 
                            rs3=st1.executeQuery("SELECT * FROM `court`");
                            while(rs3.next())
                            {
                            %>
                            <option value="<%=rs3.getString("court_id")%>"> <%=rs3.getString("name")%> </option>
                       <%
                            }
                       %>
                    </select>                        
                        </td>
		</tr>   
                
                     <tr>
                     <th style="border: none"> Title</th>
                     <td style="border: none"><input type="text" name="title" value="<%=rs1.getString("title")%>" required="" class="form-control"></td>
                </tr>
                    
                    
                
                <tr>
                     <th style="border: none"> Description</th>
                     <td style="border: none"><input type="text" name="des" value="<%=rs1.getString("description")%>" required="" class="form-control"></td>
                </tr>

                
                <tr>
                     <th style="border: none"> Police Station</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="ps" value="<%=rs1.getString("police_station")%>" required="" class="form-control"></td>
                </tr>  
                
                
                <tr>
                     <th style="border: none"> Pincode</th>
                     <td style="border: none"><input type="text" name="pincode" value="<%=rs1.getString("pincode")%>" required="" class="form-control"></td>
                </tr>
                           
                <tr>
                     <th style="border: none"> Phone</th>
                     <td style="border: none"><input type="text" name="phone" value="<%=rs1.getString("phone")%>" required="" class="form-control"></td>
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
                <h1 style="">Add Cases</h1>
                <table class="table" style="width: 500px">
                    
<tr>
			<th>Types</th>
                        <td>
                    <select class="form-control" name="a" required>
                    <% 
                            rs3=st1.executeQuery("SELECT * FROM `case_types`");
                            while(rs3.next())
                            {
                            %>
                            <option value="<%=rs3.getString("type_id")%>"> <%=rs3.getString("type_name")%> </option>
                       <%
                            }
                       %>
                    </select>                        
                        </td>
		</tr>                    
                     <tr>
			<th>Courts</th>
                        <td>
                    <select class="form-control" name="b" required>
                    <% 
                            rs3=st1.executeQuery("SELECT * FROM `court`");
                            while(rs3.next())
                            {
                            %>
                            <option value="<%=rs3.getString("court_id")%>"> <%=rs3.getString("name")%> </option>
                       <%
                            }
                       %>
                    </select>                        
                        </td>
		</tr>   
                     <tr>
                     <th style="border: none"> Title</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="name" required="" class="form-control"></td>
                </tr>
                  <tr>
                     <th style="border: none"> Description</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="des" required="" class="form-control"></td>
                </tr>    
                  <tr>
                     <th style="border: none"> Police Station</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="ps" required="" class="form-control"></td>
                </tr>   
                
                <tr>
                     <th style="border: none"> Pincode</th>
                     <td style="border: none"><input type="text" name="pincode" required="" class="form-control"></td>
                </tr>                 
                <tr>
                     <th style="border: none"> Phone</th>
                     <td style="border: none"><input type="text" name="phone" required="" class="form-control"></td>
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
                           <h1 style="color:black">View Cases </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
		<th>Title</th>
		<th>Description</th>
		<th>Case Type</th>
		<th>Type Description</th>
		<th>Case Date</th>
		<th>Police Station</th>
		<th>Pincode</th>
		<th>Phone</th>

                    </tr>

                <%
//                String client_id=session.getAttribute("client_id").toString();

                rs=st.executeQuery("SELECT *,CONCAT(first_name,' ',last_name) as fullname,cases.description as des,cases.phone as cp,cases.pincode as cpin,case_types.description as csd FROM cases INNER JOIN case_types USING(type_id) inner join client using(client_id) where client_id='"+client_id+"' ");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("des")%></td>
                      <td><%=rs.getString("type_name")%></td>
                      <td><%=rs.getString("csd")%></td>
                      <td><%=rs.getString("case_date")%></td>
                      <td><%=rs.getString("police_station")%></td>
                      <td><%=rs.getString("cpin")%></td>
                      <td><%=rs.getString("cp")%></td>
                     

                      <td><a class="btn btn-info" href="?uid=<%=rs.getString("case_id")%>">Update</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("case_id")%>">Delete</a></td>
                      <td><a class="btn btn-success" href="admin_assign_advocates.jsp?cid=<%=rs.getString("case_id")%>">Assign To Advocates</a></td>
                
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>


   
          
</center>
<%@ include  file= 'footer.jsp'%>