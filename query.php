<html>
	<title>CS143 Project 1B</title>
	<body>
	<h1>CS143 Project 1B</h1>
	<p>Version 1.0 </p>
	<p>Example:SELECT * FROM Actor WHERE id=10;</p>
<form method = "GET" id="usrform">
<textarea rows="10" cols="70" name="result" form="usrform">
</textarea> <br>
<input type="submit" value="Click Me!">
</form>
	</body>
</html>
<?php
    $db_connection = mysql_connect("localhost", "cs143", "");
    if ($db_connection==FALSE){
    	echo "connection cannot be established, please make sure you connected";
    	return ;
    }
    mysql_select_db("CS143", $db_connection);
    if (isset($_GET['result'])){
        $command=$_GET['result'];
        if($command=="")
        {
            return;
        }
        else
        {
            $rs = mysql_query($command, $db_connection);
            if (!$rs){
            	echo "<h3>here is the error message:</h3>";
            	exit(mysql_error());
            }
            echo "<h3>Here is you input:</h3>";
            echo "$command";
            echo "<h3>Results from MySQL:</h3>";
            echo "<table border=\"1\" style=\"width:auto\">";
            $columns = mysql_num_fields($rs);
            echo "<tr>";
            for ($i = 0; $i < $columns; $i++) {
                
                echo "<td><B>".mysql_field_name($rs, $i)."</B></td>";
            }
            echo "</tr>";
            while($row=mysql_fetch_row($rs))
            {
                echo "<tr>";
                for($i=0;$i<$columns;$i++)
                {
                    if($row[$i]!=NULL)
                    echo "<td>".$row[$i]."</td>";
                    else
                    echo "<td>"."N/A"."</td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        }
    }
    mysql_close($db_connection);
?>