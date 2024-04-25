

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>




<center>


                
                
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

                       <h1 style="color:black">View User </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Name</th>
                        <th>Place</th>
                        <th>Dob</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>House Name</th>
                        <th>Pincode</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from CLIENT ");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("place")%></td>
                      <td><%=rs.getString("dob")%></td>
                      <td><%=rs.getString("gender")%></td>
                      <td><%=rs.getString("phone")%></td>
                      <td><%=rs.getString("email")%></td>
                      <td><%=rs.getString("house_name")%></td>
                      <td><%=rs.getString("pincode")%></td>
                      <td><a class="btn btn-success" href="admin_view_cases.jsp?cid=<%=rs.getString("client_id")%>">View cases</a></td>
                      <td><a class="btn btn-success" href="admin_view_case_advocates.jsp?cid=<%=rs.getString("client_id")%>">View Advocates</a></td>

        

                
                
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
    
</center>
<%@ include  file= 'footer.jsp'%>    
