<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="distributore.controller.Distributore"    
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Gestione Tessere</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	************************************<br>
	MENU' DI GESTIONE DELLE TESSERE<br>
	************************************
	</h3>
	<div id="contenitore">
		<div id="menu">
			<menu>
				<li><a href="/DistributoreWeb/pages/gestioneTessere/aggiungiTessera.jsp">Aggiungi Tessera</a></li>
				<li><a href="/DistributoreWeb/Distributore?scelta=2">Visualizza Tessere</a></li>
				<li><a class="indietro" href="/DistributoreWeb">Menù principale</a></li>
			</menu>
		</div>
		<div id="content">
			<h2 style="text-align: center;">Seleziona un'azione dal men&ugrave; qui a fianco</h2>
		</div>
	</div>
</body>
</html>