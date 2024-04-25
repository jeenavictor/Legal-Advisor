

<%@ include  file= 'adv_header.jsp'%>
<%@include file="connections.jsp" %>
<%
if(request.getParameter("send")!=null)
    
{
String reply=request.getParameter("reply");
String cid=request.getParameter("cid");
st1.executeUpdate("insert into case_notes values(null,'"+cid+"',now(),'"+reply+"')");

 %>  
       <script>
           alert("Added successfully");
           window.location="adv_home.jsp";
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

			<h1>Case Notes </h1>
	
			<table   style="width:800px" class="table">
			<tr>
                            <th>Description</th>
                                <td><textarea  style="width:800px"  name="reply"></textarea></td>
				
			</tr>
                        <tr>
                            <td colspan="2" align="center"><input class="btn btn-warning" type="submit" name="send" value="send"></td>
				
			</tr>
                        
        
</table>

</form>
</center>

<%@ include  file= 'footer.jsp'%>