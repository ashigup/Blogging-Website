<%@page import="com.entities.user"%>
<%@page import="com.dao.likesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.post"%>

<%@page import="com.dao.postDao"%>



<% user u = (user) session.getAttribute("current_user");

    if (u == null) {

        response.sendRedirect("login.jsp");
    }

%>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0" nonce="HsR5JZHY"></script>
    
<div class="row">

    <%
        postDao pDao = new postDao();
        int cid = Integer.parseInt(request.getParameter("cid").trim());

        ArrayList<post> posts = null;

        if (cid == 0) {
            posts = pDao.getAllPosts();
        } else {
            posts = pDao.getAllPostsBycatID(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3> NO posts in this category</h3>");
        }

        for (post p : posts) {
    %>


    <div class="col-md-6 mt-4">

        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpImg()%>" >
            <div class="card-body">
                <h5 class="card-title"><%= p.getpTitle()%> </h5>
                <p class="card-text"><%= p.getpDesc()%></p>


            </div>
            <div class="card-footer">
                
                  <% 
                        likesDao lDao=new likesDao();
                        int count=lDao.countLike(p.getpID());
                        
                        %>
                
                <a href="#!" onclick="likes(<%= p.getpID() %>,<%= u.getID() %>,this)" class="btn btn-primary"><span class=" fa fa-thumbs-o-up" id="count-likes"> <%= count %></span></a>
                <a href="show_blog.jsp?pid=<%= p.getpID()%>" class="btn btn-primary">Read more</a>

          <button class="btn btn-primary"><span class="fa fa-comment-o"></span> <span class=" fb-comments-count" data-href="http://localhost:9494/TechBlog/show_blog.jsp?pid=<%= p.getpID()%>"></span></button>

        </div>
    </div>
</div>



<%

    }


%>

</div>