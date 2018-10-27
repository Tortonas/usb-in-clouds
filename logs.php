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
<?php
	if(IsThisMobileDevice()) //functions.php
		echo '<link href="/stylesheet-mobile.css" type="text/css" rel="stylesheet" />';
	else
		echo '<link href="/stylesheet.css" type="text/css" rel="stylesheet" />';
?>
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
		echo "Svetainės logai<br><br>";
		echo "<table align='center'>";
		echo "<tr>";
		echo "<th>ID</th>";
		echo "<th>Log</th>";
		echo "<th>Date</th> ";
		echo "</tr>";
		
		$sql = "SELECT * FROM serverLogs order by date desc";
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
				echo "<td>".$row['log']."</td>"; 
				echo "<td>".$row['date']."</td>";
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
				$sqlDelete = "delete from serverLogs where id='$userID'";
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