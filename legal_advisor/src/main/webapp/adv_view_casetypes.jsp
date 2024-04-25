

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
                                  <h1 style="color:black">View Case Types </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Case Type</th>
                        <th>Description</th>
                    </tr>

                <%
                rs=st.executeQuery("select * from case_types");
                while(rs.next()){
                %>

                <tr>
                      <td><%=rs.getString("type_name")%></td>
                      <td><%=rs.getString("description")%></td>
                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>

