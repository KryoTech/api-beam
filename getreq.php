<?php

require_once 'db.php';

if(isset($_GET['code'])) {
	$request_id = 0;
	// Get request's ID from provided request_code
	$q = "SELECT pr.id, keyword, message, phone_number FROM pending_requests pr JOIN accounts_teachers t ON t.id = pr.teacher_id WHERE request_code = '".$_GET['code']."'";
	$r = $conn->query($q);
	// var_dump($q);
	$payload = array();
	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			$payload['keyword'] = $l['keyword'];
			$payload['message'] = $l['message'];
			$payload['id'] = $l['id'];
			$payload['teacher'] = $l['phone_number'];
			$request_id = intval($l['id']);
			// var_dump($l);
		}
	}

	if(isset($_GET['action'])) {
		$q = "UPDATE `pending_requests` SET `status` = '".$_GET['action']."' WHERE status = 'pending' AND `request_code` = ".$_GET['code'];
		if($conn->query($q) && $_GET['action'] === 'approved') {
			// Successfully updated
			echo json_encode($payload);
		}	
	}
}