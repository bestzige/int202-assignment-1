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
        <c:choose>
            <c:when test="${requestScope.action == 'update'}">
                <h1 class="text-3xl font-bold">Edit Office (ID: ${requestScope.office.officeCode})</h1>
            </c:when>
            <c:otherwise>
                <h1 class="text-3xl">Add Office</h1>
            </c:otherwise>
        </c:choose>
        <div class="grid justify-items-end">
            <a href="offices" class="bg-orange-500 hover:bg-orange-700 text-white font-bold py-2 px-4 rounded">Back</a>
        </div>
    </div>

    <form action="offices" method="post">
        <input type="hidden" name="action" value="${requestScope.action}">

        <div ${requestScope.action == 'update' ? 'hidden' : ''}>
            <label for="officeCode" class="block text-sm font-medium leading-6 text-gray-900">Office Code</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="officeCode" placeholder="Office Code" id="officeCode" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="Office Code" value="${requestScope.action == 'update' ? requestScope.office.officeCode : ''}">
            </div>
        </div>
        <div>
            <label for="addressLine1" class="block text-sm font-medium leading-6 text-gray-900">Address Line 1</label>
            <div class="relative rounded-md shadow-sm">
                <textarea name="addressLine1" placeholder="Address Line 1" id="addressLine1" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">${requestScope.office.addressLine1}</textarea>
            </div>
        </div>
        <div>
            <label for="addressLine2" class="block text-sm font-medium leading-6 text-gray-900">Address Line 2</label>
            <div class="relative rounded-md shadow-sm">
                <textarea name="addressLine2" placeholder="Address Line 2" id="addressLine2" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">${requestScope.office.addressLine2}</textarea>
            </div>
        </div>
        <div>
            <label for="city" class="block text-sm font-medium leading-6 text-gray-900">City</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="city" placeholder="City" id="city" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.city}">
            </div>
        </div>
        <div>
            <label for="state" class="block text-sm font-medium leading-6 text-gray-900">State</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="state" placeholder="State" id="state" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.state}">
            </div>
        </div>
        <div>
            <label for="country" class="block text-sm font-medium leading-6 text-gray-900">Country</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="country" placeholder="Country" id="country" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.country}">
            </div>
        </div>
        <div>
            <label for="postalCode" class="block text-sm font-medium leading-6 text-gray-900">Postal Code</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="postalCode" placeholder="Postal Code" id="postalCode" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.postalCode}">
            </div>
        </div>
        <div>
            <label for="territory" class="block text-sm font-medium leading-6 text-gray-900">Territory</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="territory" placeholder="Territory" id="territory" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.territory}">
            </div>
        </div>
        <div>
            <label for="phone" class="block text-sm font-medium leading-6 text-gray-900">Phone</label>
            <div class="relative rounded-md shadow-sm">
                <input type="text" name="phone" placeholder="Phone" id="phone" class="block w-full rounded-md border-0 p-2 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" value="${requestScope.office.phone}">
            </div>
        </div>

        <div class="mt-6">
            <c:if test="${not empty requestScope.error}">
                <div class="text-red-500">${requestScope.error}</div>
            </c:if>
            <c:choose>
                <c:when test="${requestScope.action == 'update'}">
                    <input type="submit" value="Update" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full">
                </c:when>
                <c:otherwise>
                    <input type="submit" value="Add" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded w-full">
                </c:otherwise>
            </c:choose>
        </div>
    </form>
</div>
</body>
</html>
