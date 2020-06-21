<!DOCTYPE html>
<html>
<header>
    <title>Courses</title>
    <link href="style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</header>
<body>
    <h2>Courses</h2>
    <nav class="nav">
            <a class="nav-link active" href="index.html">Home</a>
            <a class="nav-link" href="professor.html">Professors</a>
            <a class="nav-link" href="student.html">Students</a>
        </nav>

    <?php
        if(isset($_POST)) {
            $cnum = $_POST["cnum"];
            echo "Course Number: ";
            echo $cnum;
        }

        $link = mysql_connect("ecsmysql", "cs332t35", "Eecahsh2");

        if(!$link) 
        {
            echo '<p>Can not connect to DB</p>';
            die('Can not connect to db: '.mysql_error());
        }

        mysql_select_db("cs332t35", $link);
        $result = mysql_query("SELECT DISTINCT Section_No, Classroom, Meeting_Days, Begin_Time, End_Time, COUNT(Student_CWID) AS Enrolled 
        FROM Section S, Enrollment E 
        WHERE S.Course_No=$cnum AND S.Course_No=E.Cour_No AND S.Section_No=E.Sec_No
        GROUP BY Section_No", $link);

        echo '<table border="2">
        <tr>
        <th>Section</th>
        <th>Classroom</th>
        <th>Meeting Days</th>
        <th>Time</th>
        <th>Enrolled</th>
        </tr>';

        $n = mysql_num_rows($result);


        for($i=0; $i < $n; $i++) {
            echo '<tr>
            <td>', mysql_result($result, $i, "Section_No"),  '</td>
            <td>', mysql_result($result,$i, "Classroom"), '</td>
            <td>', mysql_result($result, $i, "Meeting_Days"), '</td>
            <td>', mysql_result($result, $i, "Begin_Time")," - ",
            mysql_result($result, $i, "End_Time"), '</td>
            <td>', mysql_result($result, $i, "Enrolled"), '</td>
            </tr>';
        }
        mysql_close($link);
    ?>
</body>
</html>
