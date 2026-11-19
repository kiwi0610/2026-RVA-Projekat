# FIT PRO — Supplement Store (RVA 2026)

Web aplikacija za online prodavnicu suplemenata i sportske opreme (**FIT PRO**), razvijena u okviru kursa **Razvoj veb aplikacija (RVA)**.

## Tehnologije
- **Frontend:** Vue 3 (Composition API), TypeScript, Vue Router, Axios, Bootstrap
- **Backend:** REST API (`http://localhost:8080`)
- **Baza podataka:** MySQL (`rva_2026`)

## Funkcionalnosti i pregled ekrana

- **Početna stranica (`/`):** pregled brenda **FIT PRO** uz brze akcije za ulazak u ponudu i sekciju „O nama“.
  ![Početna stranica](assets/Screenshot%201.png)

- **Katalog proizvoda (`/api/shop`):** prikaz proizvoda (82 artikla u bazi), pretraga po nazivu i filtriranje po kategorijama (*Sve*, *Proteini*, *Kreatini*, *Aminokiseline*, *Oprema*, *Vitamini*).
  ![Katalog proizvoda](assets/Screenshot%202.png)
  ![Filtriranje po kategorijama](assets/Screenshot%203.png)
  ![Pretraga po nazivu i kategorija Aminokiseline](assets/Screenshot%204.png)

- **Detalji proizvoda (`/api/shop/:id`):** prikaz slike, kategorije, cene, opisa i opcije za izbor količine pre dodavanja u korpu.
  ![Detalji proizvoda](assets/Screenshot%209.png)

- **Korisnički nalozi i profil (`/login`, `/profile`):** prijava i registracija korisnika, prikaz profilnih podataka (*Ime i prezime*, *Grad*, *Adresa*, *Telefon*), opcija izmene i odjava (`Logout`).
  ![Prijava korisnika](assets/Screenshot%207.png)
  ![Profil korisnika](assets/Screenshot%208.png)

- **Korpa po korisniku i porudžbine:** dodavanje artikala direktno iz kataloga ili sa stranice detalja (uz obaveštenje ako korisnik nije ulogovan)[cite: 7, 8, 13], čuvanje korpe u `localStorage` odvojeno po korisniku (`cart_<korisnik>`) i slanje porudžbine na `/api/orders`.
  ![Obaveštenje o prijavi pri dodavanju u korpu](assets/Screenshot%206.png)
  ![Dodavanje artikla iz kataloga](assets/Screenshot%2010.png)

- **O nama:** osnovne informacije i misija prodavnice.
  ![O nama](assets/Screenshot%205.png)

## Pokretanje projekta lokalno

### 1. Uvoz baze podataka
Uvezi SQL dump fajl iz foldera `Database` u MySQL server:
- **Preko terminala:**
  ```bash
  mysql -u root -p < Database/rva_2026.sql
