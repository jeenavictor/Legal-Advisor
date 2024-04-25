

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
                                  <h1 style="color:black">View  Cases  History</h1>

                                  <table class="table" style="width: 700px">
                    <tr>
			<th>Client</th>
			<th>Case</th>
			<th>Date-Time</th>
			<th>Status</th>
                    </tr>

                <%
                
                String adv_id=request.getParameter("adv_id");
                rs=st.executeQuery("SELECT *,client_assigns.status as a_status FROM `client_assigns` INNER JOIN `client` USING(`client_id`) INNER JOIN `cases` USING(`case_id`) WHERE `adv_id`='"+adv_id+"'");
                while(rs.next()){
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("date_time")%></td>
                      <td><%=rs.getString("a_status")%></td>
                      
                    
                      
                </tr>
                    
      		
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>

