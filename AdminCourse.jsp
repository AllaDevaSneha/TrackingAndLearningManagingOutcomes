<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Course Management</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            display: flex;
            margin: 0;
            height: 100vh;
        }
        .navbar {
            width: 200px;
            height: 100vh;
            background-color: #333;
            color: white;
            padding: 10px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.5);
        }
        .navbar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 8px;
            border-radius: 4px;
        }
        .navbar a:hover {
            background-color: #575757;
        }
        .content {
            margin-left: 20px;
            padding: 20px;
            flex-grow: 1;
            overflow-y: auto;
        }
        .registrationWindow {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h3>Navigation</h3>
        <a href="#" onclick="displayCourseRegistration()">Course Registration</a>
        <a href="#" onclick="ReterivewALLCourses()">Display Courses</a>
        <a href="#" onclick="AdminHome()">Back To Admin Home</a>
    </div>

    <div class="content">
        <!-- Course Registration Form -->
        <div id="courseRegistrationForm" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">Register Course</div>
            <div class="registrationContent">
                <div style="display:block;padding-top:20px">Course ID*</div>
                <input type="number" id="courseId" />
                
                <div style="display:block;padding-top:20px">Course Name*</div>
                <input type="text" id="courseName" />
                
                <div style="display:block;padding-top:20px">Course Description*</div>
                <input type="text" id="courseDescription" />
                
                <button class="registerButton" onclick="registerCourse()">Register</button>
                <div style="display:block;height:80px;line-height:80px">
                    <label id="courseAck"></label>
                </div>
            </div>
        </div>

        <!-- Course Display Section (Optional) -->
        <div id="coursesList" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">All Courses</div>
            <div id="coursesTable" style="padding-top:20px;">
                <!-- The courses will be displayed here dynamically -->
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function displayCourseRegistration() {
            document.getElementById('courseRegistrationForm').style.display = 'block';
            document.getElementById('coursesList').style.display = 'none'; // Hide courses list if open
        }

        function registerCourse() {
            var data = JSON.stringify({
                courseid: document.getElementById('courseId').value,
                coursename: document.getElementById('courseName').value,
                coursedescription: document.getElementById('courseDescription').value
            });

            var url = "http://localhost:8080/courses/save"; // Adjust URL as needed
            callApi("POST", url, data, getCourseResponse);
        }

        function getCourseResponse(res) {
            if (res === "200") {
                document.getElementById('courseAck').style.color = "green";
                document.getElementById('courseAck').innerHTML = "Course registration successful!";
            } else {
                document.getElementById('courseAck').style.color = "red";
                document.getElementById('courseAck').innerHTML = "Course registration failed!";
            }
        }

       function ReterivewALLCourses()
       {
    	   location.replace("/AdminAllCourses.jsp")
       }
        function AdminHome() {
            location.replace("/AdminHome.jsp");
        }
    </script>
</body>
</html>
