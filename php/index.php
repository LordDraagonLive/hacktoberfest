<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Hello World PHP</title>
</head>
<body>
	<?php
		function hello($string = null) {
			if($string) {
				echo "Hello " . $string;
			}else {
				echo "I would say Hello but there is nothing to say hello to.";
			}
		}
	?>
	<?= hello('World'); ?>
	<hr>
	<?= hello(); ?>
</body>
</html>