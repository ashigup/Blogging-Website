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
      
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">C++</a></li>
            <li><a class="dropdown-item" href="#">JAVA</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Python</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="sign_up.jsp" tabindex="-1" aria-disabled="false"><span class="fa fa-user-plus"></span>Sign Up</a>
        </li>
          <li class="nav-item">
              <a class="nav-link " href="login.jsp" tabindex="-1" aria-disabled="false"><span class="fa fa-user-circle-o"></span>Login</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>