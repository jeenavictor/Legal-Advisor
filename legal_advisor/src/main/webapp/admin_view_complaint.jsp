

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

<center>
    			<form method="post" >

			<h1>View Complaints</h1>
	
			<table align="center"  style="width:800px" class="table">
			<tr>
				<th>Username </th>
				<th>Complaint</th>
				<th>Reply</th>
				<th>Date</th>
				
			</tr>
        <%
        rs=st.executeQuery("SELECT *,CONCAT(first_name,' ',last_name) AS username FROM complaints INNER JOIN client USING(client_id)");
        while(rs.next()){%>
        <tr>
        <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
        <td><%=rs.getString("desc")%></td>
        <%
        if(rs.getString("reply").equals("pending"))
        {
        %>
  <td><a class="btn btn-info" href="admin_send_reply.jsp?complaint_id=<%=rs.getString("complaint_id")%>">send reply</a></td>
<%
        }
        else
        {
%>
        <td><%=rs.getString("reply")%></td>
                <% } %>

        <td><%=rs.getString("date_time")%></td>
        </tr>
          <% } %>
</table>

</form>
</center>

<%@ include  file= 'footer.jsp'%>