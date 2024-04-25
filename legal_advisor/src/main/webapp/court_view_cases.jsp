

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'court_header.jsp'%>
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
                String court_id=session.getAttribute("court_id").toString();

                rs=st.executeQuery("SELECT *,CONCAT(first_name,' ',last_name) as fullname,cases.description as des,cases.phone as cp,cases.pincode as cpin,case_types.description as csd FROM cases INNER JOIN case_types USING(type_id) inner join client using(client_id) inner join client_assigns using(case_id) where court_id='"+court_id+"' ");
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
            <td><a class="btn btn-success" href="court_view_adv.jsp?cid=<%=rs.getString("adv_id")%>">View Advocates</a></td>
            <td><a class="btn btn-success" href="court_assign_date.jsp?cid=<%=rs.getString("case_id")%>">Assign Case Date</a></td>
            <td><a class="btn btn-success" href="court_add_judgement.jsp?cid=<%=rs.getString("case_id")%>">Add Judgement</a></td>
        		

                
                
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>




   
          
</center>
<%@ include  file= 'footer.jsp'%>

