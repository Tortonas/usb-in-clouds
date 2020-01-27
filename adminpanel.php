<?php
require 'includes/mysql_login.php';
require 'includes/config.php';
require 'includes/functions.php';
session_start();
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
<?php

	if($EnableRedirectionToHttps)
	{
		require 'includes/redirect_to_https.html';
	}
?>
</head>

<body background="background.png">

<div class="container">
<?php
	if(isset($_POST['logout']))
	{
		echo "<font color='red' size='15'>Atsijungėte!</font>";
		$_SESSION['status'] = "user";
		$_SESSION['nick'] = null;
		$_SESSION['password'] = null;
		echo "<meta http-equiv='refresh' content='1; url=".$WebDomain."' />";
		return;
	}
	CheckSessionLoggings();

	//Patikrina iki kada suteiktas leidimas peržiūrėti failus ir issaugo i kintamaji.
	$AccesTill = null;
	$Today = date("Y-m-d H:i:s");
	$sqlCheckPermissions = "select * from serverAdmins";
	$resultsCheckPermissions = mysqli_query($conn, $sqlCheckPermissions);
	while($row = mysqli_fetch_assoc($resultsCheckPermissions))
 	{
 		if($_SESSION['nick'] == $row['nick'])
 		{
 			$AccesTill = $row['accesTill'];
 			break;
 		}
	}

	if(empty($_SESSION['status']))
		$_SESSION['status'] = "user";

	if($_SESSION['status'] == "admin" || $_SESSION['status'] == "superadmin")
	{
		echo '<form method="post">';

		echo '<div class="mx-auto text-center"> <button class="btn btn-danger mx-auto" type="submit" name="logout">Atsijungti</button></div>';
		echo '</form>';

		echo '<br><div class="card bg-info mx-auto p-3" style="width: 35rem;>
  <div class="card-body text-center">Prisijungęs kaip <b>'.$_SESSION['nick'].'</b></div></div>
</div><br>';

	

		//Chekina ar yra prieeiga prie failų peržiūros, atsisiuntimo bei įkelimo.
		
		if($_SESSION['status'] == "superadmin" || $AccesTill > $Today)
		{
			//Atidaro direktoriją
			$resource = opendir("files");
			//Skaito direktorija
			$entryIndex = 0;
			$whiteListedItems = array();

			//Sukuria apsaugotų item WHITELIST.
			$sqlCheckWhiteList = "select * from serverWhiteListedFiles";
			$sqlResultsCheckWhiteList = mysqli_query($conn, $sqlCheckWhiteList);

			if (mysqli_num_rows($sqlResultsCheckWhiteList) > 0) 
			{
				while($row = mysqli_fetch_assoc($sqlResultsCheckWhiteList))
				{
					array_push($whiteListedItems, $row['file']);
				}
			}

			//Failu pavadinimu masyvas.

			$filesArray = array();

			//Strukturos "pakaitalas", nenaudojau naudoti klasiu, kad nemaisyti OOP su proceduriniu.
			$fileId = array();
			$fileName = array();
			$fileVisibility = array();

			//Uzpildo masyvus su failu vardais, id bei matomumu.
			$sqlReadServerFiles = "select * from serverFiles";
			$sqlResultsReadServerFiles = mysqli_query($conn, $sqlReadServerFiles);

			while($row = mysqli_fetch_assoc($sqlResultsReadServerFiles))
			{
        		array_push($fileId, $row['id']);
        		array_push($fileName, $row['fileName']);
        		array_push($fileVisibility, $row['fileVisibility']);
   			}

			$size = FindHowManySpaceFilesTake(); //Kintamasis kuris didins save pridedamas prie saves kiek sveria failas.
			$backupSize = FindHowManySpaceBackupFilesTake();

			$dir = "files";
			chdir($dir); // "Returns TRUE on success or FALSE on failure" http://php.net/manual/en/function.chdir.php.
			array_multisort(array_map('filemtime', ($filesArray = glob("*.*"))), SORT_DESC, $filesArray); //Tipo sortina kazkaip magiskai
			$dir = $_SERVER['DOCUMENT_ROOT'];
			chdir($dir); //Atstato pagrindine direktorija atgal i public_html

			
			echo '<div class="card mx-auto bg-info" style="width: 30rem;">Failų sąrašas<ul class="list-group bg-info">';
		
			foreach ($filesArray as $entry)
			{
				//Failu matomumas pagal matomumo flaga.
				$doIPrintThisFileToUser = false;
				//Chekina ar useris gali matyti si entry t.y. faila.
				for($i = 0; $i < sizeof($fileName); $i++)
				{
					if($fileName[$i] == $entry)
					{
						if($fileVisibility[$i] == $_SESSION['status'])
						{
							$doIPrintThisFileToUser = true;
							break;
						}
					}
				}
				//nustatymas, kad owneris matytu VISUS failus.
				if($_SESSION['status'] == "superadmin")
				{
					$doIPrintThisFileToUser = true;
				}
				if($doIPrintThisFileToUser)
				{
					$entryIndexString = "file".$entryIndex;
					echo '<li class="list-group-item d-flex justify-content-between align-items-center">';
					echo "<form method='post'>";
					echo '<a href="files/'.$entry.'">'.$entry.'</a> ';
					//Chekina ar item yra whiteliste, jeigu ne, padaro mygtuka, jeigu yra, tada nepaspaudziama X.
					if(in_array($entry, $whiteListedItems))
						echo "<button type='submit' class='btn btn-sm btn-danger' name='".$entryIndexString."' disabled>X</button><br>";
					else	
						echo "<button type='submit' class='btn btn-sm btn-danger' name='".$entryIndexString."'>X</button><br>";
						//echo '<span class="badge badge-primary badge-pill"><button name="changerole12" class="btn btn-primary btn-sm">Patvirtintas</button></span>';
					echo "</form>";
					// Failo trinimas
					if(isset($_POST[$entryIndexString]))
					{
						if($_SESSION['status'] == "superadmin")
						{
							echo "Ištrintas<br>";
							$path = "files/".$entry;
							unlink($path);
							$sqlDeleteFileFromDb = "delete from serverFiles where fileName='$entry'";
							//Logu struktura: "User (IP) did ..."
							$logText = $_SESSION['nick']." deleted a file (".$entry.") from the server";
							AddToLogs($logText);
							mysqli_query($conn, $sqlDeleteFileFromDb);
							header("Refresh:0");
						}
						else
						{
							//Logu struktura: "User (IP) did ..."
							$logText = $_SESSION['nick']." tried to delete file (".$entry.")";
							AddToLogs($logText);
							echo "<font color='red'>Nėra privilegijos trinti failus!</font><br>";
						}
					}
					$entryIndex++;
					echo '</li>';
				}
			
			}
			echo '</ul></div>';
			
			//Failo įkelimas į serverinę
			echo "<br>";
			echo '<div class="card mx-auto p-3 bg-info" style="width: 35rem;>
				  <div class="card-body mx-auto">';
			echo "<form method='POST' enctype='multipart/form-data'>"; // be enctype neveikia
			echo '<input type="checkbox" name="canAdminSee" value="yes" checked>Ar Guest (admin) galės matyti failą?<br>';
			echo "<input type='file' name='file'>";
			echo "<button type='submit' name='submit'>Upload</button><br>";
			echo "</form></div></div>";

			//Logika vykdoma po UPLOAD paspaudimo
			if (isset($_POST['submit']))
			{
				ini_set('upload_max_filesize', '10M');
				$file = $_FILES['file'];
				$fileName = $_FILES['file']['name'];
				$fileTmpName = $_FILES['file']['tmp_name'];
				$fileSize = $_FILES['file']['size'];
				$fileError = $_FILES['file']['error'];
				$fileType= $_FILES['file']['type'];

				if($fileError === 0)
				{
					$fileDestination = "files/".$fileName;
					$backupFileDestination = "backup_files/".$fileName;
					//Chekina ar keliamas failas replacintu whitelistinta faila, jeigu replacintu, pranesa jog draudziama.
					if(in_array($fileName, $whiteListedItems))
					{
						echo "<font color='red'>Negalima!</font><br>";
					}
					else
					{					
						$sqlSaveFromDuplicate = "delete from serverFiles where fileName='$fileName'";
						mysqli_query($conn, $sqlSaveFromDuplicate);
						move_uploaded_file($fileTmpName, $fileDestination);

						if($EnableBackupFiles) //Jeigu ijungtas, tada padubliuoja faila ir ji iraso i backup_files folderi.
							copy($fileDestination, $backupFileDestination);

						$newFileVisibility = null;
						if(isset($_POST['canAdminSee']))
							$newFileVisibility = "admin";
						else
							$newFileVisibility = "superadmin";
						$sqlInsertFileNameToDb = "insert into serverFiles (fileName, fileVisibility) VALUES ('$fileName', '$newFileVisibility')";
						mysqli_query($conn, $sqlInsertFileNameToDb);
						//Logu struktura: "User (IP) did ..."
						$logText = $_SESSION['nick']." uploaded a file (".$fileName.") into the server";
						AddToLogs($logText);
						header('Location: /adminpanel');
					}
				}
				else
				{
					echo "<font color='red'>Error įkeliant failą.</font><br>";
					echo $_FILES['file']['error'];
				}
			}

			echo '<div class="card mx-auto p-3 bg-info" style="width: 35rem;>
			  <div class="card-body mx-auto">';
			echo "<br>Užimta vietos serveryje " . round($size / 1024 / 1024,2) . "MB iš ".$ServerMemoryLimit." MB<br>";
			if($EnableBackupFiles)
			{
				echo "Backup files aplankalas užima " . round($backupSize / 1024 / 1024,2) . " MB<br>";
				if($_SESSION['status'] == "superadmin")
				{
					echo "<form method='POST'>";
					echo "<button type='submit' class='btn btn-danger' name='deleteBackupFolder'>Ištrinti backup aplankalą</button><br>";
					echo "</form>";
					if(isset($_POST['deleteBackupFolder']) && $_SESSION['status'] == "superadmin") //double apsauga? nezinau ar tai sudarys itakos 
					{
						$backupFiles = glob('backup_files/*');
						foreach($backupFiles as $backupFile)
						{ 
						  	if(is_file($backupFile))
						    	unlink($backupFile); 
						    echo "Ištrintas: ".$backupFile;
						}
						//Logu struktura: "User (IP) did ..."
						$logText = $_SESSION['nick']." just deleted backup files";
						AddToLogs($logText);
					}	
				}
			}
			echo "<br>";
		}
		else
			echo "<font color='red'>Nėra leidimo peržiūrėti, atsisiųsti bei įkelti failų!</font><br>";
			if($_SESSION['status'] == "superadmin") //extra linkus rodys tik owneriui
			{
				echo "<a href='logs'>Logai</a><br>";
				echo "<a href='badlogins'>Blogų prisijingimų sąrašas</a><br>";
			}

		//Sukuria GUEST lankytojui laikiną prieeiga prie failų sąrašo.
		if($_SESSION['status'] == "superadmin")
		{
			echo "Svetainė galioja iki: ".$HostAvailableTill."<br>";
			echo "<br>";
			echo "<form method='POST'>";
			echo "<input type='text' name='permissionMinutes' placeholder='Laikas minutemis' value='5'><br>";
			echo "<button type='submit' class='btn btn-success' name='submitPermissions'>Privilegijos admin lankytojams</button><br><br>";
			echo "</form>";
			if(isset($_POST['submitPermissions']))
			{
				$canIUpdate = is_numeric($_POST['permissionMinutes']); //pachekina ar ivestas tekstas yra skaicius.
				if($canIUpdate)
				{
					$permissionMinutes = mysqli_real_escape_string($conn, $_POST['permissionMinutes']);
					$newAccesTillDate = date("Y-m-d H:i:s", strtotime($Today.'+ '.$permissionMinutes.' minutes'));
					$sqlSetGuestPermissions = "update serverAdmins set accesTill='$newAccesTillDate' where status='admin'";
					mysqli_query($conn, $sqlSetGuestPermissions);
					echo "Uždėtos privilegijos iki: ".$newAccesTillDate."<br>";
					//Logu struktura: "User (IP) did ..."
					$logText = $_SESSION['nick']." gave permissions to admin accounts till ".$newAccesTillDate;
					AddToLogs($logText);
				}
				else
					echo "<font color='red'>Problemos su įvestimi!</font><br>";
			}
		}
		
		echo '</div></div>';

		mysqli_close($conn);
	}
	else
	{
		echo "<font color='red' size='15'>Neturite leidimo peržiūrėti failų!</font>";
	}
	
?>
</div>

</body>

</html>