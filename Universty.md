# Università

## Dipartimenti
- ID                                SMALLINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL                          
- Nome                              VARCHAR(30) UNIQUE NOTNULL
- Nazione                           VARCHAR(30) NOTNULL
- Regione                           VARCHAR(30) NULL
- Città                             VARCHAR(60) NOTNULL
- Indirizzo_Sede_Principale         VARCHAR(70) NOTNULL
## Facoltà
- ID                                TINYINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL
- FK Dipartimento ID
- Nome                              VARCHAR(30) UNIQUE NOTNULL
- Durata                            VARCHAR(10) NOTNULL
## Corsi
- ID                                TINYINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL
- FK1 FacoltàID                     TINYINT FKEY UNIQUE NOTNULL
- FK2 DocenteID                     TINYINT FKEY UNIQUE NOTNULL
- Nome                              VARCHAR(30) UNIQUE NOTNULL                      
## Docenti
- ID                                TINYINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL
- Nome                              VARCHAR(35) NOTNULL
- Cognome                           VARCHAR(35) NOTNULL
## Studenti
- ID                                MEDIUMINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL
- FK1 FacoltàID                     TINYINT FKEY UNIQUE NOTNULL
- FK2 CorsoID                       TINYINT FKEY UNIQUE NOTNULL
- Nome                              VARCHAR(30) NOTNULL
- Cognome                           VARCHAR(30) NOTNULL
- Numero_Matricola                  VARCHAR(30) UNIQUE NOTNULL
- Data_di_Nascita                   DATE NOTNULL
- Media_Voti                        FLOAT(4,2) NULL
## Appelli
- ID                                SMALLINT PRIMARYKEY UNIQUE AUTOINCREMENT NOTNULL 
- FK1 CorsoID                       TINYINT FKEY UNIQUE NOTNULL
- FK2 DocenteID                     TINYINT FKEY UNIQUE NOTNULL
- Data_Appello                      DATETIME NOTNULL
- Voto                              TINYINT NULL
## Voti
- FK1 AppelloID                     SMALLINT FKEY UNIQUE NOTNULL 
- FK2 StudenteID                    MEDIUMINT FKEY UNIQUE NOTNULL
- FK3 CorsoID???
- Voto                              TINYINT NULL
