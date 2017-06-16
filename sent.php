<?php
require_once 'db.php';

if(isset($_GET['phone'])) {	
	$number = null;
	if(($_GET['phone'][0]) === '0') {
		$number = '+63';
		for ($i=1; $i < strlen($_GET['phone']); $i++) { $number .= $_GET['phone'][$i]; }
	}else {	$number = $_GET['phone'];	}

	$student_id = -1;
	$q = "SELECT `id` FROM `accounts_students` WHERE `phone_number` = '".$number."'";
	$r = $conn->query($q);
	if ($r->num_rows > 0)  while($l = $r->fetch_assoc()) $student_id = intval($l['id']); else echo "Not a student";

	if(isset($_GET['id'])) {
		$l = "INSERT INTO `logs_sent_messages` (`id`, `student_id`, `request_id`, `timestamp`) VALUES (NULL, ".$student_id.", ".intval($_GET['id']).", CURRENT_TIMESTAMP)";
	}
}