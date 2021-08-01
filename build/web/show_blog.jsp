
<%@page import="com.dao.likesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.categories"%>
<%@page import="com.entities.post"%>
<%@page import="com.dao.postDao"%>
<%@page import="com.entities.user"%>
<%@page errorPage="error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% user u = (user) session.getAttribute("current_user");

    if (u == null) {

        response.sendRedirect("login.jsp");
    }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0" nonce="HsR5JZHY"></script>
        <nav class="navbar navbar-expand-lg navbar-light primary-background">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">AshBlog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="profile.jsp">All Posts</a>
                        </li>

                        <li class="nav-item">
                            <a id="add-post" class="nav-link " href="#"  data-toggle="modal" data-target="#addPost">New Post</a>
                        </li>

                    </ul>



                    <ul class="navbar-nav me-right">

                        <li class="nav-item">
                            <a class="nav-link "  href="#"  data-toggle="modal" data-target="#profileModal" ><span class="fa fa-user-plus"></span>  <%=  u.getFirst_name()%> </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link "  href="logoutServlet" ><span class="fa fa-user-circle-o"></span>  Logout</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>








        <%
            String s = request.getParameter("pid");
            Integer pID = Integer.parseInt(s.trim());
            postDao pDao = new postDao();
            post p = pDao.getAllPostsBypID(pID);
        %> 


        <!--main body starts-->


        <div class="container">
            <div class="row my-2">
                <div class="col-md-8 offset-md-2">
                    <div class="card ">
                        <div class="card-header primary-background">
                            <h4><%= p.getpTitle()%></h4>

                        </div>
                        <div class="card-body">
                            <img class="card-img-top" src="blog_pics/<%= p.getpImg()%>" >



                            <p><%= p.getpDesc()%></p>
                        </div>
    
                        <% 
                        likesDao lDao=new likesDao();
                        int count=lDao.countLike(p.getpID());
                        
                        %>
                        
                        
                        <div class="card-footer">  
                            <a href="#!" onclick="likes(<%= p.getpID() %>,<%= u.getID() %>,this)" class="btn btn-primary"><span class=" fa fa-thumbs-o-up" id="count-likes"> <%= count %></span></a>
                            <a href="" class="btn btn-primary"><span class="fa fa-comment-o"></span> <span class=" fb-comments-count" data-href="http://localhost:9494/TechBlog/show_blog.jsp?pid=<%= p.getpID()%>"></span></a></div>
                        <div class="fb-comments text-center" data-href="http://localhost:9494/TechBlog/show_blog.jsp?pid=<%= p.getpID()%>" data-width="" data-numposts="5"></div>

                    </div>
                </div>
            </div>

        </div>

  

        <!--main body ends-->






















        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header  primary-background ">


                        <h5 class="modal-title mt-2" id="exampleModalLabel">Profile</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>



                    <div class="modal-body text-center">
                        <img src=" pics/<%= u.getProfile()%>" class="img-fluid"style="border-radius: 50%" ></img>

                        <br>
                        <h5 class="modal-title  mt-2" id="exampleModalLabel"><%= u.getFirst_name()%> <%= u.getLast_name()%></h5>



                        <div class="container " id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%=u.getID()%> </td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Name</th>
                                        <td><%= u.getFirst_name()%> <%= u.getLast_name()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">Email</th>
                                        <td><%= u.getEmail()%></td>


                                    </tr>

                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%= u.getGender()%></td>


                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%= u.getAbout()%></td>


                                    </tr>
                                </tbody>
                            </table>
                        </div>



                        <div id="profile-edit" style="display:none;">
                            <form action="editServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID</th>
                                            <td><%=u.getID()%> </td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Name</th>
                                            <td><%= u.getFirst_name()%> <%= u.getLast_name()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= u.getEmail()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">Password</th>
                                            <td>
                                                <input name="password" type="password" value="<%= u.getPassword()%>">
                                        </tr>

                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= u.getGender()%></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">About</th>
                                            <td>
                                                <textarea name="about" rows="3" class="form-control"><%= u.getAbout()%></textarea></td>


                                        </tr>
                                        <tr>
                                            <th scope="row">New DP</th>
                                            <td>
                                                <input type="file" name="image">

                                        </tr>

                                    </tbody>
                                </table>

                                <button type="submit" class="btn btn-primary primary-background">Save</button>

                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--profile modal ends-->






        <!--post modal-->


        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="addPost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="postServlet" method="POST" enctype="multipart/form-data">

                            <div class="form-group">
                                <select name="category" class="form-control">
                                    <option selected disabled>---Select Category---</option>


                                    <%
                                        //  postDao pDao = new postDao();
                                        ArrayList<categories> cat = pDao.getCategories();
                                        for (categories c : cat) {
                                    %>
                                    <option  value="<%= c.getCid()%>"><%= c.getCname()%></option>
                                    <%
                                        }
                                    %>





                                </select>

                            </div>


                            <div class="form-group">
                                <input name ="pTitle" type="text" class="form-control" placeholder="Enter the title ">
                            </div>

                            <div class="form-group">
                                <textarea name="pDesc" class="form-control" placeholder="Enter description"></textarea>
                            </div>


                            <div class="form-group">
                                <label>Select cover photo</label>
                                <br>
                                <input name ="pImg" type="file" >
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary"  >Post</button>
                            </div>
                        </form>


                    </div>

                </div>
            </div>
        </div>

        <!--end post modal-->


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function ()
            {
                let editStatus = false;
                $('#edit-button').click(function () {

                    if (editStatus == false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                });

            });

        </script>

        <script>

            function getPosts(catid, temp)
            {
                $(".c-link").removeClass('active');
                $.ajax({

                    url: "load_posts.jsp",
                    data: {cid: catid},
                    success: function (data, textStatus, jqXHR) {
//                        console.log(catid);
                        $("#loader").hide();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }

                })
            }

            $(document).ready(function (e) {
                let acl = $('.c-link')[0];
                getPosts(0, acl);

            })

        </script>
    </body>
</html>
