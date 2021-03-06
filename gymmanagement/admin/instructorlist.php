<?php 
session_start();
if(!isset($_SESSION["ADMIN_ID"])){
	ob_start();
	header("location: login.php");
	ob_end_flush();	
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Instructor List List |Sky View Fitness Center</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
		<?php include_once("include_templates/navigation.php"); ?>

		<div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Instructor
                            <small>List</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.php">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> instructors
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
				        <!-- Content Row -->
        <div class="row">
            <!-- Content Column -->
            <div class="col-lg-12">
              <h2 class="sub-header"> instructors </h2>
			  <div class="table-responsive">
				<table class="table table-striped">
				  <thead>
					<tr>
					  <th>ID</th>
					  <th>Name</th>
                                            <th>Description</th>
					 
					</tr>
				  </thead>
				  <tbody>
				  
					<?php 
					include "config/connect_to_mysql.php";
					$instructor_id = "";
					$instructor_name = "";
					$instructor_description = "";
						
						
					$sql = mysql_query("SELECT * FROM instructor ORDER BY id") OR DIE(mysql_error());
					$numberofrows = mysql_num_rows($sql);
					if($numberofrows > 0){
						while($row = mysql_fetch_array($sql)){
								$instructor_id = $row["id"];
								$instructor_name = $row["name"];
								$instructor_description = $row["description"];
								
								?>
							
							<tr>
							  <td>	<?php echo $instructor_id; ?>	</td>
							  <td> 	<?php echo $instructor_name  ?>  </td>
							  <td> 	<?php echo $instructor_description ?> </td>
                                                        
							  
                                                          <td><a href="instructor_edit.php?id=<?php echo $instructor_id ; ?>" class="btn btn-success">Update</a></td>
							  <td><a href="instructor_delete.php?id=<?php echo $instructor_id ; ?>" class="btn btn-danger">Delete</a></td>
                                                         
							</tr>
						
							<?php 
						}
					}
					?>

				  </tbody>
				</table>
			  </div>
            </div>
        </div>
        <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

</body>

</html>
