<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Aggiungi Tessera</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	************************<br>
	AGGIUNGI UNA TESSERA<br>
	************************
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
			<h1>Aggiungi una tessera</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codice">Codice</label> 
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
				<label for="credito">Credito</label> 
					<% 
						if(request.getAttribute("credito") != null && Float.parseFloat(request.getAttribute("credito").toString()) != -1) {
					%>	
						<input type="text" name="credito" value="<%=request.getAttribute("credito")%>"/>
					<%
						} else if(request.getAttribute("credito") == null) {
					%>								
						<input type="text" name="credito" />
					<%
						} else {
					%>
						<input type="text" name="credito" placeholder="Credito non valido"/>
					<%
						}
					%> 
				<input type="hidden" name="scelta" value="3" /> 
				<input type="submit" value="aggiungi" />
			</form>
			<p>
			<% 
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")){
			%>
				Tessera inserita!!
			<% 
				} else if(request.getAttribute("esito") != null) { 
			%>		
				Errore: Tessera non inserita!!
			<% 
				} 
			%>
			</p>
		</div>
	</div>
</body>
</html>