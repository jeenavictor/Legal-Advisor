

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
                                  <h1 style="color:black">View Case Files</h1>

                                  <table class="table" style="width: 700px">
                    <tr>
			<th>Cases</th>
			<th>Notes</th>
			<th>Date-Time</th>
                    </tr>

                <%
                String case_id=request.getParameter("case_id");

                rs=st.executeQuery("SELECT * FROM case_files inner join cases using (case_id) where case_id='"+case_id+"'");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("title")%> 
                      <td><%=rs.getString("file_title")%></td>
                      <td><a href="<%=rs.getString("file_path")%>">view files</a></td>

                                     </tr>
                    
   
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>