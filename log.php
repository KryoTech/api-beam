<?php
require_once 'db.php';

if(isset($_GET['i'])) {
	$number = null;
	if(($_GET['i'][0]) === '0') {
		$number = '+63';
		for ($i=1; $i < strlen($_GET['i']); $i++) { 
			$number .= $_GET['i'][$i];
		}
	}else {
		$number = $_GET['i'];
	}

	$q = "SELECT * FROM logs_poll_replies p JOIN accounts_students s ON p.student_id = s.id WHERE phone_number = ".$_GET['i'];
	$r = $conn->query($q);

	if ($r->num_rows === 0) {
		$student_id = -1;
		$event_id = -1;
		$q = "SELECT `id` FROM `accounts_students` WHERE `phone_number` = '".$number."'";
		$r = $conn->query($q);

		if ($r->num_rows > 0) {
			while($l = $r->fetch_assoc()) 
				$student_id = intval($l['id']); 

			if(isset($_GET['e'])) {
				$q = "SELECT `id` FROM `beam_events` WHERE `code` = '".$_GET['e']."'";
				$r = $conn->query($q);
				if ($r->num_rows > 0) {
					while($l = $r->fetch_assoc()) 
						$event_id = intval($l['id']); 
					if(isset($_GET['r'])) {
						$l = "INSERT INTO `logs_poll_replies` (`id`, `student_id`, `event_id`, `reply`, `timestamp`) VALUES (NULL, '".$student_id."', '".$event_id."', '".$_GET['r']."', CURRENT_TIMESTAMP);";
						$conn->query($l);
						if($_GET['r'] === 'A') {
							$l = "INSERT INTO `beam_event_attendees` (`id`, `event_id`, `student_id`) VALUES (NULL, '".$event_id."', '".$student_id."');";
							$conn->query($l);
							echo json_encode(array('error' => 'Your response has been recorded. Thank you for participating.'));
						}
					}
				}else echo json_encode(array('error' => 'Sorry, that event does not exist. Check your code and try again.'));
			}		
		}else echo json_encode(array('error' => 'Sorry, it appears you are not allowed to use this feature'));
	}else echo json_encode(array('error' => 'Sorry, you can only respond once per poll'));
	$conn->close();
}else {
	echo json_encode(null);
}