<?php error_reporting(E_ERROR);
ini_set('display_errors', 'Off');
?>
<?php
	require "../db_connect.php";
	require "../message_display.php";
	require "verify_librarian.php";
	require "header_librarian.php";
?>

<html>
	<head>
		<title>Send Reminder</title>
		<link rel="stylesheet" type="text/css" href="../css/global_styles.css" />
		<link rel="stylesheet" type="text/css" href="../css/form_styles.css" />
		<link rel="stylesheet" href="css/update_copies_style.css">
		<link rel="stylesheet" href="css/register_style.css">
	</head>
	<body>
		<form class="cd-form" method="POST" action="mailto:<?php echo $_POST['m_email']; ?>">
			<h1>Send Reminder to User</h1>
			<div class="error-message" id="error-message">
				<p id="error"></p>
			</div>
			<div class="icon">
				<input class="b-isbn" type="email" name="m_email" id="m_email" placeholder="Enter Email of user" required />
			</div>					
			<input type="submit" name="send_email" value="Send Email" />
		</form>
	</body>
	
	<?php
		if(isset($_POST['send_email']))
		{
			$to = $_POST['m_email'];
			$subject = "Reminder about overdue book";
			$message = "Dear user, 
			This is a friendly reminder that you have not yet returned the book you borrowed from the library. Please return the book as soon as possible to avoid any late fees. Thank you for your cooperation.
			Best regards,
			The Library";

			$headers = 'From: library@example.com' . "\r\n" .
			    'Reply-To: library@example.com' . "\r\n" .
			    'X-Mailer: PHP/' . phpversion();

			// Open the default email client with the recipient email address filled in
			$mailto_link = 'mailto:' . $to . '?subject=' . $subject . '&body=' . $message;
			echo "<script>window.location.href='".$mailto_link."'</script>";
		}
	?>
</html>
