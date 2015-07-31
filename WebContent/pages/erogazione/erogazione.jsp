<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="distributore.controller.Distributore"    
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Erogazione</title>
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
				<li><a href="/DistributoreWeb/pages/erogazione/eroga.jsp">Effettua Erogazione</a></li>
				<li><a href="/DistributoreWeb/pages/erogazione/lattineDisponibili.jsp">Lattine Disponibili</a></li>
				<li><a href="/DistributoreWeb/pages/erogazione/ricaricaTessera.jsp">Ricarica Tessera</a></li>
				<li><a href="/DistributoreWeb/Distributore?scelta=3">Visualizza Distributore</a></li>
				<li><a class="indietro" href="/DistributoreWeb">Menù principale</a></li>
			</menu>
			<img style="padding-top: 100px; padding-left:50px;" src="/DistributoreWeb/image/distributore_bevande.gif" alt="distributore" />
		</div>
		<div id="content">
			<h2 style="text-align: center;">Seleziona un'azione dal men&ugrave; qui a fianco</h2>
		</div>
	</div>
</body>
</html>