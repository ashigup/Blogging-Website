<%@page import="com.helper.ConnectionProvider"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
    <head>
        <title>Ash Blog</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        <div class=" container-fluid primary-background text-center clip_path">
            <br>
            <br>
            <br>
            <h3>Welcome to the Ash Blog</h3>
            <p>  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently
                with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <p>  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently
                with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>

            <a href="sign_up.jsp" class="btn btn-outline-success btn-lg"><span class="fa fa-user-plus"></span>Start, It's free</a>
            <a href="login.jsp" class="btn btn-outline-success btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
            <br>
            <br>
            <br>
            <br>
        </div>
        
    
        
        
        
        <br>

        <div class="container">   
            <div class="row mb-2">

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            
               <div class="row">

                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">JAVA Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <a href="#" class="btn primary-background">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


























        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
