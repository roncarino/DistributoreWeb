<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
<title>Aggiungi Bevanda</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	********************************************<br>
	AGGIUNGI UNA BEVANDA NEL DISTRIBUTORE<br>
	********************************************
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
			<h1>Aggiungi una bevanda</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codice">Codice</label> 
					<% 
						if(request.getAttribute("codice") != null && !request.getAttribute("codice").equals("")) {
					%>	
						<input type="text" name="codice" value="<%=request.getAttribute("codice")%>"/>
					<%								
						} else if(request.getAttribute("codice") == null) {
					%>
						<input type="text" name="codice"/>
					<%
						} else {
					%>
						<input type="text" name="codice" placeholder="codice non valido"/>
					<%
						}
					%>
					
				<label for="nome">Nome</label> 
					<% 
						if(request.getAttribute("nome") != null) {
					%>	
						<input type="text" name="nome" value="<%=request.getAttribute("nome")%>"/>
					<%								
						} else {
					%>
						<input type="text" name="nome"/>
					<%
						}
					%> 
				<label for="prezzo">Prezzo</label> 
					<% 
						if(request.getAttribute("prezzo") != null && Float.parseFloat(request.getAttribute("prezzo").toString()) != -1) {
					%>	
						<input type="text" name="prezzo" value="<%=request.getAttribute("prezzo")%>"/>
					<%
						} else if(request.getAttribute("prezzo") == null) {
					%>								
						<input type="text" name="prezzo" />
					<%
						} else {
					%>
						<input type="text" name="prezzo" placeholder="Prezzo non valido"/>
					<%
						}
					%>
				<input type="hidden" name="scelta" value="1" /> 
				<input type="submit" value="aggiungi" />
			</form>
			<p>
			<% 
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")){
			%>
				Bevanda inserita!!
			<% 
				} else if(request.getAttribute("esito") != null) { 
			%>		
				Errore: Bevanda non inserita!!
			<% 
				} 
			%>
			</p>
		</div>
	</div>
</body>
</html>