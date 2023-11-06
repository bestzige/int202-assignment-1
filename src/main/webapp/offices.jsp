<%--
  Created by IntelliJ IDEA.
  User: BestZige
  Date: 6/11/2566
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Offices</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://static.xx.fbcdn.net/rsrc.php/yT/r/aGT3gskzWBf.ico" type="image/x-icon" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="container mx-auto p-10">
    <h1 class="text-3xl text-center font-bold text-gray-800 hover:text-gray-700 my-2">
        Offices Management By
        <br>
        <span class="text-2xl text-center font-bold text-blue-800 hover:text-blue-700 my-2">
            Watchara Santawee 65130500073
        </span>
    </h1>
    <div class="flex justify-center space-x-4">
        <h1 class="text-3xl font-bold">Offices</h1>
        <div class="grid justify-items-end">
            <a href="offices?action=add" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Add</a>
        </div>
        <div class="grid justify-items-end">
            <a href="index.jsp" class="bg-orange-500 hover:bg-orange-700 text-white font-bold py-2 px-4 rounded">Back</a>
        </div>
    </div>

    <div class="flex justify-center space-x-4 py-5">
        <form action="offices?page${requestScope.currentPage}&limit=${requestScope.limit}" method="get">
            <input type="text" name="search" placeholder="Search" class="border-2 border-gray-300 p-1 rounded-lg" value="${requestScope.search}">
            <input type="submit" value="Search" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
        </form>
        <form action="offices" method="get">
            <input type="submit" value="X" class="bg-gray-300 hover:bg-gray-400 text-white font-bold py-2 px-4 rounded">
        </form>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 justify-center">
        <c:forEach items="${requestScope.offices}" var="office">
            <div class="rounded overflow-hidden shadow-lg rounded-lg border-2 border-gray-300 max-w-full md:max-w-sm">
                <div class="px-6 py-4 h-40">
                    <div class="font-bold text-xl mb-2">Office #${office.officeCode}</div>
                    <p class="text-gray-700 text-base">
                        <span class="font-bold">Address:</span> ${office.addressLine1}, ${office.addressLine2}, ${office.city}, ${office.state}, ${office.postalCode}, ${office.country}
                        <br>
                        <span class="font-bold">Territory:</span> ${office.territory}
                    </p>
                </div>
                <div class="px-6 py-4">
                    <span class="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-gray-700 mr-2">${office.phone}</span>
                </div>

                <div class="flex flex-row justify-center space-x-4 p-5">
                    <form action="offices" method="get" class="w-full">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="officeCode" value="${office.officeCode}">
                        <input type="submit" value="Edit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full">
                    </form>
                    <form action="offices" method="post" class="w-full">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="officeCode" value="${office.officeCode}">
                        <input type="submit" value="Delete" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded w-full">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="flex justify-center space-x-4 p-5">
        <c:choose>
            <c:when test="${requestScope.currentPage > 1}">
                <a href="offices?page=${requestScope.currentPage - 1}&limit=${requestScope.limit}&search=${requestScope.search}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Previous</a>
            </c:when>
            <c:otherwise>
                <button class="bg-gray-300 text-white font-bold py-2 px-4 rounded" disabled>Previous</button>
            </c:otherwise>
        </c:choose>
        <div class="grid justify-items-end">
            <span class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Page ${requestScope.currentPage} of ${requestScope.totalPage}</span>
        </div>
        <c:choose>
            <c:when test="${requestScope.currentPage < requestScope.totalPage}">
                <a href="offices?page=${requestScope.currentPage + 1}&limit=${requestScope.limit}&search=${requestScope.search}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Next</a>
            </c:when>
            <c:otherwise>
                <button class="bg-gray-300 text-white font-bold py-2 px-4 rounded" disabled>Next</button>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
