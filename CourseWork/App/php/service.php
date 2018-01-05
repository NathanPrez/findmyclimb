<?php
 
// Create connection
$con=mysqli_connect("localhost","tkiifamy_nathan","Pr3st0n88","tkiifamy_partners");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations'
$sql = "SELECT * FROM Details";
 

if ($result = mysqli_query($con, $sql))//see if any output present
{
	
	$resultArray = array();
	$tempArray = array();//results added into the temporary array
 
	// Loop through each row in the result set
	while($row = $result->fetch_object())
	{
		// Add each row into our results array
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}
 
	// Finally, encode the array to JSON and output the results
	echo json_encode($resultArray);
}
 
// Close connections
mysqli_close($con);
?>