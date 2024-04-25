
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

                       <h1 style="color:black">View Case Handling Advocates </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
		<th>Case Title</th>
		<th>Advocate Name</th>
		<th>Description</th>
		<th>Case Date</th>
		<th>Police Station</th>

                    </tr>

                <%
                String cid=request.getParameter("cid");
                rs=st.executeQuery("SELECT *,CONCAT(advocates.`first_name`,' ',advocates.`last_name`)AS adv_name,CONCAT(client.`first_name`,' ',client.`last_name`)AS c_name FROM proposals INNER JOIN cases USING(case_id) INNER JOIN advocates USING(adv_id) INNER JOIN CLIENT USING(client_id) where client_id='"+cid+"'");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("adv_name")%></td>
                      <td><%=rs.getString("description")%></td>
                      <td><%=rs.getString("case_date")%></td>
                      <td><%=rs.getString("police_station")%></td>
                     
        

 
                
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
    
</center>
<%@ include  file= 'footer.jsp'%>    