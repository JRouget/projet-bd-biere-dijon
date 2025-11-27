    QUARTIER||--o{BAR:"contient"
	BAR}o--o{PRIX:"vend"
	BIERE}o--o{PRIX:"est vendu dans"

    
    QUARTIER {
		int id_quartier PK ""  
		string nom  ""  
	}
	BAR {
		int id_bar PK ""  
		string nom  ""  
		string adresse  ""  
		int id_quartier FK ""  
	}
	BIERE {
		int id_biere PK ""  
		string nom  ""  
		string type  ""  
		float degree_alcool  ""  
	}
	PRIX {
		int id_bar PK,FK ""  
		int id_biere PK,FK ""  
		float prix  ""  
	}




![Mermaid](/Mermaid.png)