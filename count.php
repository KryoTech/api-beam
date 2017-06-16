<?php

require_once 'db.php';

if(isset($_GET['poll']) && isset($_GET['val'])) {
	$q = "SELECT * FROM beam_polls p JOIN beam_events e ON e.id = p.event_id WHERE e.code = '".$_GET['poll']."'";
	$r = $conn->query($q);
	$event_id = 0;
	if ($r->num_rows > 0) {
		while($l = $r->fetch_assoc()) {
			$event_id = $l['event_id'];
		}
		// EVENT INFO FOUND
		$q = "UPDATE beam_polls SET no_reply = ".intval($_GET['val']).", targets = ".intval($_GET['val'])." WHERE beam_polls.event_id = ".$event_id;
		echo $conn->query($q) ? 'Target Size Updated' : 'Error updating';
	}
}else {

}

?>