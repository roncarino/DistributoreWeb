<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Aggiorna Colonna</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	*********************************************<br>
	AGGIORNA UNA COLONNA NEL DISTRIBUTORE<br>
	*********************************************
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
			<h1>Aggiorna una colonna</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codice">Codice</label> 
					<% 
						if(request.getAttribute("codice") != null && !request.getAttribute("codice").equals("")) {
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
				<label for="numColonna">Colonna da aggiornare</label> 
					<% 
						if(request.getAttribute("numColonna") != null && Float.parseFloat(request.getAttribute("numColonna").toString()) != -1) {
					%>	
						<input type="text" name="numColonna" value="<%=request.getAttribute("numColonna")%>"/>
					<%
						} else if(request.getAttribute("numColonna") == null) {
					%>								
						<input type="text" name="numColonna" />
					<%
						} else {
					%>
						<input type="text" name="numColonna" placeholder="Numero colonna non valido"/>
					<%
						}
					%> 
				<label for="numLattine">Lattine da inserire</label> 
					<% 
						if(request.getAttribute("numLattine") != null && Float.parseFloat(request.getAttribute("numLattine").toString()) != -1) {
					%>	
						<input type="text" name="numLattine" value="<%=request.getAttribute("numLattine")%>"/>
					<%
						} else if(request.getAttribute("numLattine") == null) {
					%>								
						<input type="text" name="numLattine" />
					<%
						} else {
					%>
						<input type="text" name="numLattine" placeholder="Numero lattine non valido"/>
					<%
						}
					%> 
				<input type="hidden" name="scelta" value="2" /> 
				<input type="submit" value="aggiorna" />
			</form>
			<p>
			<% 
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")){
			%>
				Colonna Aggiornata correttamente!!
			<% 
				} else if(request.getAttribute("esito") != null) { 
			%>		
				Errore: Colonna non aggiornata!!
			<% 
				} 
			%>
			</p>
		</div>
	</div>
</body>
</html>