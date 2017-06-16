<?php
require_once 'db.php';

if(isset($_GET['id'])) {
	$q = "SELECT `first_name`,`last_name`,`middle_name`, course_abv, p.reply FROM accounts_students s JOIN logs_poll_replies p ON p.student_id = s.id WHERE p.event_id = ".intval($_GET['id']);
	$r = $conn->query($q);
	// var_dump($q)

	$csv = array();
	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			$csv[] = $l;
			// $csv['Student Name'] = $l['first_name']." ".$l['middle_name']." ".$l['last_name'];
			// $csv['Course'] = $l['course_abv'];
			// $csv['Response'] = $l['reply'];
		}
	}

	// var_dump($csv);
	$date = date('Ymd-Hms');

	header("Content-type: application/csv");
	header("Content-Disposition: attachment; filename=\"$date.csv\"");
	header("Pragma: no-cache");
	header("Expires: 0");

	$handle = fopen('php://output', 'w');

	foreach ($csv as $csv) {
		fputcsv($handle, $csv);
	}
	fclose($handle);
	exit;
}	