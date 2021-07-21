Locales['cs'] = {
  ['document_deleted'] = "Dukument ~g~vymazan~w~.",
  ['document_delete_failed'] = "Dokument se nepodarilo ~r~vymazat~w~.",
  ['copy_from_player'] = "Dostal/a jsi ~g~kopii~w~ dokumentu.",
  ['from_copied_player'] = "Dal/a jsi hraci ~g~kopii~w~ dokumentu",
  ['could_not_copy_form_player'] = "Nemuzes ~r~nakopirovat~w~ pro hrace.",
  ['document_options'] = "Nastaveni dokumentu",
  ['public_documents'] = "Verejne dokumenty",
  ['job_documents'] = "Pracovni dokumenty",
  ['saved_documents'] = "Ulozene dokumenty",
  ['close_bt'] = "Zavrit",
  ['no_player_found'] = "Zadny hrac pobliz",
  ['go_back'] = "Jdi zpet",
  ['view_bt'] = "Kouknout se",
  ['show_bt'] = "Ukazat",
  ['give_copy'] = "Dat kopii",
  ['delete_bt'] = "Skartovat",
  ['yes_delete'] = "Ano skartovat",
}

Config.Documents['cs'] = {
    ["public"] = {
      {
        headerTitle = "FORMULAR O UDELENI SOUHLASU",
        headerSubtitle = "Formular udeleni souhlasu.",
        elements = {
          { label = "TEXT SOUHLASU", type = "textarea", value = "", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "VYPOVED SVEDKA",
        headerSubtitle = "Oficialni svedecka vypoved.",
        elements = {
          { label = "DATUM VYSTAVENI", type = "input", value = "", can_be_emtpy = false },
          { label = "TEXT VYPOVEDI", type = "textarea", value = "", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "FORMULAR K PREPISU VOZIDLA",
        headerSubtitle = "Prevod vozidla na noveho majitele.",
        elements = {
          { label = "SPZ", type = "input", value = "", can_be_emtpy = false },
          { label = "JMENO OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "SMLUVENA CENA", type = "input", value = "", can_be_empty = false },
          { label = "DALSI INFORMACE", type = "textarea", value = "", can_be_emtpy = true },
        }
      },
      {
        headerTitle = "DLUZNI UPIS",
        headerSubtitle = "Oficialni dokument uznani dluhu vuci jinemu obcanovi.",
        elements = {
          { label = "KRESTNI JMENO VERITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI VERITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "DLUZNA CASTKA", type = "input", value = "", can_be_empty = false },
          { label = "DATUM SPLATNOSTI", type = "input", value = "", can_be_empty = false },
          { label = "DALSI INFORMACE", type = "textarea", value = "", can_be_emtpy = true },
        }
      },
      {
        headerTitle = "POTVRZENI O ZAPLACENI DLUHU",
        headerSubtitle = "Potvrzeni o zaplaceni dluzne castky dluznikem.",
        elements = {
          { label = "KRESTNI JMENO DLUZNIKA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI DLUZNIKA", type = "input", value = "", can_be_emtpy = false },
          { label = "DLUZNA CASTKA", type = "input", value = "", can_be_empty = false },
          { label = "DALSI INFORMACE", type = "textarea", value = "Timto prohlasuji, ze vyse zmineny obcan splatil dluh ve stanovene vysi.", can_be_emtpy = false, can_be_edited = false },
        }
      },
      {
        headerTitle = "PRACOVNI SMLOUVA",
        headerSubtitle = "Pracovni smlouva na plny pracovni uvazek.",
        elements = {
          { label = "JMENO A PRIJMENI", type = "input", value = "", can_be_emtpy = false },
          { label = "DATUM NAROZENI", type = "input", value = "", can_be_emtpy = false },
          { label = "PRAVA A POVINNOSTI ZAMESTNANCE", type = "textarea", value = "", can_be_emtpy = false },
          { label = "PRAVA A POVINNOSTI ZAMESTNAVATELE", type = "textarea", value = "", can_be_emtpy = false },
          { label = "PLATOVE PODMINKY", type = "textarea", value = "", can_be_emtpy = false },
          { label = "DELKA PRACOVNIHO POMERU", type = "input", value = "", can_be_emtpy = false },
        }
      }
    },
    ["police"] = {
      {
        headerTitle = "SPECIALNI PARKOVACI OPRAVNENI",
        headerSubtitle = "Parkovaci opravneni na dobu neomezene dlouhou.",
        elements = {
          { label = "KRESTNI JMENO DRZITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI DRZITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "INFORMACE", type = "textarea", value = "Vyse zminenemu obcanovi bylo udeleno neomezene parkovaci povoleni ve vsech castech mesta s platnosti do data vyse zmineneho.", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "POVOLENI K DRZENI ZBRANE",
        headerSubtitle = "Povoleni k drzeni zbrane vydavane policii.",
        elements = {
          { label = "KRESTNI JMENO DRZITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI DRZITELE", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "INFORMACE", type = "textarea", value = "Vyse zminenemu obcanovi bylo udeleno povoleni k drzeni zbrane s platnosti do data vyse zmineneho.", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "VYMAZANI REJSTRIKU TRESTU",
        headerSubtitle = "Oficialni dokument o vymazani trestu z trestniho rejstriku.",
        elements = {
          { label = "KRESTNI JMENO OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "DATUM VYSTAVENI", type = "input", value = "", can_be_empty = false },
          { label = "PROHLASENI", type = "textarea", value = "Policie timto prohlasuje ze vyse zmineny obcan vlastni cisty trestni rejstrik. Toto prohlaseni je platne od data uvedeneho ve vypisu rejstriku trestu, cimz je datum podepsani dokumentu.", can_be_emtpy = false, can_be_edited = false },
        }         }
    },
    ["lost"] = {
      {
        headerTitle = "PRODEJ TABAKOVYCH VYROBKU",
        headerSubtitle = "Povoleni k prodeji tabakovych vyrobku od Yellow Jacku.",
        elements = {
          { label = "FIRMA", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "Doba neurcita", can_be_emtpy = false },
          { label = "USTANOVENI", type = "textarea", value = "Yellow Jack uděluje firmě uvedené výše právo na prodej licencovaných Bezejmených cigaret za předem stanovenou cenu uvedenou na kolku a to 1000 dolarů za krabičku. Licence platí pouze pro prodej v provozovně, či ve svém stánku na akcích, prodej mohou provádět pouze pověřené a způsobilé osoby.", can_be_emtpy = false },
          { label = "USTANOVENI", type = "textarea", value = "Firma uvedená výše se zavazuje k dodržování jednotné ceny uvedené na kolku za licencované cigarety dodávané Yellow Jackem a to 1000 dolarů za krabičku, také se zavazuje prodávat tyto cigarety výhradně ve své provozovně či ve svém stánku na akcích, tento prodej může uskutečnit pouze osoba k tomu určená a způsobilá. Yellow Jack naoplátku uděluje této firmě právo na prodej licencovaných cigaret.", can_be_emtpy = false },
          { label = "USTANOVENI", type = "textarea", value = "Porušením stanovených podmínek právo na prodej zaniká, a firmě uvedené výše hrozí pokuta ve výši 100 000 dolarů, vyplívající z uzavření této smlouvy. Pokutu je nutno uhradit firmě Yellow Jack nejpozději do 30 dnů. Yellow Jack se zároveň zavazuje dodat nejméně 100 balíčků cigaret měsíčně, pokud si je zákazník objedná. Tento dokument je možné do 48h od vystavení na vládě nebo u právníka který neplatnost dokumentu potvrdí, v opačném případě s dokumentem obě strany souhlasí.", can_be_emtpy = false },
        }
      },
    },
    ["ambulance"] = {
      {
        headerTitle = "POJISTENI",
        headerSubtitle = "Potvrzeni o pojisteni pacienta.",
        elements = {
          { label = "KRESTNI JMENO PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "DATUM VYSTAVENI", type = "input", value = "", can_be_empty = false },
          { label = "TYP POJISTENI", type = "input", value = "", can_be_empty = false },
          { label = "ZAPLACENA CASTKA", type = "input", value = "", can_be_empty = false },
          { label = "DOBA TRVANI", type = "input", value = "", can_be_empty = false },
        }
      },
      {
        headerTitle = "POTVRZENI ZDRAVOTNI ZPUSOBILOSTI",
        headerSubtitle = "Oficialni lekarska zprava o zdravotni zpusobilosti pacienta.",
        elements = {
          { label = "KRESTNI JMENO PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "DATUM VYSTAVENI", type = "input", value = "", can_be_empty = false },
          { label = "TEXT LEKARSKE ZPRAVY", type = "textarea", value = "", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "LEKARSKA ZPRAVA - PSYCHOLOGIE",
        headerSubtitle = "Oficialni lekarska zprava vydana psychologem.",
        elements = {
          { label = "KRESTNI JMENO PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "TEXT LEKARSKE ZPRAVY", type = "textarea", value = "Vyse zmineny pacient byl vysetren specializovanym lekarem a byl prohlasen za mentalne zdraveho. Toto prohlaseni ma platnost do vyse zmineneho data.", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "LEKARSKA ZPRAVA - OCNI LEKAR",
        headerSubtitle = "Oficialni lekarska zprava vydana ocnim lekarem.",
        elements = {
          { label = "KRESTNI JMENO PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI PACIENTA", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "TEXT LEKARSKE ZPRAVY", type = "textarea", value = "Vyse zmineny pacient byl vysetren specializovanym lekarem a nebyla mu diagnostikovana zadna ocni vada. Toto prohlaseni ma platnost do vyse zmineneho data.", can_be_emtpy = false },
        }
      },
      {
        headerTitle = "POVOLENI K UZIVANI MARIHUANY",
        headerSubtitle = "Povoleni uzivani marihuany ze zdravotnich duvodu.",
        elements = {
          { label = "KRESTNI JMENO OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "LEKARSKKA ZPRAVA", type = "textarea", value = "Vyse zminenenu obcanovi bylo po dukladnem vystreni povoleno vlastnit a uzivat marihuanu z nezverejnenych zdravotnich duvodu. Maximalni mnozstvi, ktere muze obcan vlastnit cini 100g.", can_be_emtpy = false, can_be_edited = false },
        }
      },
    },

    ["state"] = {
      {
        headerTitle = "SMLOUVA O POSKYTOVANI PRAVNI POMOCI",
        headerSubtitle = "Smlouva o poskytovani pravni pomoci vydana pravnikem.",
        elements = {
          { label = "KRESTNI JMENO OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "PRIJMENI OBCANA", type = "input", value = "", can_be_emtpy = false },
          { label = "PLATNOST DO", type = "input", value = "", can_be_empty = false },
          { label = "INFORMACE", type = "textarea", value = "Tento dokument je dukazem o pravnim zastoupeni a reprezentaci vyse zmineneho obcana. Pravni sluzby jsou poskytovany do vyse uvedeneho data platnosti.", can_be_emtpy = false },
        }
      }
    },
}
