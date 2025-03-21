<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Bank Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f9f9f9;
        }
        .container {
            width: 50%;
            padding: 20px;
            border: 2px solid blue;
            border-radius: 10px;
            background: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 255, 0.3);
        }
        .header {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            color: red;
            padding: 10px;
            border: 2px solid red;
            margin-bottom: 20px;
        }
        .form-group {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }
        label {
            font-weight: bold;
            color: blue;
            width: 40%;
        }
        input {
            width: 55%;
            padding: 5px;
            border: 2px solid blue;
            border-radius: 5px;
            outline: none;
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background: blue;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .submit-btn:hover {
            background: darkblue;
        }
    </style>
</head>
<body>
    <div class="header">Add Bank Account</div>
    <div class="container">
        <form action="addBankAccount.jsp" method="post">
            <div class="form-group">
                <label>BANK NAME:</label>
                <input type="text" name="bankName" required>
            </div>
            <div class="form-group">
                <label>ACCOUNT NUMBER:</label>
                <input type="text" name="accountNumber" required>
            </div>
            <div class="form-group">
                <label>ACCOUNT TYPE:</label>
                <input type="text" name="accountType" required>
            </div>
            <div class="form-group">
                <label>IFSC CODE:</label>
                <input type="text" name="ifscCode" required>
            </div>
            <div class="form-group">
                <label>CURRENT BALANCE:</label>
                <input type="number" name="currentBalance" required>
            </div>
            <div class="form-group">
                <label>PIN:</label>
                <input type="password" name="pin" required>
            </div>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>
</body>
</html>
