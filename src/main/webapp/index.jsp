<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #F7F7F7;
            color: #333;
        }

        h1 {
            color: #333;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 5px 10px;
            background-color: #005BBB;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #003366;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
            width: 150px;
        }

        table th {
            background-color: #005BBB;
            color: #fff;
            font-weight: bold;
        }
    </style>
    <title>Результат поиска и замены</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <%--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
    <script>
        function searchAndDisplay() {
            var key = document.getElementById("key").value;
            $.ajax({
                url: 'DataServlet?action=search&key=' + key,
                type: 'GET',
                success: function (data) {
                    if (data.value !== null && data.value !== undefined) {
                        document.getElementById("resultTable").innerHTML = "<tr><th>Ключ</th><th>Значение</th></tr><tr><td>" + data.key + "</td><td>" + data.value + "</td></tr>";
                    } else {
                        alert("Значение не найдено для ключа: " + key);
                    }
                },
                error: function () {
                    alert("Произошла ошибка при выполнении запроса");
                }
            });
        }

        function replaceValue() {
            var key = document.getElementById("key").value;
            var newValue = document.getElementById("newValue").value;
            $.ajax({
                url: 'DataServlet?action=replace&key=' + key + '&newValue=' + newValue,
                type: 'GET',
                success: function () {
                    alert("Значение для ключа " + key + " было успешно изменено на: " + newValue);
                    searchAndDisplay();
                },
                error: function () {
                    alert("Произошла ошибка при выполнении запроса");
                }
            });
        }
    </script>
</head>
<body>
<h1>Поиск и замена данных в коллекции</h1>

<label for="key">Ключ:</label>
<input type="text" id="key" name="key">
<button onclick="searchAndDisplay()">Поиск</button>
<br><br>

<label for="newValue">Новое значение:</label>
<input type="text" id="newValue" name="newValue">
<button onclick="replaceValue()">Изменить</button>
<br><br>

<table id="resultTable">
    <tr>
        <th>Ключ</th>
        <th>Значение</th>
    </tr>
</table>
</body>
</html>
