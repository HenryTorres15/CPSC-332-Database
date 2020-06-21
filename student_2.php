<!DOCTYPE html>
<html>
<header>
    <title>Courses/StudentInfo</title>
    <link href="style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</header>
<body>
<h2>Student Info</h2>
<nav class="nav">
    <a class="nav-link active" href="index.html">Home</a>
    <a class="nav-link" href="professor.html">Professors</a>
    <a class="nav-link" href="student.html">Students</a>
</nav>

<?php

if (isset($_POST)) {
    $cwid = $_POST['cwid'];
    echo "CWID: ";
    echo $cwid;
}

$link = mysql_connect('ecsmysql', 'cs332t35','Eecahsh2');

if(!$link) {
    echo '<p>Can not connect to DB</p>';
    die("Not able to connect".mysql_error());
}

mysql_select_db("cs332t35", $link);
$result = mysql_query("SELECT DISTINCT FName, LName, Course_Title, Grade 
FROM Student S, Enrollment E, Section Sec, Course C 
WHERE S.CWID=$cwid AND S.CWID=E.Student_CWID AND E.Cour_No=Sec.Course_No AND Sec.Course_No=C.Course_Num", $link);

echo '<table border="2">
<tr>
<th>Student Name</th>
<th>Course Name</th>
<th>Grade</th>
<tr>';
$n = mysql_num_rows($result);


for($i=0; $i < $n; $i++) {
    echo '<tr>
    <td>', mysql_result($result, $i, "FName"), " ", mysql_result($result, $i, "LName"), '</td>
    <td>', mysql_result($result, $i, "Course_Title"), '</td>
    <td>', mysql_result($result, $i, "Grade"), '</td>
    </tr>';
}
mysql_close($link);
?>

</body>
</html>
