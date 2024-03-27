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
		<title>Delete book</title>
		<link rel="stylesheet" type="text/css" href="../css/global_styles.css" />
		<link rel="stylesheet" type="text/css" href="../css/form_styles.css" />
		<link rel="stylesheet" href="css/update_copies_style.css">
	</head>
	<body>
		<form class="cd-form" method="POST" action="#">
			<legend>Enter the book title to delete</legend>
			
				<div class="error-message" id="error-message">
					<p id="error"></p>
				</div>
				
				<div class="icon">
					<input class="b-title" type='text' name='b_title' id="b_title" placeholder="Book Title" required />
				</div>
						
				<input type="submit" name="b_delete" value="Delete Book" />
		</form>
	</body>
	
	<?php
		if(isset($_POST['b_delete']))
		{
			$query = $con->prepare("SELECT isbn FROM book WHERE title = ?;");
			$query->bind_param("s", $_POST['b_title']);
			$query->execute();
			$result = $query->get_result();
			if(mysqli_num_rows($result) != 1)
				echo error_with_field("Invalid book title", "b_title");
			else
			{
				$row = mysqli_fetch_assoc($result);
				$query = $con->prepare("DELETE FROM book WHERE isbn = ?;");
				$query->bind_param("s", $row['isbn']);
				if(!$query->execute())
					die(error_without_field("ERROR: Couldn't delete book"));
				echo success("Book successfully deleted");
			}
		}
	?>
</html>
