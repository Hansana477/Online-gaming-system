<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Review</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/stylehf.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Orbitron', sans-serif;
            background-color: #0d0d0d;
            color: #00f5ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            border: 2px solid #00f5ff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px #00f5ff;
            width: 500px;
            background-color: #111;
        }
        .title {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #00f5ff;
            text-shadow: 0 0 10px #00f5ff;
        }
        .field {
            margin-bottom: 15px;
        }
        .field label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
        }
        .field input,
        .field textarea {
            background-color: #000;
            padding: 10px;
            border: 1px solid #00f5ff;
            border-radius: 6px;
            color: #00f5ff;
            width: 100%;
            resize: none;
        }
        .field input[readonly] {
            background-color: #1a1a1a;
        }
        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .button {
            background-color: #00f5ff;
            color: #000;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 0 10px #00f5ff;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #00e0dd;
        }
    </style>
</head>
<body>


<div class="container">
    <div class="title">Edit Review</div>
 
    <form action="editrev" method="post">
        <div class="field">
            <label>Game ID</label>
            <input type="text" name="gameId" value="${param.gameid}" readonly />
        </div>

        <div class="field">
            <label>User ID</label>
            <input type="text" name="userId" value="${param.userid}" readonly />
        </div>

        <div class="field">
            <label>Review</label>
            <textarea name="review" rows="4">${param.review}</textarea>
        </div>

        <div class="field">
            <label>Rating (out of 10)</label>
            <input type="number" name="rate" value="${param.rate}" min="0" max="10" />
        </div>

        <div class="buttons">
            <button type="submit" class="button">Update</button>
        </div>
    </form>
</div>

</body>
</html>
