

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'user_header.jsp'%>
<%@include file="connections.jsp" %>

<%
                String client_id=session.getAttribute("client_id").toString();

if(request.getParameter("add")!= null)
{

   String a=request.getParameter("enquiry");

   
   st1.executeUpdate("insert into complaints values(null,'"+client_id+"','"+a+"','pending',now()) ");
   %>
   <script>
       alert("send successfully");
       window.location="user_send_complaint.jsp";
   </script>
<%
//   response.sendRedirect("");
}

%>




<center>
 <form method="post" >

<h1>Send Complaint</h1>





<table align="center" style="width: 500px">
        <tr>
                <th>Complaint</th>
                <td><br><input type="text" name="enquiry" class="form-control" required=""></td>
        </tr>


        <tr>
            <td colspan="2" align="center"><br><input type="submit" name="add" value="Send" class="btn btn-success"></td>
        </tr>

</table>
   		

</form>
    <h1 align="center">View Complaint</h1>
	
			<table align="center"  style="width:500px" class="table"  >
			<tr>
				<th >Complaint</th>
				<th >Reply</th>
				<th >Date</th>
				
			</tr>
        <%

        rs=st.executeQuery("SELECT * from `complaints` where client_id='"+client_id+"'");
        while(rs.next()){%>
        <tr>
        <td ><%=rs.getString("desc")%></td>
        
        <td ><%=rs.getString("reply")%></td>
        
        <td ><%=rs.getString("date_time")%></td>
        </tr>
        <% } %>
</table>
    
    
    
</center>

<%@ include  file= 'footer.jsp'%>