

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="public_header.jsp" %>
<%@include file="connections.jsp" %>

<%
if(request.getParameter("login")!=null)
{
   String u=request.getParameter("u");
   String pwd=request.getParameter("pwd");
   rs=st.executeQuery("select * from login where username='"+u+"' and password='"+pwd+"'");
   if(rs.next())
   {
       String lid=rs.getString("logid");
       session.setAttribute("lognid",lid);
       String utype=rs.getString("usertype");
       out.println(""+utype);

       if(utype.equals("admin"))
       { 
                   out.println("oooooo"+utype);
       %>  
       <script>
           alert("login successfully");
           window.location="adminhome.jsp";
       </script>
       <%

       }
       else if(utype.equals("user"))
       {
       rs=st.executeQuery("select * from client where login_id ='"+lid+"'");
        if(rs.next())
        {
            String client_id=rs.getString("client_id");
            session.setAttribute("client_id",client_id);
           %>  
       <script>
           alert("login successfully");
           window.location="user_home.jsp";
       </script>
       <%
 
        }
       
       }
       
       
       
          else if(utype.equals("court"))
       {
       rs=st.executeQuery("select * from court where login_id ='"+lid+"'");
        if(rs.next())
        {
            String court_id=rs.getString("court_id");
            session.setAttribute("court_id",court_id);
           %>  
       <script>
           alert("login successfully");
           window.location="court_home.jsp";
       </script>
       <%
 
        }
       
       }
      else if(utype.equals("advocate"))
       {
       rs=st.executeQuery("select * from advocates where logid ='"+lid+"'");
        if(rs.next())
        {
            String adv_id=rs.getString("adv_id");
            session.setAttribute("adv_id",adv_id);
           %>  
       <script>
           alert("login successfully");
           window.location="adv_home.jsp";
       </script>
       <%
 
        }
       
       }

 
  
    
}
   else{
   
   %>  
       <script>
           alert("login failed");
           window.location="login.jsp";
       </script>
       <%

   
   }
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
                      <h3 class="display-3 text-white text-uppercase">Login</h3>
 
<center>
	<form method="post">
	<table class="table" style="width:450px;color:white">
		<tr>
			<th>username</th>
			<td><input type="text" name="u" class="form-control"></td>
		</tr>
		<tr>
			<th>password</th>
			<td><input type="password" name="pwd" class="form-control"></td>
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

