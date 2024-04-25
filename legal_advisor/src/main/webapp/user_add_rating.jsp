

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'user_header.jsp'%>
<%@include file="connections.jsp" %>
<%
                String client_id=session.getAttribute("client_id").toString();

if(request.getParameter("rating")!= null)
{

   String rates=request.getParameter("rates");
   String review=request.getParameter("review");
   String adv_id=request.getParameter("adv_id");

   
   st1.executeUpdate("insert into ratings values(null,'"+client_id+"','"+adv_id+"','"+rates+"','"+review+"',now()) ");
   %>
   <script>
       alert("send successfully");
       window.location="user_home.jsp";
   </script>
<%
//   response.sendRedirect("");
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


<style type="text/css">
	
	*{
    margin: 0;
    padding: 0;
}
.rate {
    float: left;
    height: 46px;
    padding: 0 10px;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}

</style>
<center>
	<h1> Rate Advocate</h1>
	<form method="post">
		<table class="table" style="width: 500px">
			<tr>
			<th>rate</th>
			<td>
<div class="rate">
    <input type="radio" id="star5" name="rates" value="5" />
    <label for="star5" title="text">5 stars</label>
    <input type="radio" id="star4" name="rates" value="4" />
    <label for="star4" title="text">4 stars</label>
    <input type="radio" id="star3" name="rates" value="3" />
    <label for="star3" title="text">3 stars</label>
    <input type="radio" id="star2" name="rates" value="2" />
    <label for="star2" title="text">2 stars</label>
    <input type="radio" id="star1" name="rates" value="1" />
    <label for="star1" title="text">1 star</label>
  </div>


			</td>
		</tr>
        <tr>
            <th>Review</th>
            <td ><input type="text"  style="color: white"  class="form-control" name="review"></td>
        </tr>
			<tr>
				<td align="center" colspan="2"><input type="submit" class="btn btn-success" name="rating"></td>
			</tr>
		</table>
	</form>
</center>                                	

          

	

    <center>
                                  <h1 style="color:black">View Ratings</h1>

                                  <table class="table" style="width: 700px">
                    <tr>
			<th>Client</th>
			<th>Rate</th>
			<th>Review</th>
			<th>Date-Time</th>
                    </tr>

                <%
                String adv_id=request.getParameter("adv_id");

                rs=st.executeQuery("SELECT * FROM `ratings` INNER JOIN `client` USING(`client_id`) INNER JOIN `advocates` USING(`adv_id`) where adv_id='"+adv_id+"'");
                while(rs.next())
                {
                %>

                <tr>
                      <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>
                      <td><%=rs.getString("rate")%></td>
                      <td><%=rs.getString("review")%></td>
                      <td><%=rs.getString("date_time")%></td>

                                     </tr>
                    
   
          
              <%
                }
             %>
             
                           </table>



   
          
</center>
<%@ include  file= 'footer.jsp'%>