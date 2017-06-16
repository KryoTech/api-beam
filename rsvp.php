<?php
require_once 'db.php';

if(isset($_GET['e'])) {
	// GET CURRENT VALUES
	$id = 0;
	$attending = 0;
	$not_going = 0;
	$undecided = 0;
	$no_reply = -99;


	$q = "SELECT e.id, attending, not_going, undecided, no_reply FROM beam_polls p JOIN beam_events e on p.event_id = e.id WHERE e.code = '".$_GET['e']."'";
	$r = $conn->query($q);

	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			$id = intval($l['id']);
			$attending = intval($l['attending']);
			$not_going = intval($l['not_going']);
			$undecided = intval($l['undecided']);
			$no_reply = intval($l['no_reply']);
		}
	}
	// var_dump($no_reply);
	if(isset($_GET['r'])) {
		switch ($_GET['r']) {
			case 'A':
				if($no_reply > 0) {
					$attending++;
					$no_reply--;
				}
				break;
			case 'N':
				if($no_reply > 0) {
					$not_going++;
					$no_reply--;
				}
				break;			
			case 'U':
				if($no_reply > 0) {
					$undecided++;
					$no_reply--;
				}
				break;			
		}

		$q = "UPDATE `beam_polls` SET `no_reply` = ".$no_reply.", `attending` = ".$attending." , `not_going` = ".$not_going.", `undecided` = ".$undecided." WHERE `event_id` = ".$id;
		$conn->close();
		echo json_encode(array('error' => 'Your response has been recorded. Thank you for participating.'));
	}else { echo json_encode(array('error' => 'Fatal: No response')); }
}else { echo json_encode(array('error' => 'Sorry, that event does not exist. Check your code and try again.')); }