<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            display: flex;
            margin: 0; /* Remove default body margin */
            height: 100vh; /* Set body height to full viewport height */
        }
        .navbar {
            width: 200px;
            height: 100vh; /* Full height */
            background-color: #333; /* Solid color */
            color: white;
            padding: 10px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.5); /* Optional shadow for depth */
        }
        .navbar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 8px;
            border-radius: 4px; /* Rounded corners for links */
        }
        .navbar a:hover {
            background-color: #575757;
        }
        .content {
            margin-left: 20px;
            padding: 20px;
            flex-grow: 1;
            overflow-y: auto; /* Allow scrolling if content exceeds the viewport */
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
        <a href="#" onclick="displayStudentRegistration()">Student Registration</a>
        <a href="#" onclick="ReterivewALLStudent()">Display Students</a>
         <a href="#" onclick="AdminHome()">Back To adminHomee</a>
      
    </div>
    
    <div class="content">
        <div id="registrationForm" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">Register Student</div>
            <div class="registrationContent">
                <div style="display:block;padding-top:20px">Username*</div>
                <input type="text" id="username" />
                
                <div style="display:block;padding-top:20px">First Name*</div>
                <input type="text" id="firstName" />
                
                <div style="display:block;padding-top:20px">Last Name*</div>
                <input type="text" id="lastName" />
                
                <div style="display:block;padding-top:20px">Email*</div>
                <input type="email" id="email" />
                
                <div style="display:block;padding-top:20px">Password*</div>
                <input type="password" id="password" />
                
                <button class="registerButton" onclick="registerStudent()">Register</button>
                <div style="display:block;height:80px;line-height:80px">
                    <label id="ack"></label>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function displayStudentRegistration() {
            document.getElementById('registrationForm').style.display = 'block';
            // Hide other content if necessary
        }

        function registerStudent() {
            var data = JSON.stringify({
                username: document.getElementById('username').value,
                fristname: document.getElementById('firstName').value,
                lastname: document.getElementById('lastName').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            });

            var url = "http://localhost:8080/student/save"; // Adjust URL as needed
            callApi("POST", url, data, getResponse);
        }

        function getResponse(res) {
            if (res === "200") {
                document.getElementById('ack').style.color = "green";
                document.getElementById('ack').innerHTML = "Registration successful!";
            } else {
                document.getElementById('ack').style.color = "red";
                document.getElementById('ack').innerHTML = "Registration failed!";
            }
        }
        function ReterivewALLStudent()
        {
        	 location.replace("/AdminAllStudents.jsp");
        }
        function AdminHome()
        {
        	location.replace("/AdminHome.jsp")
        }
    </script>
</body>
</html>
