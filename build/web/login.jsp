

<%@page import="com.entities.user"%>
<%@page import="com.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .clip_path{
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 89%, 70% 100%, 31% 90%, 0 100%, 0% 30%);

            }


        </style>

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <div class="container-fluid primary-background clip_path " >
            <div class="row">
                <div class="col-md-4 margin-top offset-md-4">
                    <div class="card ">

                        <div class="card-header text-center "><h3><b>
                                    <span class="fa fa-user-circle-o fa-lg"></span> Login </b></h3></div>


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

                        
                        
                        <%
                            if((user)session.getAttribute("current_user")!=null)
                            {
                                response.sendRedirect("profile.jsp");
                            }
                        %>
                        

                        <div class="card-body ">
                            <form action="loginServlet" method="POST">
                                <div class="mb-3">
                                    <label  for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>

                                <button type="submit" class="btn btn-primary primary-background">Submit</button>

                            </form>

                        </div>
                    </div>

                    <br>
                    <br>
                    <br>
                </div>


            </div>


            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
            <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
