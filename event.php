<?php

require_once 'db.php';

if(isset($_GET['code'])) {
	// Get event information using event code
	$q = "SELECT * FROM beam_events WHERE code = ".$_GET['code'];
	$r = $conn->query($q);

	// var_dump($q);
	// var_dump($r);
	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			echo json_encode($l);
		}
	}

	// if(isset($_GET['keyword'])) {
	// 	$q = "INSERT INTO "
	// }

	$conn->close();
}

?>