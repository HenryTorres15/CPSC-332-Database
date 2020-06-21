<!DOCTYPE html>
<html>
      <header>
           <title>Student Grades</title>
            <link href="style.css" rel="stylesheet"/>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            </header>

<body>
<nav class="nav">
    <a class="nav-link active" href="index.html">Home</a>
    <a class="nav-link" href="professor.html">Professors</a>
    <a class="nav-link" href="student.html">Students</a>
</nav>

<h2>Student Grades</h2>

<?php
 if(isset($_POST))  {
    $cno = $_POST['cno'];
    $sno = $_POST['sno']; 
    echo " Course: ";
    echo $cno;
    echo " Section: ";
    echo $sno;
 }

$link = mysql_connect("ecsmysql",'cs332t35','Eecahsh2'); 

if(!$link) { 
    echo '<p>Can not connect to DB</p>';
    die('Could not connect'.mysql_error());
}

mysql_select_db("cs332t35",$link);
$result = mysql_query(
    "SELECT DISTINCT Grade, COUNT(Student_CWID) AS Num_Grades
     FROM Section S, Enrollment E 
     WHERE S.Course_No=$cno AND S.Section_No=$sno AND S.Course_No=E.Cour_No AND S.Section_No=E.Sec_No
     GROUP BY Grade",$link); 
 
 

echo '<table border="2"> 
    <tr>
         <th>Letter Grades</th>
          <th>Number of Students</th>
         </tr>';
         $n = mysql_num_rows($result);

        for($i=0;$i < $n; $i++)
        {
          echo '<tr>  
                <td>', mysql_result($result,$i,"Grade"),'</td>
                <td>', mysql_result($result,$i,"Num_Grades"),'</td> 
              </tr>';
          } 
 
 
 echo '</table>';
 mysql_close($link)
 ?>
 </body>
</html>
