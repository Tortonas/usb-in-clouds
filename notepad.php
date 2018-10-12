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

		//UZRASINES SPAUSDINIMAS
		echo "Užrašinė<br><br>";
		echo "<table align='center'>";
		echo "<tr>";
		echo "<th>ID</th>";
		echo "<th>Text</th> ";
		echo "</tr>";
		$sqlGetNotepadText = "SELECT * FROM serverNotepad";
		//Pasiunčia SQL komandą į DB
		$sqlResultGetNotepadText = mysqli_query($conn, $sqlGetNotepadText);


		if(mysqli_num_rows($sqlResultGetNotepadText) > 0)
		{
			//Eina per DB eilučių masyvą
			while($row = mysqli_fetch_assoc($sqlResultGetNotepadText))
			{
				echo "<tr>";
				echo "<td>".$row['id']."</td>"; 
				echo "<td>".$row['text']."</td>";
			    echo "</tr>";
			}
		}
		else
		{
				echo "<tr>";
				echo "<td>-1</td>"; 
				echo "<td>Duomenų bazė tuščia</td>";
			    echo "</tr>";
		}
		echo "</table>";
		echo "<br><br>";
		//IRASYMAS I UZRASINE

		echo "</table>";
		echo "<form method='POST'>";
		echo "<input name='inserttext' placeholder='Tekstas'></input>";
		echo "<button name='buttoninsert'>Įrašyti</button>";
		echo "</form>";
		if(isset($_POST['buttoninsert']))
		{
			if($_SESSION['status'] == "superadmin")
			{
				$textID = $_POST['inserttext'];
				$sqlInsert = "insert into serverNotepad (text) VALUES ('$textID')";
				if(mysqli_query($conn, $sqlInsert))
				{
					//Parefreshina puslapį, kad iškarto atsirastu rezultatas.
					header("Refresh:0");
					echo $textID." tekstas įrašymas";
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

		//UZRASINES TRINIMAS
		echo "</table>";
		echo "<form method='POST'>";
		echo "<input name='deleteid' placeholder='ID'></input>";
		echo "<button name='buttondeleteid'>Ištrinti</button>";
		echo "</form>";
		if(isset($_POST['buttondeleteid']))
		{
			if($_SESSION['status'] == "superadmin")
			{
				$textID = $_POST['deleteid'];
				$sqlDelete = "delete from serverNotepad where id='$textID'";
				if(mysqli_query($conn, $sqlDelete))
				{
					//Parefreshina puslapį, kad iškarto atsirastu rezultatas.
					header("Refresh:0");
					echo $textID." ID ištrintas";
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