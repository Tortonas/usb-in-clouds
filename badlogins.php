<?php
require 'includes/mysql_login.php';
require 'includes/config.php';
require 'includes/functions.php';
session_start()
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<?php
	echo "<title>".$WebsiteTitle."</title>"
?>
<link rel="icon" href="favicon.png" type="image/png" sizes="16x16">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="/stylesheet.css" type="text/css" rel="stylesheet" />
</head>

<body background="background.png">
<div id="divStyle">
<form method="get" action="/adminpanel">
	<button href="index">Atgal</button>
	<br>
</form>



<?php
CheckSessionLoggings();

	if(empty($_SESSION['status']))
		$_SESSION['status'] = "user";

	if($_SESSION['status'] == "superadmin")
	{
		echo "Blogų prisijungimų sąrašas prie duomenų bazės<br><br>";
		echo "<table align='center'>";
		echo "<tr>";
		echo "<th>ID</th>";
		echo "<th>IP</th> ";
		echo "<th>Tries</th>";
		echo "<th>Banned till</th>";
		echo "<th>Last login</th>";
		echo "<th>Still banned?</th>";
		echo "</tr>";
		
		
		/*
		Reikalingas DB:
		Pavadinimas: serverBadLogins
		id - int
		ip - varchar
		tries - int
		banned - bit
		*/
		
		$sql = "SELECT * FROM serverBadLogins";
		//Pasiunčia SQL komandą į DB
		$result = mysqli_query($conn, $sql);

		$currentTime = date("Y-m-d H:i:s");

		if(mysqli_num_rows($result) > 0)
		{
			//Eina per DB eilučių masyvą
			while($row = mysqli_fetch_assoc($result))
			{
				echo "<tr>";
				echo "<td>".$row['id']."</td>"; 
				echo "<td>".$row['ip']."</td>";
				echo "<td>".$row['tries']."</td> ";
				echo "<td>".$row['bannedTill']."</td>";
				echo "<td>".$row['lastLogin']."</td> ";
				if($row['bannedTill'] > $currentTime)
					echo "<td>Yes</td>";
				else
					echo "<td>No</td>";
			    echo "</tr>";
			}
		}
		else
		{
			echo "Duomenų bazė tuščia";
		}
		echo "</table>";
		echo "<form method='POST'>";
		echo "<input name='deleteid' placeholder='ID'></input><br>";
		echo "<button name='buttondeleteid'>Ištrinti</button>";
		echo "</form>";
		if(isset($_POST['buttondeleteid']))
		{
			if($_SESSION['status'] == "superadmin")
			{
				$userID = $_POST['deleteid'];
				$sqlDelete = "delete from serverBadLogins where id='$userID'";
				if(mysqli_query($conn, $sqlDelete))
				{
					//Parefreshina puslapį, kad iškarto atsirastu rezultatas.
					header("Refresh:0");
					echo $userID." ID ištrintas";
				}
				else
				{
					echo "Erroras: ".mysqli_error($conn);	
				}
			}
			else
			{
				echo "Jūsų paskyra neturi teisės";
			}
		}
		mysqli_close($conn);
	}
	else
	{
		echo "Neturite teisių peržiūrėti puslapio informacijos<br>";
	}
?>
</div>
</body>

</html>