<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Faculty</title>
    <link rel="stylesheet" type="text/css" href="css/faculty.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        /* Top navbar */
        .topnav {
            background-color: #333;
            color: white;
            padding: 14px 16px;
            text-align: center;
            font-size: 24px;
            position: relative;
            height: 50px;
            line-height: 50px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        }
        /* Container for sidebar and content */
        .container {
            display: flex;
            height: calc(100vh - 50px); /* Adjusted to account for top nav height */
        }
        /* Sidebar */
        .navbar {
            width: 200px;
            background-color: #333;
            color: white;
            padding: 10px;
            margin-top: 20px; /* Add space between the top nav and the sidebar */
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);
        }
        .navbar ul {
            list-style-type: none;
            padding: 0;
        }
        .navbar ul li {
            padding: 8px;
            border-radius: 4px;
        }
        .navbar ul li a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .navbar ul li a:hover {
            background-color: #575757;
        }
        /* Content area */
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        /* Faculty registration form */
        #facultyForm {
            display: none;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

    <!-- Top Navbar with centered title -->
    <div class="topnav">
        Admin Faculty Dashboard
    </div>

    <!-- Main container for sidebar and content -->
    <div class="container">
        <!-- Sidebar on the right side -->
        <div class="navbar">
            <ul>
                <li><a href="#dashboard">Dashboard</a></li>
                <li><a href="#" onclick="displayFacultyForm()">Register Faculty</a></li>
                <li><a href="#" onclick="ReterivewALLFaculties()">View Faculty</a></li>
                <li><a href="#" onclick="Back_To_AdminHome()">Back to Admin Home</a></li>
            </ul>
        </div>

        <!-- Main content area -->
        <div class="content">
            
            
            <!-- Faculty Registration Form (Initially hidden) -->
            <form id="facultyForm">
                <label for="facultyid">Faculty ID:</label>
                <input type="text" id="facultyid" name="facultyid" required>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="department">Department:</label>
                <select id="department" name="department" required>
                    <option value="">Select Department</option>
                    <option value="BT">Biotechnology (BT)</option>
                    <option value="CSE">Computer Science and Engineering (CSE)</option>
                    <option value="ECE">Electronics and Communication Engineering (ECE)</option>
                    <option value="CE">Civil Engineering (CE)</option>
                    <option value="BCA">Bachelor of Computer Applications (BCA)</option>
                    <option value="BBA">Bachelor of Business Administration (BBA)</option>
                    <option value="MBA">Master of Business Administration (MBA)</option>
                    <option value="M.Tech">Master of Technology (M.Tech)</option>
                </select>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="button" onclick="submitFaculty()">Register</button>
            </form>

            <!-- Acknowledgment message display -->
            <p id="ack"></p>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to display the Faculty Registration form when "Register Faculty" is clicked
        function displayFacultyForm() {
            var form = document.getElementById('facultyForm');
            form.style.display = 'block'; // Show the form
        }

        // Function to handle Faculty registration
        function submitFaculty() {
            // Prepare the faculty data as JSON
            var data = JSON.stringify({
                facultyid: parseInt(document.getElementById('facultyid').value, 10),  // Convert facultyid to long
                name: document.getElementById('name').value,  // Faculty name
                department: document.getElementById('department').value,  // Faculty department
                email: document.getElementById('email').value,  // Faculty email
                password: document.getElementById('password').value  // Faculty password
            });

            // API URL for saving faculty details
            var url = "http://localhost:8080/faculty/save";

            // Call the API with method POST and send the data
            callApi("POST", url, data, getResponse);  // callApi is from main.js
        }

        // Callback function to handle the API response
        function getResponse(res) {
            var ack = document.getElementById("ack");  // Reference the ack element
            // If response code is 401, show Faculty ID already exists message
            if (res == 401) {
                ack.style.color = "red";
                ack.innerHTML = "Faculty ID already exists!";
            } else if (res == 200) {
                ack.style.color = "green";
                ack.innerHTML = "Faculty registered successfully!";
            } else {
                ack.style.color = "red";
                ack.innerHTML = "Error: " + res;
            }
        }

        function Back_To_AdminHome() {
            location.replace("/AdminHome.jsp");
        }
        function ReterivewALLFaculties()
        {
        	location.replace("/AdminAllFaculties.jsp")
        }
    </script>

</body>
</html>
