<?php
 
// Create connection
$con=mysqli_connect("localhost","tkiifamy_nathan","Pr3st0n88","tkiifamy_partners");
 
$Fname = $_POST['Fname'];
$Sname = $_POST['Sname'];
$number = $_POST['number'];
$email = $_POST['email'];
$description = $_POST['description'];

// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations'
$sql = "DELETE FROM `Details` WHERE `First Name` LIKE '$Fname' AND `Second Name` LIKE '$Sname' AND `Phone Number` LIKE '$number' AND`Email` LIKE '$email' AND `Description` LIKE '$description'";
 

 
if ($con->query($sql) === TRUE) {
    echo "record deleted successfully";
} 
else {
    echo "Error: " . $sql . "<br>" . $con->error;
}
 
// Close connections
mysqli_close($con);
?>