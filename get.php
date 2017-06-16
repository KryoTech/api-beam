<?php
require_once 'db.php';

if(isset($_GET['t'])) {

	switch ($_GET['t']) {
		case 'student':
			// Returns phone numbers of all students
			$q = "SELECT phone_number FROM accounts_students WHERE active = 1 AND verified_user = 1";
			if(isset($_GET['y'])) {
				$year = intval($_GET['y']);
				if($year >= 1 && $year <= 4)
					$q .= " AND year_level = ".$year;
			}
			if(isset($_GET['c'])) {
				// Returns phone numbers of students whose course is as specified
				$q .= " AND course_abv = '".$_GET['c']."'";
			}else if(isset($_GET['i'])) {
				$q .= " AND username = ".$_GET['i'];
			}
			break;		

		case 'teacher':
			// Returns phone numbers of all teachers
			$q = "SELECT phone_number FROM accounts_teachers WHERE active = 1 AND verified_user = 1"; // WHERE verified_user = 1";
			if(isset($_GET['p'])) {
				// Phone Number -> ID
				$q = "SELECT id FROM accounts_teachers WHERE phone_number = '".$_GET['p']."'";
			}
			break;

		case 'admin':
			// Returns phone numbers of all admins
			$q = "SELECT phone_number FROM accounts_admins WHERE active = 1 AND verified_user = 1"; // WHERE verified_user = 1";
			if(isset($_GET['c'])) {
				// Returns phone numbers of admins in the specified department
				$q .= " WHERE department = '".$_GET['d']."'";
			}
			break;

		case 'group':
			// Returns group codes of all groups
			$q = "SELECT code FROM beam_groups";
			break;

		case 'keyword':
			$a = array('ITA', 'IT1', 'IT2', 'IT3', 'IT4', 'BAA', 'BA1', 'BA2', 'BA3', 'BA4', 'CRA', 'CR1', 'CR2', 'CR3', 'CR4', 'EDA', 'ED1', 'ED2', 'ED3', 'ED4');
			echo json_encode($a);
			break;

		case 'event':
			// Returns group codes of all groups
			if(isset($_GET['e'])) {
				$q = "SELECT phone_number FROM beam_event_attendees ea JOIN accounts_students s ON ea.student_id = s.id JOIN beam_events e ON ea.event_id = e.id WHERE e.code = ".$_GET['e'];
			}else {
				$q = "SELECT code FROM beam_events";
			}
			break;


		case 'member':
			if(isset($_GET['g'])) {
				$q = "SELECT phone_number FROM accounts_students s JOIN beam_group_members gm ON gm.student_id = s.id 	JOIN beam_groups g ON gm.group_id = g.id WHERE g.code = ".$_GET['g'];
			}
			break;
	}
	$a = array();
	if(isset($q)) {
		$r = $conn->query($q);
		if ($r->num_rows > 0) {
			while($l = $r->fetch_assoc()) {
				if($_GET['t'] === 'group' || $_GET['t'] === 'event') {
					if(isset($_GET['e'])) {
						$a[] = $l['phone_number'];
					}else {
						$a[] = $l['code'];
					}
				}else {
					$a[] = $l['phone_number'];
				}
			}
			echo json_encode($a);
		} else echo json_encode(null);

		$conn->close();

	}else { echo null; }

}
