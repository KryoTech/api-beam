<?php
require_once 'db.php';

$p = array();

if($_GET['device']) {
	if(isset($_GET['d'])) {
		$q = "UPDATE accounts_pending SET sent = '1' WHERE id = ".$_GET['d'];
		$r = $conn->query($q);
	}else {
		$q = "SELECT * FROM accounts_pending WHERE sent = 0";
		$r = $conn->query($q);

		if ($r->num_rows > 0) {
			while($l = $r->fetch_assoc()) {
				$p[] = array(
					'id' => $l['id'],
					'phone_number' => $l['phone_number'],
					'code' => $l['verification_code']
					);
			}
			echo json_encode($p);
		}else {
			echo json_encode($p = null);
		}

	}
}else {
	echo json_encode($p = null);
}