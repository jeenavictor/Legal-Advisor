

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'user_header.jsp'%>
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
                                  <h1 style="color:black">View Ongoing Cases  </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                    <th>Client</th>
                    <th>Case</th>
                    <th>Description</th>
                    <th>Type Description</th>
                    <th>Case Date</th>
                    <th>Police Station</th>
                        

                    <th>Date-Time</th>
                    <th>Status</th>
                    </tr>

                <%
                
                String client_id=session.getAttribute("client_id").toString();
                rs=st.executeQuery("SELECT *,client_assigns.status as a_status FROM `client_assigns` INNER JOIN `client` USING(`client_id`) INNER JOIN `cases` USING(`case_id`) WHERE client.`client_id`='"+client_id+"'");
                while(rs.next()){
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("description")%></td>
                      <td><%=rs.getString("case_date")%></td>
                      <td><%=rs.getString("police_station")%></td>
                      
                      <td><%=rs.getString("date_time")%></td>
                      <td><%=rs.getString("a_status")%></td>
            <td><a class="btn btn-success" href="user_view_case_notes.jsp?case_id=<%=rs.getString("case_id")%>"> cases notes</a></td>
            <td><a class="btn btn-success" href="user_view_case_files.jsp?case_id=<%=rs.getString("case_id")%>"> cases files</a></td>
            <td><a class="btn btn-success" href="user_add_rating.jsp?adv_id=<%=rs.getString("adv_id")%>"> Add Rating</a></td>
                    
                      
                </tr>
                    
      		
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>

