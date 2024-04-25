

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="court_header.jsp" %>
<%@include file="connections.jsp" %>

<%
if(request.getParameter("login")!=null)
    
{
String ad=request.getParameter("ad");
String cid=request.getParameter("cid");
st.executeUpdate("update cases set case_date='"+ad+"' where case_id='"+cid+"'");

 %>  
       <script>
           alert("Assigned successfully");
           window.location="court_view_cases.jsp";
       </script>
<%
   }
%>


   
 <!-- Page Header Start -->
    <div class="container-fluid bg-page-header" style="margin-bottom: 90px;">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
<!--                <div class="d-inline-flex text-white">
                    <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                    <i class="fa fa-angle-double-right pt-1 px-3"></i>
                    <p class="m-0 text-uppercase">About</p>
                </div>-->
           


   

   <br><br><br><br>           
                      <h3 class="display-3 text-white text-uppercase">Assign Date</h3>
 
<center>
	<form method="post">
	<table class="table" style="width:450px;color:white">
		<tr>
			<th>Assign Date</th>
                        <td><input type="text" name="ad" class="form-control" required=""></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2"><input type="submit" name="login" value="login" class="btn btn-success"></td>
		</tr>
	</table>
	</form>
</center>
 
 
 <br><br><br><br><br><br><br><br> 
   </div>
        </div>
    </div>
    <!-- Page Header End -->
<%@include file="footer.jsp" %>

