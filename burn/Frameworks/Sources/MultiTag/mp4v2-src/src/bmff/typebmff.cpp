///////////////////////////////////////////////////////////////////////////////
//
//  The contents of this file are subject to the Mozilla Public License
//  Version 1.1 (the "License"); you may not use this file except in
//  compliance with the License. You may obtain a copy of the License at
//  http://www.mozilla.org/MPL/
//
//  Software distributed under the License is distributed on an "AS IS"
//  basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
//  License for the specific language governing rights and limitations
//  under the License.
// 
//  The Original Code is MP4v2.
// 
//  The Initial Developer of the Original Code is Kona Blend.
//  Portions created by Kona Blend are Copyright (C) 2008.
//  All Rights Reserved.
//
//  Contributors:
//      Kona Blend, kona8lend@@gmail.com
//
///////////////////////////////////////////////////////////////////////////////

#include "impl.h"

using namespace mp4v2::impl::bmff;

///////////////////////////////////////////////////////////////////////////////

template <>
const EnumLanguageCode::Entry EnumLanguageCode::data[] = {
    { mp4v2::impl::bmff::ILC_AAR,  "aar",  "Afar" },
    { mp4v2::impl::bmff::ILC_ABK,  "abk",  "Abkhazian" },
    { mp4v2::impl::bmff::ILC_ACE,  "ace",  "Achinese" },
    { mp4v2::impl::bmff::ILC_ACH,  "ach",  "Acoli" },
    { mp4v2::impl::bmff::ILC_ADA,  "ada",  "Adangme" },
    { mp4v2::impl::bmff::ILC_ADY,  "ady",  "Adyghe; Adygei" },
    { mp4v2::impl::bmff::ILC_AFA,  "afa",  "Afro-Asiatic (Other)" },
    { mp4v2::impl::bmff::ILC_AFH,  "afh",  "Afrihili" },
    { mp4v2::impl::bmff::ILC_AFR,  "afr",  "Afrikaans" },
    { mp4v2::impl::bmff::ILC_AIN,  "ain",  "Ainu" },
    { mp4v2::impl::bmff::ILC_AKA,  "aka",  "Akan" },
    { mp4v2::impl::bmff::ILC_AKK,  "akk",  "Akkadian" },
    { mp4v2::impl::bmff::ILC_SQI,  "sqi",  "Albanian" },
    { mp4v2::impl::bmff::ILC_ALE,  "ale",  "Aleut" },
    { mp4v2::impl::bmff::ILC_ALG,  "alg",  "Algonquian languages" },
    { mp4v2::impl::bmff::ILC_ALT,  "alt",  "Southern Altai" },
    { mp4v2::impl::bmff::ILC_AMH,  "amh",  "Amharic" },
    { mp4v2::impl::bmff::ILC_ANG,  "ang",  "English, Old (ca.450-1100)" },
    { mp4v2::impl::bmff::ILC_ANP,  "anp",  "Angika" },
    { mp4v2::impl::bmff::ILC_APA,  "apa",  "Apache languages" },
    { mp4v2::impl::bmff::ILC_ARA,  "ara",  "Arabic" },
    { mp4v2::impl::bmff::ILC_ARC,  "arc",  "Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)" },
    { mp4v2::impl::bmff::ILC_ARG,  "arg",  "Aragonese" },
    { mp4v2::impl::bmff::ILC_HYE,  "hye",  "Armenian" },
    { mp4v2::impl::bmff::ILC_ARN,  "arn",  "Mapudungun; Mapuche" },
    { mp4v2::impl::bmff::ILC_ARP,  "arp",  "Arapaho" },
    { mp4v2::impl::bmff::ILC_ART,  "art",  "Artificial (Other)" },
    { mp4v2::impl::bmff::ILC_ARW,  "arw",  "Arawak" },
    { mp4v2::impl::bmff::ILC_ASM,  "asm",  "Assamese" },
    { mp4v2::impl::bmff::ILC_AST,  "ast",  "Asturian; Bable; Leonese; Asturleonese" },
    { mp4v2::impl::bmff::ILC_ATH,  "ath",  "Athapascan languages" },
    { mp4v2::impl::bmff::ILC_AUS,  "aus",  "Australian languages" },
    { mp4v2::impl::bmff::ILC_AVA,  "ava",  "Avaric" },
    { mp4v2::impl::bmff::ILC_AVE,  "ave",  "Avestan" },
    { mp4v2::impl::bmff::ILC_AWA,  "awa",  "Awadhi" },
    { mp4v2::impl::bmff::ILC_AYM,  "aym",  "Aymara" },
    { mp4v2::impl::bmff::ILC_AZE,  "aze",  "Azerbaijani" },
    { mp4v2::impl::bmff::ILC_BAD,  "bad",  "Banda languages" },
    { mp4v2::impl::bmff::ILC_BAI,  "bai",  "Bamileke languages" },
    { mp4v2::impl::bmff::ILC_BAK,  "bak",  "Bashkir" },
    { mp4v2::impl::bmff::ILC_BAL,  "bal",  "Baluchi" },
    { mp4v2::impl::bmff::ILC_BAM,  "bam",  "Bambara" },
    { mp4v2::impl::bmff::ILC_BAN,  "ban",  "Balinese" },
    { mp4v2::impl::bmff::ILC_EUS,  "eus",  "Basque" },
    { mp4v2::impl::bmff::ILC_BAS,  "bas",  "Basa" },
    { mp4v2::impl::bmff::ILC_BAT,  "bat",  "Baltic (Other)" },
    { mp4v2::impl::bmff::ILC_BEJ,  "bej",  "Beja; Bedawiyet" },
    { mp4v2::impl::bmff::ILC_BEL,  "bel",  "Belarusian" },
    { mp4v2::impl::bmff::ILC_BEM,  "bem",  "Bemba" },
    { mp4v2::impl::bmff::ILC_BEN,  "ben",  "Bengali" },
    { mp4v2::impl::bmff::ILC_BER,  "ber",  "Berber (Other)" },
    { mp4v2::impl::bmff::ILC_BHO,  "bho",  "Bhojpuri" },
    { mp4v2::impl::bmff::ILC_BIH,  "bih",  "Bihari" },
    { mp4v2::impl::bmff::ILC_BIK,  "bik",  "Bikol" },
    { mp4v2::impl::bmff::ILC_BIN,  "bin",  "Bini; Edo" },
    { mp4v2::impl::bmff::ILC_BIS,  "bis",  "Bislama" },
    { mp4v2::impl::bmff::ILC_BLA,  "bla",  "Siksika" },
    { mp4v2::impl::bmff::ILC_BNT,  "bnt",  "Bantu (Other)" },
    { mp4v2::impl::bmff::ILC_BOS,  "bos",  "Bosnian" },
    { mp4v2::impl::bmff::ILC_BRA,  "bra",  "Braj" },
    { mp4v2::impl::bmff::ILC_BRE,  "bre",  "Breton" },
    { mp4v2::impl::bmff::ILC_BTK,  "btk",  "Batak languages" },
    { mp4v2::impl::bmff::ILC_BUA,  "bua",  "Buriat" },
    { mp4v2::impl::bmff::ILC_BUG,  "bug",  "Buginese" },
    { mp4v2::impl::bmff::ILC_BUL,  "bul",  "Bulgarian" },
    { mp4v2::impl::bmff::ILC_MYA,  "mya",  "Burmese" },
    { mp4v2::impl::bmff::ILC_BYN,  "byn",  "Blin; Bilin" },
    { mp4v2::impl::bmff::ILC_CAD,  "cad",  "Caddo" },
    { mp4v2::impl::bmff::ILC_CAI,  "cai",  "Central American Indian (Other)" },
    { mp4v2::impl::bmff::ILC_CAR,  "car",  "Galibi Carib" },
    { mp4v2::impl::bmff::ILC_CAT,  "cat",  "Catalan; Valencian" },
    { mp4v2::impl::bmff::ILC_CAU,  "cau",  "Caucasian (Other)" },
    { mp4v2::impl::bmff::ILC_CEB,  "ceb",  "Cebuano" },
    { mp4v2::impl::bmff::ILC_CEL,  "cel",  "Celtic (Other)" },
    { mp4v2::impl::bmff::ILC_CHA,  "cha",  "Chamorro" },
    { mp4v2::impl::bmff::ILC_CHB,  "chb",  "Chibcha" },
    { mp4v2::impl::bmff::ILC_CHE,  "che",  "Chechen" },
    { mp4v2::impl::bmff::ILC_CHG,  "chg",  "Chagatai" },
    { mp4v2::impl::bmff::ILC_ZHO,  "zho",  "Chinese" },
    { mp4v2::impl::bmff::ILC_CHK,  "chk",  "Chuukese" },
    { mp4v2::impl::bmff::ILC_CHM,  "chm",  "Mari" },
    { mp4v2::impl::bmff::ILC_CHN,  "chn",  "Chinook jargon" },
    { mp4v2::impl::bmff::ILC_CHO,  "cho",  "Choctaw" },
    { mp4v2::impl::bmff::ILC_CHP,  "chp",  "Chipewyan; Dene Suline" },
    { mp4v2::impl::bmff::ILC_CHR,  "chr",  "Cherokee" },
    { mp4v2::impl::bmff::ILC_CHU,  "chu",  "Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic" },
    { mp4v2::impl::bmff::ILC_CHV,  "chv",  "Chuvash" },
    { mp4v2::impl::bmff::ILC_CHY,  "chy",  "Cheyenne" },
    { mp4v2::impl::bmff::ILC_CMC,  "cmc",  "Chamic languages" },
    { mp4v2::impl::bmff::ILC_COP,  "cop",  "Coptic" },
    { mp4v2::impl::bmff::ILC_COR,  "cor",  "Cornish" },
    { mp4v2::impl::bmff::ILC_COS,  "cos",  "Corsican" },
    { mp4v2::impl::bmff::ILC_CPE,  "cpe",  "Creoles and pidgins, English based (Other)" },
    { mp4v2::impl::bmff::ILC_CPF,  "cpf",  "Creoles and pidgins, French-based (Other)" },
    { mp4v2::impl::bmff::ILC_CPP,  "cpp",  "Creoles and pidgins, Portuguese-based (Other)" },
    { mp4v2::impl::bmff::ILC_CRE,  "cre",  "Cree" },
    { mp4v2::impl::bmff::ILC_CRH,  "crh",  "Crimean Tatar; Crimean Turkish" },
    { mp4v2::impl::bmff::ILC_CRP,  "crp",  "Creoles and pidgins (Other)" },
    { mp4v2::impl::bmff::ILC_CSB,  "csb",  "Kashubian" },
    { mp4v2::impl::bmff::ILC_CUS,  "cus",  "Cushitic (Other)" },
    { mp4v2::impl::bmff::ILC_CES,  "ces",  "Czech" },
    { mp4v2::impl::bmff::ILC_DAK,  "dak",  "Dakota" },
    { mp4v2::impl::bmff::ILC_DAN,  "dan",  "Danish" },
    { mp4v2::impl::bmff::ILC_DAR,  "dar",  "Dargwa" },
    { mp4v2::impl::bmff::ILC_DAY,  "day",  "Land Dayak languages" },
    { mp4v2::impl::bmff::ILC_DEL,  "del",  "Delaware" },
    { mp4v2::impl::bmff::ILC_DEN,  "den",  "Slave (Athapascan)" },
    { mp4v2::impl::bmff::ILC_DGR,  "dgr",  "Dogrib" },
    { mp4v2::impl::bmff::ILC_DIN,  "din",  "Dinka" },
    { mp4v2::impl::bmff::ILC_DIV,  "div",  "Divehi; Dhivehi; Maldivian" },
    { mp4v2::impl::bmff::ILC_DOI,  "doi",  "Dogri" },
    { mp4v2::impl::bmff::ILC_DRA,  "dra",  "Dravidian (Other)" },
    { mp4v2::impl::bmff::ILC_DSB,  "dsb",  "Lower Sorbian" },
    { mp4v2::impl::bmff::ILC_DUA,  "dua",  "Duala" },
    { mp4v2::impl::bmff::ILC_DUM,  "dum",  "Dutch, Middle (ca.1050-1350)" },
    { mp4v2::impl::bmff::ILC_NLD,  "nld",  "Dutch; Flemish" },
    { mp4v2::impl::bmff::ILC_DYU,  "dyu",  "Dyula" },
    { mp4v2::impl::bmff::ILC_DZO,  "dzo",  "Dzongkha" },
    { mp4v2::impl::bmff::ILC_EFI,  "efi",  "Efik" },
    { mp4v2::impl::bmff::ILC_EGY,  "egy",  "Egyptian (Ancient)" },
    { mp4v2::impl::bmff::ILC_EKA,  "eka",  "Ekajuk" },
    { mp4v2::impl::bmff::ILC_ELX,  "elx",  "Elamite" },
    { mp4v2::impl::bmff::ILC_ENG,  "eng",  "English" },
    { mp4v2::impl::bmff::ILC_ENM,  "enm",  "English, Middle (1100-1500)" },
    { mp4v2::impl::bmff::ILC_EPO,  "epo",  "Esperanto" },
    { mp4v2::impl::bmff::ILC_EST,  "est",  "Estonian" },
    { mp4v2::impl::bmff::ILC_EWE,  "ewe",  "Ewe" },
    { mp4v2::impl::bmff::ILC_EWO,  "ewo",  "Ewondo" },
    { mp4v2::impl::bmff::ILC_FAN,  "fan",  "Fang" },
    { mp4v2::impl::bmff::ILC_FAO,  "fao",  "Faroese" },
    { mp4v2::impl::bmff::ILC_FAT,  "fat",  "Fanti" },
    { mp4v2::impl::bmff::ILC_FIJ,  "fij",  "Fijian" },
    { mp4v2::impl::bmff::ILC_FIL,  "fil",  "Filipino; Pilipino" },
    { mp4v2::impl::bmff::ILC_FIN,  "fin",  "Finnish" },
    { mp4v2::impl::bmff::ILC_FIU,  "fiu",  "Finno-Ugrian (Other)" },
    { mp4v2::impl::bmff::ILC_FON,  "fon",  "Fon" },
    { mp4v2::impl::bmff::ILC_FRA,  "fra",  "French" },
    { mp4v2::impl::bmff::ILC_FRM,  "frm",  "French, Middle (ca.1400-1600)" },
    { mp4v2::impl::bmff::ILC_FRO,  "fro",  "French, Old (842-ca.1400)" },
    { mp4v2::impl::bmff::ILC_FRR,  "frr",  "Northern Frisian" },
    { mp4v2::impl::bmff::ILC_FRS,  "frs",  "Eastern Frisian" },
    { mp4v2::impl::bmff::ILC_FRY,  "fry",  "Western Frisian" },
    { mp4v2::impl::bmff::ILC_FUL,  "ful",  "Fulah" },
    { mp4v2::impl::bmff::ILC_FUR,  "fur",  "Friulian" },
    { mp4v2::impl::bmff::ILC_GAA,  "gaa",  "Ga" },
    { mp4v2::impl::bmff::ILC_GAY,  "gay",  "Gayo" },
    { mp4v2::impl::bmff::ILC_GBA,  "gba",  "Gbaya" },
    { mp4v2::impl::bmff::ILC_GEM,  "gem",  "Germanic (Other)" },
    { mp4v2::impl::bmff::ILC_KAT,  "kat",  "Georgian" },
    { mp4v2::impl::bmff::ILC_DEU,  "deu",  "German" },
    { mp4v2::impl::bmff::ILC_GEZ,  "gez",  "Geez" },
    { mp4v2::impl::bmff::ILC_GIL,  "gil",  "Gilbertese" },
    { mp4v2::impl::bmff::ILC_GLA,  "gla",  "Gaelic; Scottish Gaelic" },
    { mp4v2::impl::bmff::ILC_GLE,  "gle",  "Irish" },
    { mp4v2::impl::bmff::ILC_GLG,  "glg",  "Galician" },
    { mp4v2::impl::bmff::ILC_GLV,  "glv",  "Manx" },
    { mp4v2::impl::bmff::ILC_GMH,  "gmh",  "German, Middle High (ca.1050-1500)" },
    { mp4v2::impl::bmff::ILC_GOH,  "goh",  "German, Old High (ca.750-1050)" },
    { mp4v2::impl::bmff::ILC_GON,  "gon",  "Gondi" },
    { mp4v2::impl::bmff::ILC_GOR,  "gor",  "Gorontalo" },
    { mp4v2::impl::bmff::ILC_GOT,  "got",  "Gothic" },
    { mp4v2::impl::bmff::ILC_GRB,  "grb",  "Grebo" },
    { mp4v2::impl::bmff::ILC_GRC,  "grc",  "Greek, Ancient (to 1453)" },
    { mp4v2::impl::bmff::ILC_ELL,  "ell",  "Greek, Modern (1453-)" },
    { mp4v2::impl::bmff::ILC_GRN,  "grn",  "Guarani" },
    { mp4v2::impl::bmff::ILC_GSW,  "gsw",  "Swiss German; Alemannic; Alsatian" },
    { mp4v2::impl::bmff::ILC_GUJ,  "guj",  "Gujarati" },
    { mp4v2::impl::bmff::ILC_GWI,  "gwi",  "Gwich'in" },
    { mp4v2::impl::bmff::ILC_HAI,  "hai",  "Haida" },
    { mp4v2::impl::bmff::ILC_HAT,  "hat",  "Haitian; Haitian Creole" },
    { mp4v2::impl::bmff::ILC_HAU,  "hau",  "Hausa" },
    { mp4v2::impl::bmff::ILC_HAW,  "haw",  "Hawaiian" },
    { mp4v2::impl::bmff::ILC_HEB,  "heb",  "Hebrew" },
    { mp4v2::impl::bmff::ILC_HER,  "her",  "Herero" },
    { mp4v2::impl::bmff::ILC_HIL,  "hil",  "Hiligaynon" },
    { mp4v2::impl::bmff::ILC_HIM,  "him",  "Himachali" },
    { mp4v2::impl::bmff::ILC_HIN,  "hin",  "Hindi" },
    { mp4v2::impl::bmff::ILC_HIT,  "hit",  "Hittite" },
    { mp4v2::impl::bmff::ILC_HMN,  "hmn",  "Hmong" },
    { mp4v2::impl::bmff::ILC_HMO,  "hmo",  "Hiri Motu" },
    { mp4v2::impl::bmff::ILC_HRV,  "hrv",  "Croatian" },
    { mp4v2::impl::bmff::ILC_HSB,  "hsb",  "Upper Sorbian" },
    { mp4v2::impl::bmff::ILC_HUN,  "hun",  "Hungarian" },
    { mp4v2::impl::bmff::ILC_HUP,  "hup",  "Hupa" },
    { mp4v2::impl::bmff::ILC_IBA,  "iba",  "Iban" },
    { mp4v2::impl::bmff::ILC_IBO,  "ibo",  "Igbo" },
    { mp4v2::impl::bmff::ILC_ISL,  "isl",  "Icelandic" },
    { mp4v2::impl::bmff::ILC_IDO,  "ido",  "Ido" },
    { mp4v2::impl::bmff::ILC_III,  "iii",  "Sichuan Yi; Nuosu" },
    { mp4v2::impl::bmff::ILC_IJO,  "ijo",  "Ijo languages" },
    { mp4v2::impl::bmff::ILC_IKU,  "iku",  "Inuktitut" },
    { mp4v2::impl::bmff::ILC_ILE,  "ile",  "Interlingue; Occidental" },
    { mp4v2::impl::bmff::ILC_ILO,  "ilo",  "Iloko" },
    { mp4v2::impl::bmff::ILC_INA,  "ina",  "Interlingua (International Auxiliary Language Association)" },
    { mp4v2::impl::bmff::ILC_INC,  "inc",  "Indic (Other)" },
    { mp4v2::impl::bmff::ILC_IND,  "ind",  "Indonesian" },
    { mp4v2::impl::bmff::ILC_INE,  "ine",  "Indo-European (Other)" },
    { mp4v2::impl::bmff::ILC_INH,  "inh",  "Ingush" },
    { mp4v2::impl::bmff::ILC_IPK,  "ipk",  "Inupiaq" },
    { mp4v2::impl::bmff::ILC_IRA,  "ira",  "Iranian (Other)" },
    { mp4v2::impl::bmff::ILC_IRO,  "iro",  "Iroquoian languages" },
    { mp4v2::impl::bmff::ILC_ITA,  "ita",  "Italian" },
    { mp4v2::impl::bmff::ILC_JAV,  "jav",  "Javanese" },
    { mp4v2::impl::bmff::ILC_JBO,  "jbo",  "Lojban" },
    { mp4v2::impl::bmff::ILC_JPN,  "jpn",  "Japanese" },
    { mp4v2::impl::bmff::ILC_JPR,  "jpr",  "Judeo-Persian" },
    { mp4v2::impl::bmff::ILC_JRB,  "jrb",  "Judeo-Arabic" },
    { mp4v2::impl::bmff::ILC_KAA,  "kaa",  "Kara-Kalpak" },
    { mp4v2::impl::bmff::ILC_KAB,  "kab",  "Kabyle" },
    { mp4v2::impl::bmff::ILC_KAC,  "kac",  "Kachin; Jingpho" },
    { mp4v2::impl::bmff::ILC_KAL,  "kal",  "Kalaallisut; Greenlandic" },
    { mp4v2::impl::bmff::ILC_KAM,  "kam",  "Kamba" },
    { mp4v2::impl::bmff::ILC_KAN,  "kan",  "Kannada" },
    { mp4v2::impl::bmff::ILC_KAR,  "kar",  "Karen languages" },
    { mp4v2::impl::bmff::ILC_KAS,  "kas",  "Kashmiri" },
    { mp4v2::impl::bmff::ILC_KAU,  "kau",  "Kanuri" },
    { mp4v2::impl::bmff::ILC_KAW,  "kaw",  "Kawi" },
    { mp4v2::impl::bmff::ILC_KAZ,  "kaz",  "Kazakh" },
    { mp4v2::impl::bmff::ILC_KBD,  "kbd",  "Kabardian" },
    { mp4v2::impl::bmff::ILC_KHA,  "kha",  "Khasi" },
    { mp4v2::impl::bmff::ILC_KHI,  "khi",  "Khoisan (Other)" },
    { mp4v2::impl::bmff::ILC_KHM,  "khm",  "Central Khmer" },
    { mp4v2::impl::bmff::ILC_KHO,  "kho",  "Khotanese; Sakan" },
    { mp4v2::impl::bmff::ILC_KIK,  "kik",  "Kikuyu; Gikuyu" },
    { mp4v2::impl::bmff::ILC_KIN,  "kin",  "Kinyarwanda" },
    { mp4v2::impl::bmff::ILC_KIR,  "kir",  "Kirghiz; Kyrgyz" },
    { mp4v2::impl::bmff::ILC_KMB,  "kmb",  "Kimbundu" },
    { mp4v2::impl::bmff::ILC_KOK,  "kok",  "Konkani" },
    { mp4v2::impl::bmff::ILC_KOM,  "kom",  "Komi" },
    { mp4v2::impl::bmff::ILC_KON,  "kon",  "Kongo" },
    { mp4v2::impl::bmff::ILC_KOR,  "kor",  "Korean" },
    { mp4v2::impl::bmff::ILC_KOS,  "kos",  "Kosraean" },
    { mp4v2::impl::bmff::ILC_KPE,  "kpe",  "Kpelle" },
    { mp4v2::impl::bmff::ILC_KRC,  "krc",  "Karachay-Balkar" },
    { mp4v2::impl::bmff::ILC_KRL,  "krl",  "Karelian" },
    { mp4v2::impl::bmff::ILC_KRO,  "kro",  "Kru languages" },
    { mp4v2::impl::bmff::ILC_KRU,  "kru",  "Kurukh" },
    { mp4v2::impl::bmff::ILC_KUA,  "kua",  "Kuanyama; Kwanyama" },
    { mp4v2::impl::bmff::ILC_KUM,  "kum",  "Kumyk" },
    { mp4v2::impl::bmff::ILC_KUR,  "kur",  "Kurdish" },
    { mp4v2::impl::bmff::ILC_KUT,  "kut",  "Kutenai" },
    { mp4v2::impl::bmff::ILC_LAD,  "lad",  "Ladino" },
    { mp4v2::impl::bmff::ILC_LAH,  "lah",  "Lahnda" },
    { mp4v2::impl::bmff::ILC_LAM,  "lam",  "Lamba" },
    { mp4v2::impl::bmff::ILC_LAO,  "lao",  "Lao" },
    { mp4v2::impl::bmff::ILC_LAT,  "lat",  "Latin" },
    { mp4v2::impl::bmff::ILC_LAV,  "lav",  "Latvian" },
    { mp4v2::impl::bmff::ILC_LEZ,  "lez",  "Lezghian" },
    { mp4v2::impl::bmff::ILC_LIM,  "lim",  "Limburgan; Limburger; Limburgish" },
    { mp4v2::impl::bmff::ILC_LIN,  "lin",  "Lingala" },
    { mp4v2::impl::bmff::ILC_LIT,  "lit",  "Lithuanian" },
    { mp4v2::impl::bmff::ILC_LOL,  "lol",  "Mongo" },
    { mp4v2::impl::bmff::ILC_LOZ,  "loz",  "Lozi" },
    { mp4v2::impl::bmff::ILC_LTZ,  "ltz",  "Luxembourgish; Letzeburgesch" },
    { mp4v2::impl::bmff::ILC_LUA,  "lua",  "Luba-Lulua" },
    { mp4v2::impl::bmff::ILC_LUB,  "lub",  "Luba-Katanga" },
    { mp4v2::impl::bmff::ILC_LUG,  "lug",  "Ganda" },
    { mp4v2::impl::bmff::ILC_LUI,  "lui",  "Luiseno" },
    { mp4v2::impl::bmff::ILC_LUN,  "lun",  "Lunda" },
    { mp4v2::impl::bmff::ILC_LUO,  "luo",  "Luo (Kenya and Tanzania)" },
    { mp4v2::impl::bmff::ILC_LUS,  "lus",  "Lushai" },
    { mp4v2::impl::bmff::ILC_MKD,  "mkd",  "Macedonian" },
    { mp4v2::impl::bmff::ILC_MAD,  "mad",  "Madurese" },
    { mp4v2::impl::bmff::ILC_MAG,  "mag",  "Magahi" },
    { mp4v2::impl::bmff::ILC_MAH,  "mah",  "Marshallese" },
    { mp4v2::impl::bmff::ILC_MAI,  "mai",  "Maithili" },
    { mp4v2::impl::bmff::ILC_MAK,  "mak",  "Makasar" },
    { mp4v2::impl::bmff::ILC_MAL,  "mal",  "Malayalam" },
    { mp4v2::impl::bmff::ILC_MAN,  "man",  "Mandingo" },
    { mp4v2::impl::bmff::ILC_MRI,  "mri",  "Maori" },
    { mp4v2::impl::bmff::ILC_MAP,  "map",  "Austronesian (Other)" },
    { mp4v2::impl::bmff::ILC_MAR,  "mar",  "Marathi" },
    { mp4v2::impl::bmff::ILC_MAS,  "mas",  "Masai" },
    { mp4v2::impl::bmff::ILC_MSA,  "msa",  "Malay" },
    { mp4v2::impl::bmff::ILC_MDF,  "mdf",  "Moksha" },
    { mp4v2::impl::bmff::ILC_MDR,  "mdr",  "Mandar" },
    { mp4v2::impl::bmff::ILC_MEN,  "men",  "Mende" },
    { mp4v2::impl::bmff::ILC_MGA,  "mga",  "Irish, Middle (900-1200)" },
    { mp4v2::impl::bmff::ILC_MIC,  "mic",  "Mi'kmaq; Micmac" },
    { mp4v2::impl::bmff::ILC_MIN,  "min",  "Minangkabau" },
    { mp4v2::impl::bmff::ILC_MIS,  "mis",  "Uncoded languages" },
    { mp4v2::impl::bmff::ILC_MKH,  "mkh",  "Mon-Khmer (Other)" },
    { mp4v2::impl::bmff::ILC_MLG,  "mlg",  "Malagasy" },
    { mp4v2::impl::bmff::ILC_MLT,  "mlt",  "Maltese" },
    { mp4v2::impl::bmff::ILC_MNC,  "mnc",  "Manchu" },
    { mp4v2::impl::bmff::ILC_MNI,  "mni",  "Manipuri" },
    { mp4v2::impl::bmff::ILC_MNO,  "mno",  "Manobo languages" },
    { mp4v2::impl::bmff::ILC_MOH,  "moh",  "Mohawk" },
    { mp4v2::impl::bmff::ILC_MON,  "mon",  "Mongolian" },
    { mp4v2::impl::bmff::ILC_MOS,  "mos",  "Mossi" },
    { mp4v2::impl::bmff::ILC_MUL,  "mul",  "Multiple languages" },
    { mp4v2::impl::bmff::ILC_MUN,  "mun",  "Munda languages" },
    { mp4v2::impl::bmff::ILC_MUS,  "mus",  "Creek" },
    { mp4v2::impl::bmff::ILC_MWL,  "mwl",  "Mirandese" },
    { mp4v2::impl::bmff::ILC_MWR,  "mwr",  "Marwari" },
    { mp4v2::impl::bmff::ILC_MYN,  "myn",  "Mayan languages" },
    { mp4v2::impl::bmff::ILC_MYV,  "myv",  "Erzya" },
    { mp4v2::impl::bmff::ILC_NAH,  "nah",  "Nahuatl languages" },
    { mp4v2::impl::bmff::ILC_NAI,  "nai",  "North American Indian" },
    { mp4v2::impl::bmff::ILC_NAP,  "nap",  "Neapolitan" },
    { mp4v2::impl::bmff::ILC_NAU,  "nau",  "Nauru" },
    { mp4v2::impl::bmff::ILC_NAV,  "nav",  "Navajo; Navaho" },
    { mp4v2::impl::bmff::ILC_NBL,  "nbl",  "Ndebele, South; South Ndebele" },
    { mp4v2::impl::bmff::ILC_NDE,  "nde",  "Ndebele, North; North Ndebele" },
    { mp4v2::impl::bmff::ILC_NDO,  "ndo",  "Ndonga" },
    { mp4v2::impl::bmff::ILC_NDS,  "nds",  "Low German; Low Saxon; German, Low; Saxon, Low" },
    { mp4v2::impl::bmff::ILC_NEP,  "nep",  "Nepali" },
    { mp4v2::impl::bmff::ILC_NEW,  "new",  "Nepal Bhasa; Newari" },
    { mp4v2::impl::bmff::ILC_NIA,  "nia",  "Nias" },
    { mp4v2::impl::bmff::ILC_NIC,  "nic",  "Niger-Kordofanian (Other)" },
    { mp4v2::impl::bmff::ILC_NIU,  "niu",  "Niuean" },
    { mp4v2::impl::bmff::ILC_NNO,  "nno",  "Norwegian Nynorsk; Nynorsk, Norwegian" },
    { mp4v2::impl::bmff::ILC_NOB,  "nob",  "Bokmål, Norwegian; Norwegian Bokmål" },
    { mp4v2::impl::bmff::ILC_NOG,  "nog",  "Nogai" },
    { mp4v2::impl::bmff::ILC_NON,  "non",  "Norse, Old" },
    { mp4v2::impl::bmff::ILC_NOR,  "nor",  "Norwegian" },
    { mp4v2::impl::bmff::ILC_NQO,  "nqo",  "N'Ko" },
    { mp4v2::impl::bmff::ILC_NSO,  "nso",  "Pedi; Sepedi; Northern Sotho" },
    { mp4v2::impl::bmff::ILC_NUB,  "nub",  "Nubian languages" },
    { mp4v2::impl::bmff::ILC_NWC,  "nwc",  "Classical Newari; Old Newari; Classical Nepal Bhasa" },
    { mp4v2::impl::bmff::ILC_NYA,  "nya",  "Chichewa; Chewa; Nyanja" },
    { mp4v2::impl::bmff::ILC_NYM,  "nym",  "Nyamwezi" },
    { mp4v2::impl::bmff::ILC_NYN,  "nyn",  "Nyankole" },
    { mp4v2::impl::bmff::ILC_NYO,  "nyo",  "Nyoro" },
    { mp4v2::impl::bmff::ILC_NZI,  "nzi",  "Nzima" },
    { mp4v2::impl::bmff::ILC_OCI,  "oci",  "Occitan (post 1500); Provençal" },
    { mp4v2::impl::bmff::ILC_OJI,  "oji",  "Ojibwa" },
    { mp4v2::impl::bmff::ILC_ORI,  "ori",  "Oriya" },
    { mp4v2::impl::bmff::ILC_ORM,  "orm",  "Oromo" },
    { mp4v2::impl::bmff::ILC_OSA,  "osa",  "Osage" },
    { mp4v2::impl::bmff::ILC_OSS,  "oss",  "Ossetian; Ossetic" },
    { mp4v2::impl::bmff::ILC_OTA,  "ota",  "Turkish, Ottoman (1500-1928)" },
    { mp4v2::impl::bmff::ILC_OTO,  "oto",  "Otomian languages" },
    { mp4v2::impl::bmff::ILC_PAA,  "paa",  "Papuan (Other)" },
    { mp4v2::impl::bmff::ILC_PAG,  "pag",  "Pangasinan" },
    { mp4v2::impl::bmff::ILC_PAL,  "pal",  "Pahlavi" },
    { mp4v2::impl::bmff::ILC_PAM,  "pam",  "Pampanga; Kapampangan" },
    { mp4v2::impl::bmff::ILC_PAN,  "pan",  "Panjabi; Punjabi" },
    { mp4v2::impl::bmff::ILC_PAP,  "pap",  "Papiamento" },
    { mp4v2::impl::bmff::ILC_PAU,  "pau",  "Palauan" },
    { mp4v2::impl::bmff::ILC_PEO,  "peo",  "Persian, Old (ca.600-400 B.C.)" },
    { mp4v2::impl::bmff::ILC_FAS,  "fas",  "Persian" },
    { mp4v2::impl::bmff::ILC_PHI,  "phi",  "Philippine (Other)" },
    { mp4v2::impl::bmff::ILC_PHN,  "phn",  "Phoenician" },
    { mp4v2::impl::bmff::ILC_PLI,  "pli",  "Pali" },
    { mp4v2::impl::bmff::ILC_POL,  "pol",  "Polish" },
    { mp4v2::impl::bmff::ILC_PON,  "pon",  "Pohnpeian" },
    { mp4v2::impl::bmff::ILC_POR,  "por",  "Portuguese" },
    { mp4v2::impl::bmff::ILC_PRA,  "pra",  "Prakrit languages" },
    { mp4v2::impl::bmff::ILC_PRO,  "pro",  "Provençal, Old (to 1500)" },
    { mp4v2::impl::bmff::ILC_PUS,  "pus",  "Pushto; Pashto" },
    { mp4v2::impl::bmff::ILC_QUE,  "que",  "Quechua" },
    { mp4v2::impl::bmff::ILC_RAJ,  "raj",  "Rajasthani" },
    { mp4v2::impl::bmff::ILC_RAP,  "rap",  "Rapanui" },
    { mp4v2::impl::bmff::ILC_RAR,  "rar",  "Rarotongan; Cook Islands Maori" },
    { mp4v2::impl::bmff::ILC_ROA,  "roa",  "Romance (Other)" },
    { mp4v2::impl::bmff::ILC_ROH,  "roh",  "Romansh" },
    { mp4v2::impl::bmff::ILC_ROM,  "rom",  "Romany" },
    { mp4v2::impl::bmff::ILC_RON,  "ron",  "Romanian; Moldavian; Moldovan" },
    { mp4v2::impl::bmff::ILC_RUN,  "run",  "Rundi" },
    { mp4v2::impl::bmff::ILC_RUP,  "rup",  "Aromanian; Arumanian; Macedo-Romanian" },
    { mp4v2::impl::bmff::ILC_RUS,  "rus",  "Russian" },
    { mp4v2::impl::bmff::ILC_SAD,  "sad",  "Sandawe" },
    { mp4v2::impl::bmff::ILC_SAG,  "sag",  "Sango" },
    { mp4v2::impl::bmff::ILC_SAH,  "sah",  "Yakut" },
    { mp4v2::impl::bmff::ILC_SAI,  "sai",  "South American Indian (Other)" },
    { mp4v2::impl::bmff::ILC_SAL,  "sal",  "Salishan languages" },
    { mp4v2::impl::bmff::ILC_SAM,  "sam",  "Samaritan Aramaic" },
    { mp4v2::impl::bmff::ILC_SAN,  "san",  "Sanskrit" },
    { mp4v2::impl::bmff::ILC_SAS,  "sas",  "Sasak" },
    { mp4v2::impl::bmff::ILC_SAT,  "sat",  "Santali" },
    { mp4v2::impl::bmff::ILC_SCN,  "scn",  "Sicilian" },
    { mp4v2::impl::bmff::ILC_SCO,  "sco",  "Scots" },
    { mp4v2::impl::bmff::ILC_SEL,  "sel",  "Selkup" },
    { mp4v2::impl::bmff::ILC_SEM,  "sem",  "Semitic (Other)" },
    { mp4v2::impl::bmff::ILC_SGA,  "sga",  "Irish, Old (to 900)" },
    { mp4v2::impl::bmff::ILC_SGN,  "sgn",  "Sign Languages" },
    { mp4v2::impl::bmff::ILC_SHN,  "shn",  "Shan" },
    { mp4v2::impl::bmff::ILC_SID,  "sid",  "Sidamo" },
    { mp4v2::impl::bmff::ILC_SIN,  "sin",  "Sinhala; Sinhalese" },
    { mp4v2::impl::bmff::ILC_SIO,  "sio",  "Siouan languages" },
    { mp4v2::impl::bmff::ILC_SIT,  "sit",  "Sino-Tibetan (Other)" },
    { mp4v2::impl::bmff::ILC_SLA,  "sla",  "Slavic (Other)" },
    { mp4v2::impl::bmff::ILC_SLK,  "slk",  "Slovak" },
    { mp4v2::impl::bmff::ILC_SLV,  "slv",  "Slovenian" },
    { mp4v2::impl::bmff::ILC_SMA,  "sma",  "Southern Sami" },
    { mp4v2::impl::bmff::ILC_SME,  "sme",  "Northern Sami" },
    { mp4v2::impl::bmff::ILC_SMI,  "smi",  "Sami languages (Other)" },
    { mp4v2::impl::bmff::ILC_SMJ,  "smj",  "Lule Sami" },
    { mp4v2::impl::bmff::ILC_SMN,  "smn",  "Inari Sami" },
    { mp4v2::impl::bmff::ILC_SMO,  "smo",  "Samoan" },
    { mp4v2::impl::bmff::ILC_SMS,  "sms",  "Skolt Sami" },
    { mp4v2::impl::bmff::ILC_SNA,  "sna",  "Shona" },
    { mp4v2::impl::bmff::ILC_SND,  "snd",  "Sindhi" },
    { mp4v2::impl::bmff::ILC_SNK,  "snk",  "Soninke" },
    { mp4v2::impl::bmff::ILC_SOG,  "sog",  "Sogdian" },
    { mp4v2::impl::bmff::ILC_SOM,  "som",  "Somali" },
    { mp4v2::impl::bmff::ILC_SON,  "son",  "Songhai languages" },
    { mp4v2::impl::bmff::ILC_SOT,  "sot",  "Sotho, Southern" },
    { mp4v2::impl::bmff::ILC_SPA,  "spa",  "Spanish; Castilian" },
    { mp4v2::impl::bmff::ILC_SRD,  "srd",  "Sardinian" },
    { mp4v2::impl::bmff::ILC_SRN,  "srn",  "Sranan Tongo" },
    { mp4v2::impl::bmff::ILC_SRP,  "srp",  "Serbian" },
    { mp4v2::impl::bmff::ILC_SRR,  "srr",  "Serer" },
    { mp4v2::impl::bmff::ILC_SSA,  "ssa",  "Nilo-Saharan (Other)" },
    { mp4v2::impl::bmff::ILC_SSW,  "ssw",  "Swati" },
    { mp4v2::impl::bmff::ILC_SUK,  "suk",  "Sukuma" },
    { mp4v2::impl::bmff::ILC_SUN,  "sun",  "Sundanese" },
    { mp4v2::impl::bmff::ILC_SUS,  "sus",  "Susu" },
    { mp4v2::impl::bmff::ILC_SUX,  "sux",  "Sumerian" },
    { mp4v2::impl::bmff::ILC_SWA,  "swa",  "Swahili" },
    { mp4v2::impl::bmff::ILC_SWE,  "swe",  "Swedish" },
    { mp4v2::impl::bmff::ILC_SYC,  "syc",  "Classical Syriac" },
    { mp4v2::impl::bmff::ILC_SYR,  "syr",  "Syriac" },
    { mp4v2::impl::bmff::ILC_TAH,  "tah",  "Tahitian" },
    { mp4v2::impl::bmff::ILC_TAI,  "tai",  "Tai (Other)" },
    { mp4v2::impl::bmff::ILC_TAM,  "tam",  "Tamil" },
    { mp4v2::impl::bmff::ILC_TAT,  "tat",  "Tatar" },
    { mp4v2::impl::bmff::ILC_TEL,  "tel",  "Telugu" },
    { mp4v2::impl::bmff::ILC_TEM,  "tem",  "Timne" },
    { mp4v2::impl::bmff::ILC_TER,  "ter",  "Tereno" },
    { mp4v2::impl::bmff::ILC_TET,  "tet",  "Tetum" },
    { mp4v2::impl::bmff::ILC_TGK,  "tgk",  "Tajik" },
    { mp4v2::impl::bmff::ILC_TGL,  "tgl",  "Tagalog" },
    { mp4v2::impl::bmff::ILC_THA,  "tha",  "Thai" },
    { mp4v2::impl::bmff::ILC_BOD,  "bod",  "Tibetan" },
    { mp4v2::impl::bmff::ILC_TIG,  "tig",  "Tigre" },
    { mp4v2::impl::bmff::ILC_TIR,  "tir",  "Tigrinya" },
    { mp4v2::impl::bmff::ILC_TIV,  "tiv",  "Tiv" },
    { mp4v2::impl::bmff::ILC_TKL,  "tkl",  "Tokelau" },
    { mp4v2::impl::bmff::ILC_TLH,  "tlh",  "Klingon; tlhIngan-Hol" },
    { mp4v2::impl::bmff::ILC_TLI,  "tli",  "Tlingit" },
    { mp4v2::impl::bmff::ILC_TMH,  "tmh",  "Tamashek" },
    { mp4v2::impl::bmff::ILC_TOG,  "tog",  "Tonga (Nyasa)" },
    { mp4v2::impl::bmff::ILC_TON,  "ton",  "Tonga (Tonga Islands)" },
    { mp4v2::impl::bmff::ILC_TPI,  "tpi",  "Tok Pisin" },
    { mp4v2::impl::bmff::ILC_TSI,  "tsi",  "Tsimshian" },
    { mp4v2::impl::bmff::ILC_TSN,  "tsn",  "Tswana" },
    { mp4v2::impl::bmff::ILC_TSO,  "tso",  "Tsonga" },
    { mp4v2::impl::bmff::ILC_TUK,  "tuk",  "Turkmen" },
    { mp4v2::impl::bmff::ILC_TUM,  "tum",  "Tumbuka" },
    { mp4v2::impl::bmff::ILC_TUP,  "tup",  "Tupi languages" },
    { mp4v2::impl::bmff::ILC_TUR,  "tur",  "Turkish" },
    { mp4v2::impl::bmff::ILC_TUT,  "tut",  "Altaic (Other)" },
    { mp4v2::impl::bmff::ILC_TVL,  "tvl",  "Tuvalu" },
    { mp4v2::impl::bmff::ILC_TWI,  "twi",  "Twi" },
    { mp4v2::impl::bmff::ILC_TYV,  "tyv",  "Tuvinian" },
    { mp4v2::impl::bmff::ILC_UDM,  "udm",  "Udmurt" },
    { mp4v2::impl::bmff::ILC_UGA,  "uga",  "Ugaritic" },
    { mp4v2::impl::bmff::ILC_UIG,  "uig",  "Uighur; Uyghur" },
    { mp4v2::impl::bmff::ILC_UKR,  "ukr",  "Ukrainian" },
    { mp4v2::impl::bmff::ILC_UMB,  "umb",  "Umbundu" },
    { mp4v2::impl::bmff::ILC_UND,  "und",  "Undetermined" },
    { mp4v2::impl::bmff::ILC_URD,  "urd",  "Urdu" },
    { mp4v2::impl::bmff::ILC_UZB,  "uzb",  "Uzbek" },
    { mp4v2::impl::bmff::ILC_VAI,  "vai",  "Vai" },
    { mp4v2::impl::bmff::ILC_VEN,  "ven",  "Venda" },
    { mp4v2::impl::bmff::ILC_VIE,  "vie",  "Vietnamese" },
    { mp4v2::impl::bmff::ILC_VOL,  "vol",  "Volapük" },
    { mp4v2::impl::bmff::ILC_VOT,  "vot",  "Votic" },
    { mp4v2::impl::bmff::ILC_WAK,  "wak",  "Wakashan languages" },
    { mp4v2::impl::bmff::ILC_WAL,  "wal",  "Walamo" },
    { mp4v2::impl::bmff::ILC_WAR,  "war",  "Waray" },
    { mp4v2::impl::bmff::ILC_WAS,  "was",  "Washo" },
    { mp4v2::impl::bmff::ILC_CYM,  "cym",  "Welsh" },
    { mp4v2::impl::bmff::ILC_WEN,  "wen",  "Sorbian languages" },
    { mp4v2::impl::bmff::ILC_WLN,  "wln",  "Walloon" },
    { mp4v2::impl::bmff::ILC_WOL,  "wol",  "Wolof" },
    { mp4v2::impl::bmff::ILC_XAL,  "xal",  "Kalmyk; Oirat" },
    { mp4v2::impl::bmff::ILC_XHO,  "xho",  "Xhosa" },
    { mp4v2::impl::bmff::ILC_YAO,  "yao",  "Yao" },
    { mp4v2::impl::bmff::ILC_YAP,  "yap",  "Yapese" },
    { mp4v2::impl::bmff::ILC_YID,  "yid",  "Yiddish" },
    { mp4v2::impl::bmff::ILC_YOR,  "yor",  "Yoruba" },
    { mp4v2::impl::bmff::ILC_YPK,  "ypk",  "Yupik languages" },
    { mp4v2::impl::bmff::ILC_ZAP,  "zap",  "Zapotec" },
    { mp4v2::impl::bmff::ILC_ZBL,  "zbl",  "Blissymbols; Blissymbolics; Bliss" },
    { mp4v2::impl::bmff::ILC_ZEN,  "zen",  "Zenaga" },
    { mp4v2::impl::bmff::ILC_ZHA,  "zha",  "Zhuang; Chuang" },
    { mp4v2::impl::bmff::ILC_ZND,  "znd",  "Zande languages" },
    { mp4v2::impl::bmff::ILC_ZUL,  "zul",  "Zulu" },
    { mp4v2::impl::bmff::ILC_ZUN,  "zun",  "Zuni" },
    { mp4v2::impl::bmff::ILC_ZXX,  "zxx",  "No linguistic content; Not applicable" },
    { mp4v2::impl::bmff::ILC_ZZA,  "zza",  "Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki" },

    { mp4v2::impl::bmff::ILC_UNDEFINED } // must be last
};

///////////////////////////////////////////////////////////////////////////////

namespace mp4v2 { namespace impl { namespace bmff {

///////////////////////////////////////////////////////////////////////////////

// must come after static data init
const EnumLanguageCode enumLanguageCode;

///////////////////////////////////////////////////////////////////////////////

}}} // namespace mp4v2::impl::bmff
