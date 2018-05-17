<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="utf-8" />   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
</head>

<jsp:include page="navbt.jsp"></jsp:include>

<body>

<div class="container"> <!-- Start Of The Container Class -->

<div class="row text-center"> <!-- Start Of The Row Class -->

<div class="col-md-12 col-sm-12 hero-feature"> <!-- Start Of The Col Class -->
    
 <h3>Tasks of the Developers</h3> <br>
    
    <div class="table-responsive">
            <table class="table table-striped table-bordered text-left" id="tblData">
            <thead>
                    <tr class="info">
                        <td>Project</td>
                        <td>Developer</td>
                        <td>Hours</td>
                        <td>OT</td>
                    </tr>

                <tbody id="tblBody"></tbody>
            </thead>
            </table>
	</div>
	
    <script type="text/javascript">
        $(document).ready(function () {

                $.ajax({
                    url: '/api/projects',
                    method: 'GET',
                    success: function (data) {
         
                        $.each(data, function (index, value) {
                            var row = $('<tr><td>' + value.pname + '</td><td>'
                                + value.devname + '</td><td>'
                                + value.hrs + '</td><td>'
                                + value.ot + '</td></tr>');
                            $('#tblData').append(row);
                        });
                    },
                    error: function (jQXHR) {
                        // If status code is 401, access token expired, so
                        // redirect the user to the login page
                        if (jQXHR.status == "401") {
                            $('#errorModal').modal('show');
                        }
                        else {
                            $('#divErrorText').text(jqXHR.responseText);
                            $('#divError').show('fade');
                        }
                    }
                });
           
        });
    </script>
    
</div> <!-- End Of The Col Class -->

</div> <!-- End Of The Row Class -->
		
</div> <!-- End Of The Container Class -->
 
<jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>