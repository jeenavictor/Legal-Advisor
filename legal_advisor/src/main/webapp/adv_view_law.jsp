

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'adv_header.jsp'%>
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

                                     </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>