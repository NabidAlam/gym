<html>
<body>
<?php
include('config/connect_to_mysql.php');
if(isset($_GET['id']))
{
$id=$_GET['id'];
$query1=mysql_query("select * from instructor where id='$id'");
$query2=mysql_fetch_array($query1);
if(isset($_POST['submit']))
{
$name=$_POST['name'];
$description=$_POST['description'];

$query3=mysql_query("update instructor set name='$name',description='$description' where id='$id'");
if($query3)
{
header('location:instructorlist.php');
}
}

?>
<form method="post" action="">
Name:<input type="text" name="name" value="<?php echo $query2['name']; ?>" /><br />
Description:<input type="text" name="description" value="<?php echo $query2['description']; ?>" /><br /><br />
<br />
<input type="submit" name="submit" value="update" />
</form>
<?php
}
?>
</body>
</html>