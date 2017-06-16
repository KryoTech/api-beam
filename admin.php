<?php
require_once 'db.php';

if($_GET['i']) {
	$admin_id = -1;
	// Get admin id from phone_number
	$q = "SELECT `id` FROM `accounts_admins` WHERE `phone_number` = '".$_GET['i']."'";
	$r = $conn->query($q);

	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			$admin_id = intval($l['id']);
			var_dump($admin_id);
		}
	}

	if(isset($_GET['a']) && isset($_GET['d'])) {	
		// Use admin id to insert to logs table
		$l = "INSERT INTO `logs_admin_actions` (`id`, `admin_id`, `action`, `details`, `timestamp`) VALUES (NULL, '".$admin_id."', '".$_GET['a']."', '".$_GET['d']."', CURRENT_TIMESTAMP)";

		if ($conn->query($l) === TRUE) {
	    echo "true";
		} else {
	    echo "false";
		}

	}
	$conn->close();
}else {
	echo json_encode(null);
}