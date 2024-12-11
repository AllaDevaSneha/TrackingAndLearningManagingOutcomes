<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Basic reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: #f4f7fc;
            font-family: 'Arial', sans-serif;
        }

        /* Top navigation bar */
        .navbar {
            background: #4d4d4d; /* Dark grey */
            padding: 20px;
            color: white;
            text-align: center;
            font-size: 1.4em;
            font-weight: bold;
            border-radius: 0 0 10px 10px; /* Slight rounded corners for smooth look */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Light shadow for depth */
            transition: all 0.3s ease-in-out;
        }

        .navbar:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
        }

        /* Main content layout */
        .mainContent {
            display: flex;
            flex-grow: 1;
            align-items: center;
            justify-content: center;
            padding: 40px;
            gap: 30px;
        }

        /* Left side with image */
        .leftSide {
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            background: white;
            padding: 60px;
            border-radius: 10px 0 0 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .leftSide img {
            max-width: 80%;
            height: auto;
            transition: transform 0.3s ease-in-out;
        }

        .leftSide img:hover {
            transform: scale(1.1); /* Slight zoom effect on hover */
        }

        /* Right side with login form */
        .rightSide {
            width: 40%;
            display: flex;
            flex-direction: column;
            background: #ffffff; /* White background for login box */
            padding: 40px;
            border-radius: 0 10px 10px 0;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
            align-items: center;
            justify-content: center;
            min-width: 320px;
        }

        .loginHeader {
            font-size: 1.8em;
            text-align: center;
            font-weight: bold;
            color: white;
            margin-bottom: 20px;
        }

        .loginContent {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .loginContent div {
            margin-bottom: 10px;
            color: #4d4d4d;
            font-weight: bold;
        }

        select, input {
            width: 100%;
            padding: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
            font-size: 1em;
            background-color: #f0f0f0; /* Grey background for textboxes */
            color: #4d4d4d;
            transition: border-color 0.3s ease-in-out, background-color 0.3s ease-in-out;
        }

        select:focus, input:focus {
            border-color: #007bff; /* Blue border on focus */
            background-color: #fff; /* White background on focus */
            outline: none;
        }

        .signinButton {
            background-color: #4d4d4d;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-top: 20px;
            width: 100%;
            transition: background-color 0.3s ease-in-out;
        }

        .signinButton:hover {
            background-color: #4d4d4d;
        }

        #ack {
            text-align: center;
            color: red;
            font-size: 0.9em;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 768px) {
            .mainContent {
                flex-direction: column;
                align-items: center;
            }

            .leftSide, .rightSide {
                width: 100%;
                border-radius: 10px;
                margin-left: 0;
            }

            .rightSide {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Top Navigation Bar -->
    <div class="navbar">Project Title: Student Learning Management System</div>

    <!-- Main content: Image on left, login form on right -->
    <div class="mainContent">
        <div class="leftSide">
            <img src="images/Login.jpeg" alt="Login Image">
        </div>

        <div class="rightSide">
            <div class="loginHeader">Sign In</div>
            <div class="loginContent">
                <div>Select Role*</div>
                <select id="roleSelect">
                    <option value="admin">Admin</option>
                    <option value="student">Student</option>
                    <option value="faculty">Faculty</option>
                </select>

                <div>Username*</div>
                <input type="text" id="T1" placeholder="Enter your username" />

                <div>Password*</div>
                <input type="password" id="T2" placeholder="Enter your password" />

                <button class="signinButton" onclick="login()">Sign In</button>

                <div id="ack"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
    function login() {
        var username = document.getElementById('T1').value.trim();
        var password = document.getElementById('T2').value.trim();
        var role = document.getElementById('roleSelect').value;
        var ack = document.getElementById('ack');
        ack.style.color = "red";

        // Validate username and password
        if (username === "") {
            ack.innerHTML = "Username cannot be empty!";
            return;
        }
        
        if (password === "") {
            ack.innerHTML = "Password cannot be empty!";
            return;
        }

        if (!/^[a-zA-Z0-9]+$/.test(username)) { // Check if username is alphanumeric (adjust as needed)
            ack.innerHTML = "Enter a valid username!";
            return;
        }

        var data = JSON.stringify({
            username: username,
            password: password
        });

        var url;
        if (role === "admin") {
            url = "http://localhost:8080/admin/adminlogin";
        } else if (role === "student") {
            url = "http://localhost:8080/student/studentlogin";
        } else if (role === "faculty") {
            url = "http://localhost:8080/faculty/facultylogin";
        }

        callApi("POST", url, data, getResponse);
    }

        function getResponse(res) {
            var ack = document.getElementById('ack');
            ack.style.color = "red";
            
            if (res == 401) {
                // Invalid credentials (wrong password or username)
                ack.innerHTML = "Invalid Credentials!";
            } else if (res == 404) {
                // Invalid username
                ack.innerHTML = "Enter a valid username!";
            } else {
                // Clear the error message
                ack.innerHTML = "";
                
                var role = document.getElementById('roleSelect').value;
                if (role === "admin") {
                    location.replace("/AdminHome.jsp");
                } else if (role === "student") {
                    location.replace("/StudentHome.jsp");
                } else if (role === "faculty") {
                    location.replace("/FacultyHome.jsp");
                }
            }
        }

    </script>
</body>
</html>
