
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Reviews</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black text-white min-h-screen flex items-center justify-center">

<div class="w-full max-w-5xl p-6 bg-gray-900 rounded-xl shadow-lg border border-cyan-400">
    <h2 class="text-3xl font-bold text-cyan-400 mb-6 text-center">User Reviews</h2>

    <c:if test="${not empty list1}">
        <table class="w-full table-auto border-collapse border border-cyan-500 text-white">
            <thead class="bg-cyan-800 text-white">
                <tr>
                    <th class="border border-cyan-500 px-4 py-2">Game ID</th>
                    <th class="border border-cyan-500 px-4 py-2">Review</th>
                    <th class="border border-cyan-500 px-4 py-2">Rating</th>
                    <th class="border border-cyan-500 px-4 py-2">Actions</th>
                </tr>
            </thead>
            <tbody class="bg-gray-800">
                <c:forEach var="r" items="${list1}">
                    <tr class="hover:bg-gray-700 transition">
                        <td class="border border-cyan-500 px-4 py-2">${r.gameid}</td>
                        <td class="border border-cyan-500 px-4 py-2">${r.review}</td>
                        <td class="border border-cyan-500 px-4 py-2">${r.rate} / 10</td>
                       <td class="border border-cyan-500 px-4 py-2 text-center">
    <!-- See More Button -->
    <form action="singlePay" method="post" class="inline-block mb-2">
        <input type="hidden" name="userId" value="${r.userid}" />
        <button type="submit"
                class="bg-cyan-500 hover:bg-cyan-400 text-black font-bold py-1 px-3 rounded transition">
            See More
        </button>
    </form>

    <!-- Delete Button -->
    <form action="deleteReview" method="post"
          onsubmit="return confirm('Are you sure you want to delete this review?');"
          class="inline-block">
        <input type="hidden" name="userid" value="${r.userid}" />
        <input type="hidden" name="gameid" value="${r.gameid}" />
        <button type="submit"
                class="bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-3 rounded transition">
            Delete
        </button>
    </form>
</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty list1}">
        <div class="mt-6 text-red-400 text-center text-lg">
            No reviews found for the given User ID.
        </div>
    </c:if>
</div>

</body>
</html>
