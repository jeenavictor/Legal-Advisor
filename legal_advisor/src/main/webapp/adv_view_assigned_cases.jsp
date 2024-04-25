

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'adv_header.jsp'%>
<%@include file="connections.jsp" %>





<%
if(request.getParameter("uid")!=null)
    
{
String uid=request.getParameter("uid");
st.executeUpdate("update client_assigns set status='accepted' where assign_id='"+uid+"'");

 %>  
       <script>
           alert("Accepted successfully");
           window.location="adv_view_assigned_cases.jsp";
       </script>
<%
   }
%>



<%
if(request.getParameter("did")!=null)
    
{
String did=request.getParameter("did");
st.executeUpdate("update client_assigns set status='rejected' where assign_id='"+did+"'");

 %>  
       <script>
           alert("Accepted successfully");
           window.location="adv_view_assigned_cases.jsp";
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




		

    <center>
                                  <h1 style="color:black">View Assigned Cases </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
			<th>Client</th>
			<th>Case</th>
			<th>Date-Time</th>
			<th>Status</th>
                    </tr>

                <%
                String adv_id=session.getAttribute("adv_id").toString();
                rs=st.executeQuery("SELECT *,client_assigns.status as a_status FROM `client_assigns` INNER JOIN `client` USING(`client_id`) INNER JOIN `cases` USING(`case_id`) WHERE `adv_id`='"+adv_id+"'");
                while(rs.next()){
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("date_time")%></td>
                      <td><%=rs.getString("a_status")%></td>
                      
                      <%
                        if(rs.getString("a_status").equals("assigned"))
                        {
                      %>
                        <td><a class="btn btn-info" href="?uid=<%=rs.getString("assign_id")%>">Accept</a></td>
                       <td><a class="btn btn-success" href="?did=<%=rs.getString("assign_id")%>">Reject</a></td>   
               <%
        }
                        else if(rs.getString("a_status").equals("accepted"))
                        {
        
            %>
            <td><a class="btn btn-success" href="adv_view_cases.jsp?cid=<%=rs.getString("case_id")%>">View cases</a></td>
            <td><a class="btn btn-success" href="adv_add_casenotes.jsp?cid=<%=rs.getString("case_id")%>"> cases notes</a></td>
            <td><a class="btn btn-success" href="adv_add_casefiles.jsp?cid=<%=rs.getString("case_id")%>"> cases files</a></td>
            
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

