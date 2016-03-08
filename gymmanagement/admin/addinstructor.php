<?php

session_start();
if(!isset($_SESSION["ADMIN_ID"])){
	ob_start();
	header("location: login.php");
	ob_end_flush();
}
?>

<?php

$name = "";
$description = "";
//$price = "";





if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST["name"])) {



     $name = test_input($_POST["name"]);
	 $description = $_POST["description"];
	 //$price = test_input($_POST["price"]);
	

		include "config/connect_to_mysql.php";
		$sql = mysql_query("INSERT INTO `instructor`(`name`, `description`)
							VALUES (
									'$name',
									'$description'
									
									
									)")or die(mysql_error());

		$Photo_id = mysql_insert_id();

		$newname = "$Photo_id.jpg";
		move_uploaded_file($_FILES['image']['tmp_name'], "../images/instructors/$newname");


		if($sql){
			ob_start();
			header("location: addinstructor.php");
			ob_end_flush();
			exit();
	    }else{
			$msg = "Unsuccessfull";
		}
		


}

function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
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

    <title>Sky View Gym Admin Panel</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  
	<script type="text/javascript">
	var ar_ext = ['JPEG', 'JPG', 'jpeg', 'jpg', 'PNG', 'png'];        // array with allowed extensions

	function checkName(el) {

	  // get the file name and split it to separe the extension
	  var name = el.value;
	  var ar_name = name.split('.');

	  // check the file extension
	  var re = 0;
	  for(var i=0; i<ar_ext.length; i++) {
	    if(ar_ext[i] == ar_name[1]) {
	      re = 1;
	      break;
	    }
	  }

	  // if re is 1, the extension is in the allowed list
	  if(re==1) {


	  }
	  else {
	    // delete the file name, disable Submit, Alert message
	    el.value = '';
	    alert('".'+ ar_name[1]+ '" is not an file type allowed for upload');
	  }
	}
	</script>

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
                             Add Instructor
                        </h1>
                       
                    </div>
                </div>
                <!-- /.row -->



                <div class="row">

                    <form class="col-md-12"  name="name" action='addinstructor.php' method='post' enctype="multipart/form-data">

					<div class="form-group" >
				        <input type="text" name="name" class="form-control input-lg" placeholder="Name" required="required">
				    </div>
				    <!--<div class="form-group" >
				        <input type="text" name="description" class="form-control input-lg" placeholder="Description" required="required">
				    </div>-->
					<div class="form-group" >
				        <textarea name="description" class="form-control input-lg" rows="10" placeholder="Description" required="required"></textarea>
				    </div>
				    
					
					<div class="form-group">

				        <input type="file" name="image" id="image" class="form-control input-lg"  onchange="checkName(this)" title="Please upload only image file.">

				    </div>

				    <div class="form-group">
				        <input type="submit" name="save" class="btn btn-primary btn-lg btn-block" value='Save' >
				    </div>
			</form>


                </div>
                         
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
