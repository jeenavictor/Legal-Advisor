

<%@ include  file= 'admin_header.jsp'%>
<%@include file="connections.jsp" %>
<%
if(request.getParameter("send")!=null)
    
{
String reply=request.getParameter("reply");
String complaint_id=request.getParameter("complaint_id");
st.executeUpdate("update complaints set reply='"+reply+"' where complaint_id='"+complaint_id+"'");

 %>  
       <script>
           alert("send successfully");
           window.location="admin_view_complaint.jsp";
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



<center>
    			<form method="post" >

			<h1>Send Reply</h1>
	
			<table   style="width:800px" class="table">
			<tr>
<!--                            <th>Reply</th>-->
                                <td><textarea  style="width:800px"  name="reply"></textarea></td>
				
			</tr>
                        <tr>
                            <td colspan="2" align="center"><input class="btn btn-warning" type="submit" name="send" value="send"></td>
				
			</tr>
                        
        
</table>

</form>
</center>

<%@ include  file= 'footer.jsp'%>