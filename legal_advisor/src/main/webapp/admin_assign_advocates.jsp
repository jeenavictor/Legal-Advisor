
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'user_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
                String client_id=session.getAttribute("client_id").toString();

   String cid=request.getParameter("cid");


if(request.getParameter("login")!= null)
{
   String a=request.getParameter("a");

   
   st1.executeUpdate("insert into client_assigns values(null,'"+client_id+"','"+a+"','"+cid+"',now(),'assigned')");
   
%>
   <script>
       alert("Added successfully");
       window.location="user_manage_cases.jsp";
   </script>
<%                                                                                                                                          
}

%>    
 

 
    

                
                
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




              
              
              <form method="post" >
        
            <center>
                <h1 style="">Assign Advocates</h1>
                <table class="table" style="width: 500px">
                    
<tr>
			<th>Types</th>
                        <td>
                    <select class="form-control" name="a" required>
                    <% 
                            rs3=st1.executeQuery("SELECT * FROM `advocates`");
                            while(rs3.next())
                            {
                            %>
                            <option value="<%=rs3.getString("adv_id")%>"> <%=rs3.getString("first_name")%> <%=rs3.getString("last_name")%> </option>
                       <%
                            }
                       %>
                    </select>                        
                        </td>
		</tr>                    
                    
             
        
                
                
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="login" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>
                 </center>
        </form>

    <center>
                    

   
          
</center>
<%@ include  file= 'footer.jsp'%>