

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'court_header.jsp'%>
<%@include file="connections.jsp" %>

<center>
    
<%
if(request.getParameter("login")!= null)
{
   String ctype=request.getParameter("product");
String cid=request.getParameter("cid");

      st1.executeUpdate("insert into judgement values(null,'"+cid+"','"+ctype+"',curdate()");
   
%>
   <script>
       alert("Added successfully");
   window.location="court_view_cases.jsp";
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
                <h1 style="">Add Judgement</h1>
                <table class="table" style="width: 500px">
                     <tr>
                     <th style="border: none"> Judgement</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="product" required="" class="form-control"></td>
                </tr>
                    
                
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="login" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>
                 </center>

    <center>
                                  <h1 style="color:black">View Judgement </h1>

                                  <table class="table" style="width: 700px">
                    <tr>
                        <th>Cases</th>
                        <th>Judgement</th>
                    </tr>

                <%
String cid=request.getParameter("cid");

                rs=st.executeQuery("select * from judgement inner join cases using (case_id) where case_id='"+cid+"'");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("title")%></td>
                      <td><%=rs.getString("ipc_code")%></td>
                      <td><%=rs.getString("description")%></td>
                      <td><%=rs.getString("penalty")%></td>

                </tr>
                    
      
          
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>
