
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>

<%
if(request.getParameter("uid")!=null)
    
{
String uid=request.getParameter("uid");
st.executeUpdate("update login set usertype='advocate' where logid='"+uid+"'");

 %>  
       <script>
           alert("Accepted successfully");
           window.location="admin_view_adv.jsp";
       </script>
<%
   }
%>



<%
if(request.getParameter("did")!=null)
    
{
String did=request.getParameter("did");
st.executeUpdate("update login set usertype='rejected' where logid='"+did+"'");

 %>  
       <script>
           alert("Accepted successfully");
           window.location="admin_view_adv.jsp";
       </script>
<%
   }
%>



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

                       <h1 style="color:black">View Advocate </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Name</th>
                        <th>Place</th>
                        <th>Qualification</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Email</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from advocates inner join login using (logid)");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("place")%></td>
                      <td><%=rs.getString("qualification")%></td>
                      <td><%=rs.getString("gender")%></td>
                      <td><%=rs.getString("phone")%></td>
                      <td><%=rs.getString("email")%></td>
                      <%
                        if(rs.getString("usertype").equals("pending"))
                        {
                      %>
                      <td><a class="btn btn-info" href="?uid=<%=rs.getString("logid")%>">Accept</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("logid")%>">Reject</a></td>
               <%
        }
        
            %>
        

                
                
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
    
</center>
<%@ include  file= 'footer.jsp'%>    