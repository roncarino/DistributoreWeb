package distributore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import distributore.bean.Bevanda;
import distributore.bean.Colonna;
import distributore.bean.Tessera;

public class Distributore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static Distributore distributore = null;
	private List<Bevanda> bevandeDisponibili;
	private List<Colonna> colonne;
	private List<Tessera> tessere;

	public Distributore() {
		this.bevandeDisponibili = new ArrayList<Bevanda>();
		this.colonne = new ArrayList<Colonna>();
		this.tessere = new ArrayList<Tessera>();
	}
	
	public static Distributore getInstance() {
		return distributore;
	}
	
	public List<Bevanda> getBevandeDisponibili() {
		return bevandeDisponibili;
	}
	
	public void setBevandeDisponibili(List<Bevanda> bevandeDisponibili) {
		this.bevandeDisponibili = bevandeDisponibili;
	}
	
	public List<Tessera> getTessere() {
		return tessere;
	}
	
	public List<Colonna> getColonne() {
		return colonne;
	}
		
	public void setTessere(List<Tessera> tessere) {
		this.tessere = tessere;
	}

	public void setColonne(List<Colonna> colonne) {
		this.colonne = colonne;
	}


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) //METODO DO GET
			throws ServletException, IOException {
		Distributore distributore = Distributore.getInstance();
		if (distributore == null) {
			Distributore.distributore = new Distributore();
		}
		int scelta = Integer.parseInt(req.getParameter("scelta"));
		
		switch (scelta) {
		case 1: {
			/*************************************************************************************************
													VISUALIZZA BEVANDE
			 *************************************************************************************************/
			req.setAttribute("listaBevande", Distributore.distributore.getBevandeDisponibili());
			req.getRequestDispatcher("pages/gestioneDistributore/visualizzaBevande.jsp").forward(req, resp);
		}
			break;
		case 2: {
			/*************************************************************************************************
													VISUALIZZA TESSERE
			 *************************************************************************************************/
			req.setAttribute("listaTessere", Distributore.distributore.getTessere());
			req.getRequestDispatcher("pages/gestioneTessere/visualizzaTessere.jsp").forward(req, resp);
		}
			break;
		case 3: {
			/*************************************************************************************************
												VISUALIZZA DISTRIBUTORE
			 *************************************************************************************************/
			req.setAttribute("listaColonne", Distributore.distributore.getColonne());
			req.getRequestDispatcher("pages/erogazione/visualizzaDistributore.jsp").forward(req, resp);
		}
			break;
		}
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) //METODO DO POST
			throws ServletException, IOException {
		String esito;
		Distributore distributore = Distributore.getInstance();
		if (distributore == null) {
			Distributore.distributore = new Distributore();
		}
		int scelta = Integer.parseInt(req.getParameter("scelta"));

		switch (scelta) {
		case 1: {
			/*************************************************************************************************
			  										AGGIUNGI BEVANDA
			 *************************************************************************************************/
			String nome = req.getParameter("nome");
			String codice = req.getParameter("codice");
			if(Distributore.distributore.getBevandaFromCodice(codice) != null)
				codice = "";
			float prezzo;
			try {
				prezzo = Float.parseFloat(req.getParameter("prezzo"));
			} catch (NumberFormatException e) {
				prezzo = -1;
			}
			if(!codice.equals("") && prezzo != -1) {
				esito = "SUCCESS";
				Distributore.distributore.aggiungiBevanda(new Bevanda(nome, codice, prezzo));
			}
			else {
				esito = "ERRORE";
				req.setAttribute("nome", nome);
				req.setAttribute("codice", codice);
				req.setAttribute("prezzo", prezzo);
			}	
			req.setAttribute("esito", esito);
			req.getRequestDispatcher("pages/gestioneDistributore/aggiungiBevanda.jsp").forward(req, resp);
		}break;
		case 2: {
			/*************************************************************************************************
													AGGIUNGI COLONNA
			 *************************************************************************************************/
			String codice = req.getParameter("codice");
			//CONTROLLO SE IL CODICE è VALIDO (LA BEVANDA CORRISPONDENTE ESISTE)
			if(Distributore.distributore.getBevandaFromCodice(codice) == null) 	
					codice = "";
				int numLattine = 0;
				try {
					numLattine = Integer.parseInt(req.getParameter("numLattine"));
					if (numLattine <= 0)
						numLattine = -1;
				} catch (NumberFormatException e) {
					numLattine = -1;
				}
				int numColonna = 0;
				try {
					numColonna = Integer.parseInt(req.getParameter("numColonna"));
					if (numColonna != 1 &&numColonna != 2 &&numColonna != 3 &&numColonna != 4)
						numColonna = -1;
				} catch (NumberFormatException e) {
					numColonna = -1;
				}
				if(!codice.equals("") && numLattine!= -1 && numColonna != -1){								
					Distributore.distributore.aggiornaColonna(numColonna, Distributore.distributore.getBevandaFromCodice(codice), numLattine);
					esito = "SUCCESS";
				} else {
					esito = "ERRORE";					
					req.setAttribute("codice", codice);
					req.setAttribute("numColonna", numColonna);
					req.setAttribute("numLattine", numLattine);					
				}		
				req.setAttribute("esito", esito);
				req.getRequestDispatcher("pages/gestioneDistributore/aggiornaColonna.jsp").forward(req, resp);
		}break;
		case 3: {
			/*************************************************************************************************
													AGGIUNGI TESSERA
			 *************************************************************************************************/
			int codice;
			try {
				codice = Integer.parseInt(req.getParameter("codice"));
			} catch (NumberFormatException e) {
				codice = -1;
			}				
			float credito;
			try {
				credito = Float.parseFloat(req.getParameter("credito"));
			} catch (NumberFormatException e) {
				credito = -1;
			}
			if(codice != -1 && credito != -1){
				Distributore.distributore.aggiungiTessera(new Tessera(codice, credito));
				esito = "SUCCESS";
			} else {
				esito = "ERRORE";
				req.setAttribute("codice", codice);
				req.setAttribute("credito", credito);
			}
			req.setAttribute("esito", esito);
			req.getRequestDispatcher("pages/gestioneTessere/aggiungiTessera.jsp").forward(req, resp);
		}break;
		case 4: {
			/*************************************************************************************************
													RICARICA TESSERA
			 *************************************************************************************************/
			int codice;
			try {
				codice = Integer.parseInt(req.getParameter("codice"));					
			} catch (NumberFormatException e) {
				codice = -1;
			}
			float importo;
			try {
				importo = Float.parseFloat(req.getParameter("importo"));
			} catch (NumberFormatException e) {
				importo = -1;
			}
			Tessera t = Distributore.distributore.getTesseraFromCodice(codice);
			if(t == null)
				codice = -1;
			if(codice != -1 && importo != -1){
				t.caricaTessera(importo);
				esito = "SUCCESS";
			} else {
				esito = "ERRORE";
				req.setAttribute("codice", codice);
				req.setAttribute("importo", importo);
			}					
			req.setAttribute("esito", esito);
			req.getRequestDispatcher("pages/erogazione/ricaricaTessera.jsp").forward(req, resp);
		}break;
		case 5: {
			/*************************************************************************************************
													EFFETTUA EROGAZIONE
			 *************************************************************************************************/
			int codiceTessera;
			try {
				codiceTessera = Integer.parseInt(req.getParameter("codiceTessera"));
			} catch (NumberFormatException e) {
				codiceTessera = -1;
			}
			String codiceBevanda = req.getParameter("codiceBevanda");
			if(Distributore.distributore.getTesseraFromCodice(codiceTessera) == null)
				codiceTessera = -1;
			if(Distributore.distributore.getBevandaFromCodice(codiceBevanda) == null)
				codiceBevanda = "";
			if(!codiceBevanda.equals("") && codiceTessera != -1) {
				int colonna = Distributore.distributore.eroga(codiceBevanda, codiceTessera);
				esito = "SUCCESS";
				req.setAttribute("colonnaPrelievo", colonna);
			} else {
				esito = "ERROR";
				req.setAttribute("codiceTessera", codiceTessera);		
				req.setAttribute("codiceBevanda", codiceBevanda);
			}
			req.setAttribute("esito", esito);
			req.getRequestDispatcher("pages/erogazione/eroga.jsp").forward(req, resp);
		}break;
		case 6: {
			/*************************************************************************************************
												NUMERO LATTINE PER BIBITA
			 *************************************************************************************************/
			String codiceBevanda = req.getParameter("codiceBevanda");
			if(Distributore.distributore.getBevandaFromCodice(codiceBevanda) == null)
				codiceBevanda = "";
			if(!codiceBevanda.equals("")) {
				int lattineDisponibili = Distributore.distributore.lattineDisponibili(codiceBevanda);
				esito = "SUCCESS";
				req.setAttribute("lattineDisponibili", lattineDisponibili);
			} else {
				esito = "ERROR";
				req.setAttribute("codiceBevanda", codiceBevanda);
			}
			req.setAttribute("esito", esito);				
			req.getRequestDispatcher("pages/erogazione/lattineDisponibili.jsp").forward(req, resp);
		}break;
		}
	}

	public int lattineDisponibili(String codiceBevanda) {
		Colonna c = new Colonna();
		int numLattine = 0;
		Iterator<Colonna> it = colonne.iterator();
		while (it.hasNext()) {
			c = it.next();
			if (c.getBevanda().getCodice().equals(codiceBevanda))
				numLattine += c.getNumLattine();
		}
		return numLattine;
	}

	public void aggiungiBevanda(Bevanda bevanda) {
		if (bevandeDisponibili.contains(bevanda))
			System.out.println("Bevanda già inserita");
		else {
			bevandeDisponibili.add(bevanda);
			System.out.println("Bevanda " + bevanda.getName() + " inserita");
		}
	}

	public void aggiungiTessera(Tessera tessera) {
		if (tessere.contains(tessera))
			System.out.println("Tessera già inserita");
		else {
			tessere.add(tessera);
			System.out.println("Tessera " + tessera.getCodice() + " inserita");
		}
	}

	public void aggiornaColonna(int numColonna, Bevanda bevanda, int numLattine) {
		try {
			colonne.remove(numColonna - 1);
		} catch (IndexOutOfBoundsException e) {
		}
		colonne.add(numColonna - 1, new Colonna(bevanda, numLattine));
		System.out.println("Colonna " + numColonna + " aggiornata");
	}

	public int eroga(String codiceBevanda, int codiceTessera) {
		Bevanda bevanda = getBevandaFromCodice(codiceBevanda);
		if (bevanda == null) {
			System.out.println("Codice bevanda non valido");
			return -1;
		}
		Tessera tessera = getTesseraFromCodice(codiceTessera);
		if (tessera == null) {
			System.out.println("Codice tessera non valido");
			return -1;
		}
		if (tessera.getCredito() < bevanda.getPrezzo()) {
			System.out.println("Credito nella tessera non sufficiente");
			return -1;
		}

		Iterator<Colonna> it = colonne.iterator();
		boolean bevandaPresente = false;
		Colonna c;
		int numColonna;
		while (it.hasNext() && !bevandaPresente) {
			c = it.next();
			if (c.getBevanda().equals(bevanda) && c.getNumLattine() > 0) {
				bevandaPresente = true;
				c.setNumLattine(c.getNumLattine() - 1);
				tessera.setCredito(tessera.getCredito()
						- c.getBevanda().getPrezzo());
				numColonna = colonne.indexOf(c) + 1;
				System.out.println("Bevanda erogata dalla colonna "
						+ numColonna);
				return numColonna;
			}
		}
		System.out.println("La bevanda richiesta non è presente nel distributore");
		return -1;
	}

	public Bevanda getBevandaFromCodice(String codiceBevanda) {
		Iterator<Bevanda> it = bevandeDisponibili.iterator();
		Bevanda bevanda = new Bevanda();

		while (it.hasNext()) {
			bevanda = it.next();
			if (bevanda.getCodice().equals(codiceBevanda))
				return bevanda;
		}
		return null;
	}

	public Tessera getTesseraFromCodice(int codiceTessera) {
		Iterator<Tessera> it = tessere.iterator();
		Tessera tessera = new Tessera();
		while (it.hasNext()) {
			tessera = it.next();
			if (tessera.getCodice() == codiceTessera)
				return tessera;
		}
		return null;
	}

	public String visualizzaBevande() {
		Iterator<Bevanda> it = bevandeDisponibili.iterator();
		String str = "";
		while (it.hasNext()) {
			str += it.next().toString();
			str += "\n";
		}
		return str;
	}

	public String visualizzaTessere() {
		Iterator<Tessera> it = tessere.iterator();
		String str = "";
		while (it.hasNext()) {
			str += it.next().toString();
			str += "\n";
		}
		return str;
	}

	public String visualizzaDistributore() {
		Iterator<Colonna> it = colonne.iterator();
		String str = "";
		while (it.hasNext()) {
			str += it.next().toString();
			str += "\n";
		}
		return str;
	}
}
