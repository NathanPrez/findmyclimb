<?php
 
// Create connection
$con=mysqli_connect("localhost","tkiifamy_nathan","Pr3st0n88","tkiifamy_routes");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations'
/*
$sql = "SELECT `Image` FROM `routes`";


if($result = mysqli_query($con, $sql)){
	echo "test 1 \n";
	$resultArray = array();
	while($row = $result->fetch_object())
	{
		$resultArray = $row;
		echo count($resultArray);
		echo "test 2 \n";
		echo "test 3 \n";
		echo '<img src="data:image/jpeg;base64,'.base64_encode($row).'"/>';
		echo "test 4 \n";
	}
}
*/
$sql = "SELECT * FROM `routes`";
$sth = $con->query($sql);
$result=mysqli_fetch_array($sth);
echo '<img src="data:image/jpeg;base64,'.base64_encode( $result['Image'] ).'"/>';


mysqli_close($con);
?>
