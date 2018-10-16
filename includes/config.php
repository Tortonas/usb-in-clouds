<?php
	date_default_timezone_set("Europe/Vilnius"); //default timezone http://php.net/manual/en/timezones.php
	$WebDomain = "http://www.tortonas.tk"; // if you have SSL, use http, if you don't have it, use https.
	$ServerMemoryLimit = "400"; // server memory limit in megabytes
	$BanLength = 20; // ban length in minutes
	$MaximumTriesWhileLogging = 3; //maximum of login tries before ban
	$WebsiteTitle = "MEME REVIEW **clap clap**"; //website title
	$RandomSalt1 = "gasdgasfdas"; //if you change it, passwords are going to change
	$RandomSalt2 = "jhk654gh47"; //if you change it, passwords are going to change
	$HostAvailableTill = "2018-11-02"; //displays end of host
	$EnableRedirectionToHttps = false; //enable disable redirection to https
	$EnableBackupFiles = true; //enable or disable saving files to backup_files folder (it needs 2x space)
?>