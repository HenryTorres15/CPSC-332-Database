<!DOCTYPE html>
<html>
<header>
    <title>Professor's Courses</title>
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
    <h2>Professor's Courses</h2>

    <?php
        if(isset($_POST)) 
        {
            echo "SSN: ";
            $ssn = $_POST['ssn'];
            echo $ssn;
        }
        $link = mysql_connect('ecsmysql', 'cs332t35', 'Eecahsh2');

        if(!$link) 
        {
            echo '<p>Can not connect to DB</p>';
            die('Could not connect to database:'.mysql_error());
        }
       
        mysql_select_db('cs332t35', $link);
        $result = mysql_query("SELECT Prof_Name, Course_Title, Classroom, Meeting_Days, Begin_Time, End_Time
                                FROM Professor P, Section S, Course C
                                WHERE P.SSN=$ssn AND P.SSN=S.Prof_SSN AND S.Course_No=C.Course_Num", $link);
        
        echo '<table border="2">
        <tr>
        <th>Name</th>
        <th>Course Title</th>
        <th>Classroom</th>
        <th>Meeting Days</th>
        <th>Time</th>
        </tr>';

        $n = mysql_num_rows($result);
        for ($i=0; $i < $n ; $i++) {
            echo '<tr>
                <td>', mysql_result($result, $i, "Prof_Name"),'</td>
                <td>', mysql_result($result, $i, "Course_Title"),'</td>
                <td>', mysql_result($result,$i,"Classroom"), '</td>
                <td>', mysql_result($result,$i,"Meeting_Days"), '</td>
                <td>', mysql_result($result,$i,"Begin_Time"), " - ", mysql_result($result,$i,"End_Time"), '</td>
                </tr>';
        }
        mysql_close($link)
        ?>
</body>
</html>