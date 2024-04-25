

<%@ include  file= 'adv_header.jsp'%>
<%@include file="connections.jsp" %>

                
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

			<h1>Case Files </h1>
	
		<form method="post" action="files_up.jsp" enctype="multipart/form-data">
        
            <center>
                <table class="table" style="width: 500px">
                       <tr>
                     <th style="border: none"> File Title</th>
                     <td style="border: none"><input type="text" pattern="[A-Za-z ]+$" name="ftitle" required="" class="form-control"></td>
                </tr>
                    
                 <tr>
                     <th style="border: none"> Image</th>
                     <td style="border: none"><input type="file" name="image" required="" class="form-control"></td>
                </tr>
                 
                <br>
                      <tr>
                        <td style="border: none" align="center" colspan="2"><input type="submit" name="login" class="btn btn-success" value="Add"></td>
                    </tr>
                </table>
</form>
</center>

<%@ include  file= 'footer.jsp'%>
