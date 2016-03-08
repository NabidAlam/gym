<html>
<body>
<?php
include('config/connect_to_mysql.php');
if(isset($_GET['id']))
{
$id=$_GET['id'];
$query1=mysql_query("select * from package where id='$id'");
$query2=mysql_fetch_array($query1);
if(isset($_POST['submit']))
{
$title=$_POST['title'];
$description=$_POST['description'];
$price=$_POST['price'];
$query3=mysql_query("update package set title='$title',description='$description', price='$price' where id='$id'");
if($query3)
{
header('location:packagelist.php');
}
}

?>
<form method="post" action="">
Name:<input type="text" name="title" value="<?php echo $query2['title']; ?>" /><br />
Description:<input type="text" name="description" value="<?php echo $query2['description']; ?>" /><br />
Price:<input type="number" name="price" value="<?php echo $query2['price']; ?>" /><br /><br />
<br />
<input type="submit" name="submit" value="update" />
</form>
<?php
}
?>
</body>
</html>