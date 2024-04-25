

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include  file= 'public_header.jsp'%>
<%@include file="connections.jsp" %>

<%
if(request.getParameter("add")!= null)
{
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String phone=request.getParameter("phone");
   String email=request.getParameter("email");
   String pl=request.getParameter("pl");
   String pin=request.getParameter("pin");
   String gen=request.getParameter("gen");
   String off=request.getParameter("off");
   String dob=request.getParameter("dob");
   String h=request.getParameter("uname");
   String i=request.getParameter("pass");
   rs=st.executeQuery("select * from login  where username='"+h+"'");
   if(rs.next())
   { 
   %>
   <script>
   alert("already exist");
   window.location="user_register.jsp";
   </script>
   <%
   }
   else
   {
   st1.executeUpdate("insert into login values(null,'"+h+"','"+i+"','user')");
   st1.executeUpdate("insert into client values(null,(select max(logid) from login),'"+fname+"','"+lname+"','"+gen+"','"+dob+"','"+phone+"','"+email+"','"+off+"','"+pl+"','"+pin+"')");
   
%>
   <script>
       alert("registered successfully");
   window.location="user_register.jsp";
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
<!--                      <h3 class="display-3 text-white text-uppercase">Login</h3>-->
 
<form method="post">
    <h1 align="center" style="color: white">  User Registration </h1>
<table align="center" style="width:500px;color:white">
        <tr>
            <th>First name</th>
                <td><br><input type="text" name="fname" class="form-control" required=""></td>
        </tr>
        <tr>
                <th>Last name</th>
                <td><br><input type="text" name="lname" class="form-control" required=""></td>
        </tr>

        <tr>
                <th>Phone</th>
                <td><br><input type="text" name="phone" class="form-control" pattern="[0-9]{10}" required=""></td>
        </tr>

        <tr>
                <th>Email</th>
                <td><br><input type="email" name="email" class="form-control" required=""></td>
        </tr>
        <tr>
                <th>Place</th>
                <td><br><input type="text" name="pl" class="form-control" required=""></td>
        </tr>
                <tr>
                <th>Dob</th>
                <td><br><input type="text" name="dob" class="form-control" required=""></td>
        </tr>
        <tr>
                <th>Pincode</th>
                <td><br><input type="text" name="pin" class="form-control" required=""></td>
        </tr>        
        <tr>
                <th>Gender</th>
                <td><br>
                    <select name="gen">
                        <option value="male">male</option>
                        <option value="female">female</option>
                    </select>
                </td>
        </tr>
        
              <tr>
                <th> House Name</th>
                <td><br><input type="text" name="off" class="form-control" required=""></td>
        </tr> 
        <tr>
                <th>Username</th>
                <td><br><input type="text" name="uname" class="form-control" required=""></td>
        </tr>
        <tr>
                <th>Password</th>
                <td><br><input type="password" name="pass" class="form-control" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain atleast one number and one uppercase and lowercase letter, and atleast 8 or more characters" ></td>
        </tr>

        <tr>
            <td colspan="2" align="center"><br><input type="submit" name="add" value="Register" class="btn btn-success"></td>
        </tr>
        	


</table>
   
</form>
 <br><br><br><br><br><br><br><br> 
   </div>
        </div>
    </div>
    <!-- Page Header End -->
<%@ include  file= 'footer.jsp'%>