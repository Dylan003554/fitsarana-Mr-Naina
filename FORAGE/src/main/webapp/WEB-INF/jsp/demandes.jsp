<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Demandes</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background: #0f172a;
            color: #e2e8f0;
        }

        /* TITRE */
        h1 {
            color: #f8fafc;
            font-weight: 600;
        }

        /* NAVIGATION */
        .nav {
            margin-bottom: 20px;
        }

        .nav a {
            color: #38bdf8;
            margin-right: 15px;
            font-weight: bold;
            text-decoration: none;
            transition: 0.3s;
        }

        .nav a:hover {
            color: #0ea5e9;
        }

        /* FORMULAIRE */
        form {
            background: #1e293b;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
        }

        label {
            margin-right: 5px;
        }

        /* INPUTS + SELECT */
        input[type="text"],
        input[type="date"],
        select {
            padding: 8px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            background: #334155;
            color: white;
        }

        input:focus,
        select:focus {
            outline: 2px solid #38bdf8;
        }

        /* BOUTON */
        input[type="submit"] {
            padding: 8px 20px;
            background: linear-gradient(135deg, #38bdf8, #6366f1);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }

        /* TABLE */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background: #1e293b;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        /* HEADER */
        th {
            background: linear-gradient(135deg, #38bdf8, #6366f1);
            color: white;
            text-transform: uppercase;
            font-size: 14px;
        }

        /* LIGNES */
        tr:nth-child(even) {
            background: #0f172a;
        }

        tr:hover {
            background: #334155;
        }

        /* LIENS */
        a {
            color: #f87171;
            text-decoration: none;
            transition: 0.3s;
        }

        a:hover {
            color: #ef4444;
        }
    </style>
</head>
<body>
    <div class="nav">
        <a href="/clients">Clients</a>
        <a href="/demandes">Demandes</a>
    </div>

    <h1>Liste des Demandes</h1>

    <form action="/demandes" method="post">
        <input type="hidden" name="id" value="${demande.id}" />

        <label>Date:</label>
        <input type="date" name="date" value="${demande.date}" required />

        <label>Client:</label>
        <select name="client.id" required>
            <option value="">-- Choisir --</option>
            <c:forEach var="c" items="${clients}">
                <option value="${c.id}">${c.nom}</option>
            </c:forEach>
        </select>

        <label>Lieu:</label>
        <input type="text" name="lieu" value="${demande.lieu}" />

        <label>Districk:</label>
        <input type="text" name="districk" value="${demande.districk}" />

        <input type="submit" value="Enregistrer" />
    </form>

    <table>
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Client</th>
            <th>Lieu</th>
            <th>Districk</th>
            <th>Action</th>
        </tr>
        <c:forEach var="d" items="${demandes}">
            <tr>
                <td>${d.id}</td>
                <td>${d.date}</td>
                <td>${d.client.nom}</td>
                <td>${d.lieu}</td>
                <td>${d.districk}</td>
                <td><a href="/demandes/delete/${d.id}" onclick="return confirm('Supprimer?')">Supprimer</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
