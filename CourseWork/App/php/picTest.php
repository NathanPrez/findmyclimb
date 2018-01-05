<?php
 
// Create connection
$con=mysqli_connect("localhost","tkiifamy_nathan","Pr3st0n88","tkiifamy_routes");
 
$Image = $_POST['Image'];



// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 $target_dir = "tki.ifa.mybluehost.me/userPictureUpload/";
 $target_dir = $target_dir . "/" . basename($_FILES["file"]["name"]);
 


 

 
// Close connections
mysqli_close($con);
?>