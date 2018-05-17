<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<style>

.navbar /* Design Of The Nav */
{
  padding-top: 18px;
  padding-bottom: 18px;
  background: #002248;
  margin-bottom: 0;
  margin-left: -10;
  margin-right: -10;
  margin-top: 0;
  border-bottom: 3px solid yellow;
  border-top: 3px solid yellow;
}

.nav
{
	float:right;
	color:white;
	font-family: Times New Roman;
	font-size: 20px;
}

.BorderRight /* For " a " Clases */
{
  border-right: 1px solid #969696; 
}

.nav a:hover
{
	border-bottom: 5px solid white;
}

.navbar-default .navbar-nav>li>a:focus, .navbar-default .navbar-nav>li>a:hover /* After A Link Click */
{
	color:white;
}

.navbar-default .navbar-nav > .open > a,
.navbar-default .navbar-nav > .open > li,
.navbar-default .navbar-nav > .open > a:hover,
.navbar-default .navbar-nav > .open > a:focus,
.navbar-default .navbar-nav>li>a,
.navbar-default .navbar-nav>li>a:hover
{
	background: #002248;
	color:white;s
}

.dropdown-menu,
.dropdown-menu>li>a
{
	background: #8B008B; 
	color:white;
}

.dropdown-menu>li>a
{
	height:40px;
	padding-top:8px;
	font-family: Times New Roman;
	font-size: 18px;
}

@media (max-width: 767px) {
	
.navbar-default .navbar-nav .open .dropdown-menu>li>a,
.navbar-default .navbar-nav .open .dropdown-menu>li>a:hover
{
    color: white;
	background: #8B008B; /* BG For The Hover */
}

.nav
{
	float:left;
	width:100%;
	height:auto;
}

.BorderRight /* For " a " Clases */
{
  border-right: 1px solid transparent; 
}
}

</style>

</head>

<body>

<nav class="navbar navbar-default">

  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
	   
	   <a href="/">
	   
<h3>Imaginary</h3>
	   
	   </a>	   
	   
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	
      <ul class="nav navbar-nav">
	  
        <li><a href="/" class="BorderRight">Home</a></li>
		
        <li><a href="tasks" class="BorderRight">Insert Tasks</a></li>

	  <li><a href="projects" class="BorderRight">View Tasks</a></li>
	  
	  <li><a href="projectsupdel" class="BorderRight">Update and Delete Tasks</a></li>

	  </ul>
	  
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<script>

//make menus drop automatically
	$('ul.nav li.dropdown').hover(function() {
		$('.dropdown-menu', this).fadeIn();
	}, function() {
		$('.dropdown-menu', this).fadeOut('fast');
	});//hover
	
</script>

</body>
</html>