<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Détails de la Demande</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <nav class="global-navbar">
        <a href="${pageContext.request.contextPath}/">FrontOffice (Dashboard)</a>
        <a href="${pageContext.request.contextPath}/backoffice">BackOffice</a>
    </nav>
    <h1>Détails de la Demande</h1>
    
    <div class="card">
        <h2>Informations sur la demande</h2>
        <p><strong>Date : </strong>${demande.dateDemande}</p>
        <p><strong>Client : </strong>${client.nom}</p>
        <p><strong>Lieu : </strong>${demande.lieu}, <small>${demande.district}</small></p>
    </div>

    <div class="card">
        <h2>Historique des Statuts</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Statut</th>
                    <th>Observation</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${statuses}" var="s">
                    <tr>
                        <td>${s.dateStatus}</td>
                        <td><span class="status-badge">${s.status.libelle}</span></td>
                        <td>${s.observation}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="card">
        <h2>Devis associés</h2>
        <c:if test="${empty devises}">
            <p>Aucun devis pour cette demande.</p>
        </c:if>
        <c:if test="${not empty devises}">
            <table>
                <thead>
                    <tr>
                        <th>ID Devis</th>
                        <th>Client</th>
                        <th>Montant</th>
                        <th>Lieu</th>
                        <th>type</th>
                        <th>Date</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${devises}" var="d">
                        <tr>
                            <td>${d.id}</td>
                            <td>${d.demande.client.nom}</td>
                            <td>${montantTotalMap[d.id]}</td>
                            <td>${d.typeDevis.libelle}</td>
                            <td>${d.demande.lieu}</td>
                            <td>${d.dateDevis}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/devis/delete/${d.id}" method="POST" onsubmit="return confirm('Supprimer ce devis ?');">
                                    <button type="submit" class="btn btn-danger">Supprimer</button>
                                </form>
                            </td>
                            <td>
                                <form action="${pageContext.request.contextPath}/devis/details/${d.id}" method="GET">
                                    <button type="submit" class="btn">Voir</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

</div>
</body>
</html>