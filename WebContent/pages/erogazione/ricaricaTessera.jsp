<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Ricarica tessera</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	***************************************<br>
	EFFETTUA LA RICARICA DELLA TESSERA<br>
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
		</div>
		<div id="content">
			<h1>Effettua la ricarica della tessera</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codice">Codice Della Tessera</label> 
					<% 
						if(request.getAttribute("codice") != null && Float.parseFloat(request.getAttribute("codice").toString()) != -1) {
					%>	
						<input type="text" name="codice" value="<%=request.getAttribute("codice")%>"/>
					<%
						} else if(request.getAttribute("codice") == null) {
					%>								
						<input type="text" name="codice" />
					<%
						} else {
					%>
						<input type="text" name="codice" placeholder="Codice non valido"/>
					<%
						}
					%>
				<label for="importo">Inserisci credito per ricaricare</label> 
					<input type="text" name="importo" />
				<input type="hidden" name="scelta" value="4" /> 
				<input type="submit" value="ricarica" />
			</form>
			<p>
			<% 
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")){
			%>
				Ricarica effettuata con successo!!
			<% 
				} else if(request.getAttribute("esito") != null) { 
			%>		
				Errore: Non è possibile effettuare la ricarica!!
			<% 
				} 
			%>
			</p>
		</div>
	</div>
</body>
</html>