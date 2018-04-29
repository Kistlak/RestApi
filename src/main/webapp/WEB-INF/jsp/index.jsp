<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/WisdomIcon.jpg">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>
Imaginary Inc.
</title>

<style>

.about{
	font-family: Times New Roman;
	line-height: 180%;
	font-size:135%;
	text-align: center;
	color:#353c47;
}
 
</style>
</head>

<jsp:include page="navbt.jsp"></jsp:include>

<body>

<div class="container"> <!-- Start Of The Container Class -->

<div class="row text-center"> <!-- Start Of The Row Class -->

<div class="col-md-12 col-sm-12 hero-feature"> <!-- Start Of The Col Class -->
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
		<h2 style="text-align: center;">Imaginary Inc.</h2><br>
<div class="about">
The Imaginary Inc., a software development company, has grown its staff members dramatically during the last quarter due to their high quality deliverables. 
The board of directors has decided to develop a task based tracking system for the employees. 
Each developer is assigned multiple projects and a project can have multiple developers and a manager. 
Employees usually work eight hours per day excluding weekends. 
If they work any hours other than the standard working hours, it will be computed as overtime. <br><br><br><br><br><br><br><br>
</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>Tasks of the Developers</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Project</th>
								<th>Developer</th>
								<th>Hours</th>
								<th>OT</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.pname}</td>
									<td>${task.devname}</td>
									<td>${task.hrs}</td>
									<td>${task.ot}</td>
									<td><a href="taskupdate?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="taskdelete?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_NEW'}">
			<div class="container text-center">
				<h3>Insert Tasks</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="taskinsert">

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
							<input class="form-control" type="text" name="pdate" placeholder="dd-mm-yyyy" ">
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
					
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
					
				</form>
			</div>
		</c:when>
		
		<c:when test="${mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Update Tasks</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="taskinsert">
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

</div> <!-- End Of The Col Class -->

</div> <!-- End Of The Row Class -->
		
</div> <!-- End Of The Container Class -->
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>