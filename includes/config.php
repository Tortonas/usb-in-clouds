<?php
	date_default_timezone_set("Europe/Vilnius"); //default timezone http://php.net/manual/en/timezones.php
	$WebDomain = "https://tortonas.eu"; // if you have SSL, use https, if you don't have it, use http. ALSO DONT USE WWW
	$ServerMemoryLimit = "400"; // server memory limit in megabytes
	$BanLength = 20; // ban length in minutes
	$MaximumTriesWhileLogging = 3; //maximum of login tries before ban
	$WebsiteTitle = "MEME REVIEW **clap clap**"; //website title
	$RandomSalt1 = "gasdgasfdas"; //if you change it, passwords are going to change
	$RandomSalt2 = "jhk654gh47"; //if you change it, passwords are going to change
	$HostAvailableTill = "2019-05-31"; //displays end of host
	$EnableRedirectionToHttps = false; //enable disable redirection to https
	$EnableBackupFiles = true; //enable or disable saving files to backup_files folder (it needs 2x space)
?>