<?php
 
// Create connection
$con=mysqli_connect("localhost","tkiifamy_nathan","Pr3st0n88","tkiifamy_routes");
 
$Location = $_POST['Location'];
$Grade = $_POST['Grade'];
$Description = $_POST['Description'];
$ImageNum = $_POST['ImageNum'];


// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations'
$sql = "INSERT INTO `routes`(`Location`, `Grade`, `Description`, `ImageNum`) VALUES ('$Location','$Grade','$Description', '$ImageNum')";
 

 
if ($con->query($sql) === TRUE) {
    echo "New record created successfully";
} 
else {
    echo "Error: " . $sql . "<br>" . $con->error;
}
 
// Close connections
mysqli_close($con);
?>