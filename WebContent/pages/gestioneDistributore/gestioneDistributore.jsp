<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Gestione Distributore</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	***************************************<br>
	MENU' DI GESTIONE DEL DISTRIBUTORE<br>
	***************************************
	</h3>
	<div id="contenitore">
		<div id="menu">
			<menu>
				<li><a href="/DistributoreWeb/pages/gestioneDistributore/aggiornaColonna.jsp">Aggiorna Colonna</a></li>
				<li><a href="/DistributoreWeb/pages/gestioneDistributore/aggiungiBevanda.jsp">Aggiungi Bevanda</a></li>
				<li><a href="/DistributoreWeb/Distributore?scelta=1">Visualizza Bevande</a></li>
				<li><a class="indietro" href="/DistributoreWeb">Menù principale</a></li>
			</menu>
		</div>
		<div id="content">
			<h2 style="text-align: center;">Scegli un'opzione dal menu qui a sinistra</h2>
		</div>
	</div>
</body>
</html>