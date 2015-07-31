<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="distributore.controller.Distributore,
		java.util.List, 
		java.util.ArrayList,
		distributore.bean.Bevanda,
		java.util.Iterator"
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link type="text/css" rel="stylesheet" href="/DistributoreWeb/style/style.css" />
	<title>Visualizza Bevanda</title>
</head>
<body>
	<h3 style="padding-left:450px;">
	********************************************<br>
	VISUALIZZA LE BEVANDE NEL DISTRIBUTORE<br>
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
			<h1 style="text-align: center;">Bevande Disponibili</h1>
			<table>
				<tr>
					<th> NOME </th>
					<th> PREZZO </th>
					<th> CODICE </th>
				</tr>
					
				<%
					@SuppressWarnings("unchecked")
					List<Bevanda> bevandaDisp = (ArrayList<Bevanda>) request.getAttribute("listaBevande"); //CAST PESANTE MA NECESSARIO
					Iterator<Bevanda> it = bevandaDisp.iterator();
					Bevanda b = new Bevanda();
					while(it.hasNext()) {
						b = it.next();
				%>
					<tr>
						<td><%=b.getName() %></td>
						<td><%=b.getPrezzo() %></td>
						<td><%=b.getCodice() %></td>
					</tr>
				<%
					}	
				%>
			</table>
		</div>
	</div>
</body>
</html>