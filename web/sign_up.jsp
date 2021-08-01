
<%@page import="com.entities.user"%>
<%@page import="com.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


      
    </head>
    <body>
        <%@include file="navbar.jsp" %>

           <%
                            if((user)session.getAttribute("current_user")!=null)
                            {
                                response.sendRedirect("profile.jsp");
                            }
                        %>
                        


            <div class="container-fluid primary-background "  >
                <div class="row">
                    <div class="col-md-4  offset-md-4">
                        <div class="card  ">

                            <div class="card-header text-center">
                                <span class="fa fa-user-plus fa-lg"></span><br>User Registration</div>

                                  <%

                            message msg = (message) session.getAttribute("msg");
                            if (msg != null) {
                        %>    
                        <div class="alert <%= msg.getCssClass()  %>" role="alert">
                            <%= msg.getMsg() %>
                        </div>
                        <%
                            session.removeAttribute("msg");
                            }
                        %>
                                
                                
                            <div class="card-body ">
                                <form action="register" method="POST" >
                                    <div class="mb-2">
                                        <label  for="exampleInputEmail1" class="form-label">First Name</label>
                                        <input name="first_name" type="text" class="form-control" >

                                    </div>
                                    <div class="2">
                                        <label for="exampleInputEmail1" class="form-label">Last Name</label>
                                        <input name="last_name" type="text" class="form-control">

                                    </div>
                                    <div class="mb-2">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                                    </div>
                                    <div class="mb-2">
                                        <label for="exampleInputPassword1" class="form-label">Enter your password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>


                                    <input type="radio" id="male" name="gender" value="male" >
                                    <label for="male">Male</label>
                                    <input type="radio" id="female" name="gender" value="female">
                                    <label for="female">Female</label><br>    

                                    <div class="mt-2 form-group">
                                        <textarea name="about" class="form-control"  row="8" placeholder="Enter about yourself"></textarea>
                                    </div>


                                    <div class="mb-2 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms and conditions</label>
                                    </div>
                                    <button type="submit" class="mt-2 btn btn-primary primary-background" data-toggle="modal" data-target="#myModal">Submit</button>
                                   
                </form>


                            </div>
                        </div>
                    </div>

                </div>




            </div>
        





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
