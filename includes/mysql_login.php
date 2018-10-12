<?php
	$dbServer = "localhost";
	$dbUsername = "***";
	$dbPassword = "***";
	$dbName = "***";
	$conn = mysqli_connect($dbServer, $dbUsername, $dbPassword, $dbName);
	
	if($conn == false)
	{
		//Jeigu prisijungimas blogas, stabdo kodą.
		die("Prisijungimas prie duomenu bazes buvo blogas<br>".mysqli_connect_error());
	}

	
	
?>