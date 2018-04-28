<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Task Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Bootsample</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">New Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Task Manager</h1>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Project Name</th>
								<th>Developer Name</th>
								<th>Date</th>
								<th>Hours</th>
								<th>OT</th>
								<th>Description</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.pname}</td>
									<td>${task.devname}</td>
									<td>${task.pdate}</td>
									<td>${task.hrs}</td>
									<td>${task.ot}</td>
									<td>${task.des}</td>
<%-- 									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td> --%>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_NEW'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">

					<div class="form-group">
						<label class="control-label col-md-3">Project Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="pname" />
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Developer Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="devname" />
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Date</label>
						<div class="col-md-7">
							<input class="form-control" type="text" name="pdate" placeholder="mm-dd-yyyy" ">
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Hours</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="hrs" "/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">OT</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="ot" "/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="des" "/>
						</div>				
					</div>
					
					<!-- <div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div> -->		
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
					
				</form>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					
					<input type="hidden" name="pname" value="${task.pname}"/>
					
					<input type="hidden" name="devname" value="${task.devname}"/>
					
					<input type="hidden" name="des" value="${task.des}"/>

					<div class="form-group">
						<label class="control-label col-md-3">Date</label>
						<div class="col-md-7">
							<input class="form-control" type="text" name="pdate" placeholder="mm-dd-yyyy" value="${task.pdate}">
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">Hours</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="hrs" value="${task.hrs}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<label class="control-label col-md-3">OT</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="ot" value="${task.ot}"/>
						</div>				
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Update"/>
					</div>
					
				</form>
			</div>
		</c:when>	
				
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>