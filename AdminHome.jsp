<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* Base styling */
        body {
            display: flex;
            margin: 0;
            height: 100vh;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }
        h3 {
            margin-bottom: 20px;
            font-size: 1.2em;
            text-align: center;
        }
        
        /* Navbar styling */
        .navbar {
            width: 220px;
            background-color: #333;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 8px rgba(0, 0, 0, 0.3);
            position: fixed;
            height: 100vh;
        }
        .navbar label {
            color: white;
            display: block;
            padding: 10px 15px;
            margin: 5px 0;
            font-size: 1.1em;
            cursor: pointer;
            background-color: #444;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .navbar label:hover {
            background-color: #575757;
        }
        
        /* Content area */
        .content {
            margin-left: 240px;
            padding: 40px;
            width: calc(100% - 240px);
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow-y: auto;
        }

        /* Registration window */
        .registrationWindow {
            border: 1px solid #ddd;
            padding: 30px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Buttons */
        .registerButton {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .registerButton:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
    <div class="navbar">
        <h3>Admin Dashboard</h3>
        <label class="signuplabel" onClick="Student()">Student Data</label>
        <label class="signuplabel" onClick="faculty()">Faculty Data</label>
         <label class="signuplabel" onClick="Courses()">Courses</label>
         <label class="signuplabel" onClick="Mapping()">Mapping</label>
         
          <label class="signuplabel" onClick="Logout()">Logout</label>
        
        
    </div>
    
    <div class="content">
        <div id="registrationForm" class="registrationWindow">
            <!-- Add your content here -->
            <h2>Welcome to Admin Dashboard</h2>
            <p>Select a section from the left to manage Student or Faculty records.</p>
        </div>
    </div>

    <script>
        function faculty() {
            location.replace("/Adminfaculty.jsp");
        }
        
        function Student() {
            location.replace("/AdminStudent.jsp");
        }
        function Courses()
        {
        	location.replace("/AdminCourse.jsp");
        }
        function Mapping()
        {
        	location.replace("/AdminMapping.jsp");
        }
        function Logout()
        {
        	location.replace("/index.jsp");
        }
    </script>
</body>
</html>
