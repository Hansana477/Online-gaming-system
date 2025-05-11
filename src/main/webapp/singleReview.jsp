<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Review Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
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
        .field .value {
            background-color: #000;
            padding: 10px;
            border: 1px solid #00f5ff;
            border-radius: 6px;
            color: #00f5ff;
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
    <div class="title">Review Details</div>
    <c:set var="review" value="${sing}" />

    <div class="field">
        <label>Game ID</label>
        <div class="value">${review.gameid}</div>
    </div>
    <div class="field">
        <label>User ID</label>
        <div class="value">${review.userid}</div>
    </div>
    <div class="field">
        <label>Review</label>
        <div class="value">${review.review}</div>
    </div>
    <div class="field">
        <label>Rating</label>
        <div class="value">${review.rate} / 10</div>
    </div>
<div class="buttons">
    <form action="ediReview.jsp" method="get">
        <input type="hidden" name="gameid" value="${review.gameid}" />
        <input type="hidden" name="userid" value="${review.userid}" />
        <input type="hidden" name="review" value="${review.review}" />
        <input type="hidden" name="rate" value="${review.rate}" />
        <button type="submit" class="button">Edit Details</button>
    </form>
</div>

    </div>
</div>

</body>
</html>
