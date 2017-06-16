<?php
require_once 'db.php';

if(isset($_GET['t'])) {
	$number = null;
	if(($_GET['t'][0]) === '0') {
		$number = '+63';
		for ($i=1; $i < strlen($_GET['t']); $i++) { $number .= $_GET['t'][$i]; }
	}else { $number = $_GET['t']; }

	$teacher_id = 3;
	$q = "SELECT id FROM accounts_teachers WHERE verified_user = 1 AND phone_number = '".$number."'";
	$r = $conn->query($q);
	if($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) { $teacher_id = intval($l['id']); }
	}else { // No Teacher with that number found }

	if(isset($_GET['k']) && isset($_GET['m']) && isset($_GET['c'])) {
		$keyword = $_GET['k'];
		$message = $_GET['m'];
		$code = $_GET['c'];

		$q = "INSERT INTO pending_requests (id, teacher_id, keyword, message, request_code, `status`) VALUES (NULL, '".$teacher_id."', '".$keyword."', '".$message."', '".$code."', 'pending')";
		echo $conn->query($q) ? 'success' : 'request does not exist';

		$q = "SELECT id FROM pending_requests WHERE request_code = '".$code."'";	
		$r = $conn->query($q);
		if($r->num_rows > 0) {
			while($l = $r->fetch_assoc()) { $request_id = intval($l['id']); }
			$q = "INSERT INTO `logs_requests` (`id`, `request_id`, `timestamp`) VALUES (NULL, ".$request_id.", CURRENT_TIMESTAMP);";
			echo $r = $conn->query($q) ? ' success' : ' already exists';
		}else { echo 'request not found'; }
	}
	$conn->close();
}
?>