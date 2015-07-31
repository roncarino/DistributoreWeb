<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore" 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Lattine Disponibili nel distributore</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	**********************************************<br>
	MOSTRA NUMERO LATTINE NEL DISTRIBUTORE<br>
	**********************************************
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
			<h1>Mostra il numero di lattine nel distributore dato il codice bibita</h1>
			<form method="post" action="/DistributoreWeb/Distributore">
				<label for="codiceBevanda">Codice Della Bevanda</label> 
					<% 
						if(request.getAttribute("codiceBevanda") != null && !request.getAttribute("codiceBevanda").equals("")) {
					%>	
						<input type="text" name="codiceBevanda" value="<%=request.getAttribute("codiceBevanda")%>"/>
					<%
						} else if(request.getAttribute("codiceBevanda") == null) {
					%>								
						<input type="text" name="codiceBevanda" />
					<%
						} else {
					%>
						<input type="text" name="codiceBevanda" placeholder="Codice bevanda non valido"/>
					<%
						}
					%>
				<input type="hidden" name="scelta" value="6" /> 
				<input type="submit" value="mostra" />
			</form>
			<p>
			<% 
				if(request.getAttribute("esito")!= null && request.getAttribute("esito").equals("SUCCESS")){
			%>
				Ci sono <%= request.getAttribute("lattineDisponibili") %> di <%= request.getAttribute("nomeLattina") %> con il codice: <%=request.getAttribute("codiceBevanda") %>
			<% 
				} else if(request.getAttribute("esito") != null) { 
			%>		
				Errore: Non è possibile controllare il numero di lattine!!
			<% 
				} 
			%>
			</p>
		</div>
	</div>
</body>
</html>