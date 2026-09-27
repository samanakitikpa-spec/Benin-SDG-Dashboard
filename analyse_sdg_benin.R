# ============================================================
# PROJET 1 - BENIN SDG DATA DASHBOARD
# Extraction des données ODD depuis l'ONU
# ============================================================

# 1. Installer les packages (à faire une seule fois)
#install.packages(c("httr2", "jsonlite", "dplyr", "tidyr"))

# 2. Charger les packages
library(httr2)
library(jsonlite)
library(dplyr)
library(tidyr)
# Adresse de l'API
url <- "https://unstats.un.org/SDGAPI/v1/sdg/GeoArea/List"


library(httr2)
water <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SH_H2O_SAFE",
    areaCode = 204,
    pageSize = 500
  ) |>
  req_perform()
resp_status(water)
water_data <- resp_body_json(water)

water_data$totalElements
water_data <- resp_body_json(water)
water_data$totalElements
unique(sapply(water_data$data, function(x) x$dimensions))
water_benin <- Filter(
  function(x) {
    x$geoAreaCode == "204" &&
      x$dimensions$Location == "ALLAREA"
  },
  water_data$data
)
length(water_benin)
sapply(water_benin, function(x) x$timePeriodStart)
water_table <- data.frame(
  annee = sapply(water_benin, function(x) x$timePeriodStart),
  eau_potable = sapply(water_benin, function(x) x$value)
)
head(water_table)
tail(water_table)
((17.69683266 - 14.20885563) / 14.20885563) * 100
plot(
  water_table$annee,
  water_table$eau_potable,
  type = "o",
  xlab = "Année",
  ylab = "Population utilisant un service d'eau potable (%)",
  main = "Évolution de l'accès à l'eau potable au Bénin"
)
education <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SE_TOT_CPLR",
    areaCode = 204,
    pageSize = 500
  ) |>
  req_perform()
resp_status(education)
education_data <- resp_body_json(education)
education_data$totalElements
unique(sapply(education_data$data, function(x) x$dimensions))
library(httr2)
packageVersion("httr2")
url <- "https://unstats.un.org/SDGAPI/v1/sdg/GeoArea/List"
response <- request(url) |>
  req_perform()
resp_status(response)
poverty <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SI_POV_NAHC",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
poverty_data <- resp_body_json(poverty)
poverty_data$totalElements
poverty_table <- data.frame(
  annee = sapply(poverty_data$data, function(x) x$timePeriodStart),
  pauvrete = sapply(poverty_data$data, function(x) x$value)
)
poverty_table
mort <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SH_DYN_MORT",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
mort_data <- resp_body_json(mort)
mort_data$totalElements
mort_benin <- Filter(
  function(x) {
    x$geoAreaCode == "204" &&
      x$dimensions$Sex == "BOTHSEX" &&
      x$dimensions$Age == "<5Y"
  },
  mort_data$data
)
length(mort_benin)
mort_table <- data.frame(
  annee = sapply(mort_benin, function(x) x$timePeriodStart),
  mortalite = sapply(mort_benin, function(x) x$value)
)
mort_table
birth <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SH_STA_BRTC",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
birth_data <- resp_body_json(birth)
birth_data$totalElements
birth_table <- data.frame(
  annee = sapply(birth_data$data, function(x) x$timePeriodStart),
  naissances_assistees = sapply(birth_data$data, function(x) x$value)
)
birth_table
elec <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "EG_ACS_ELEC",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
elec_data <- resp_body_json(elec)
elec_data$totalElements
elec_benin <- Filter(
  function(x) {
    x$geoAreaCode == "204" &&
      x$dimensions$Location == "ALLAREA"
  },
  elec_data$data
)
length(elec_benin)
elec_table <- data.frame(
  annee = sapply(elec_benin, function(x) x$timePeriodStart),
  electricite = sapply(elec_benin, function(x) x$value)
)
elec_table
water_data <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SH_H2O_SAFE",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
water_data <- resp_body_json(water_data)
water_data$totalElements
water_benin <- Filter(
  function(x) {
    x$geoAreaCode == "204" &&
      x$dimensions$Location == "ALLAREA"
  },
  water_data$data
)
length(water_benin)
water_table <- data.frame(
  annee = sapply(water_benin, function(x) x$timePeriodStart),
  eau_potable = sapply(water_benin, function(x) x$value)
)
water_table
education <- request(
  "https://unstats.un.org/SDGAPI/v1/sdg/Series/Data"
) |>
  req_url_query(
    seriesCode = "SE_TOT_CPLR",
    areaCode = "204",
    pageSize = 500
  ) |>
  req_perform()
education_data <- resp_body_json(education)
education_data$totalElements
education_benin <- Filter(
  function(x) {
    x$geoAreaCode == "204" &&
      x$dimensions$Location == "ALLAREA" &&
      x$dimensions$Sex == "BOTHSEX"
  },
  education_data$data
)
length(education_benin)
education_benin[1:5]
education_primaire <- Filter(
  function(x) {
    x$dimensions$`Education level` == "PRIMAR" &&
      x$dimensions$Quantile == "_T"
  },
  education_benin
)
length(education_primaire)
sapply(education_primaire, function(x) {
  paste(x$timePeriodStart, x$value)
})
education_table <- data.frame(
  annee = sapply(education_primaire, function(x) x$timePeriodStart),
  taux_achevement = sapply(education_primaire, function(x) x$value)
)
education_table
save.image("benin_sdg_dashboard.RData")
evolution <- data.frame(
  indicateur = c(
    "Pauvreté",
    "Mortalité des moins de 5 ans",
    "Naissances assistées",
    "Accès à l'électricité",
    "Accès à l'eau potable",
    "Achèvement du primaire"
  ),
  annee_debut = c(
    min(poverty_table$annee),
    min(mort_table$annee),
    min(birth_table$annee),
    min(elec_table$annee),
    min(water_table$annee),
    min(education_table$annee)
  ),
  annee_fin = c(
    max(poverty_table$annee),
    max(mort_table$annee),
    max(birth_table$annee),
    max(elec_table$annee),
    max(water_table$annee),
    max(education_table$annee)
  ),
  valeur_debut = c(
    as.numeric(poverty_table$pauvrete[1]),
    as.numeric(mort_table$mortalite[1]),
    as.numeric(birth_table$naissances_assistees[1]),
    as.numeric(elec_table$electricite[1]),
    as.numeric(water_table$eau_potable[1]),
    as.numeric(education_table$taux_achevement[1])
  ),
  valeur_fin = c(
    as.numeric(tail(poverty_table$pauvrete, 1)),
    as.numeric(tail(mort_table$mortalite, 1)),
    as.numeric(tail(birth_table$naissances_assistees, 1)),
    as.numeric(tail(elec_table$electricite, 1)),
    as.numeric(tail(water_table$eau_potable, 1)),
    as.numeric(tail(education_table$taux_achevement, 1))
  )
)
evolution
evolution$variation_relative <- (
  (evolution$valeur_fin - evolution$valeur_debut) /
    evolution$valeur_debut
) * 100

evolution
evolution
plot(
  poverty_table$annee,
  poverty_table$pauvrete,
  type = "o",
  xlab = "Année",
  ylab = "Population sous le seuil national de pauvreté (%)",
  main = "Évolution de la pauvreté au Bénin"
)
plot(
  birth_table$annee,
  birth_table$naissances_assistees,
  type = "o",
  xlab = "Année",
  ylab = "Naissances assistées (%)",
  main = "Évolution des naissances assistées au Bénin"
)
plot(
  elec_table$annee,
  elec_table$electricite,
  type = "o",
  xlab = "Année",
  ylab = "Population ayant accès à l'électricité (%)",
  main = "Évolution de l'accès à l'électricité au Bénin"
)
plot(
  water_table$annee,
  water_table$eau_potable,
  type = "o",
  xlab = "Année",
  ylab = "Population utilisant un service d'eau potable (%)",
  main = "Évolution de l'accès à l'eau potable au Bénin"
)
plot(
  education_table$annee,
  education_table$taux_achevement,
  type = "o",
  xlab = "Année",
  ylab = "Taux d'achèvement du primaire (%)",
  main = "Évolution de l'achèvement du primaire au Bénin"
)
evolution$variation_absolue <- (
  evolution$valeur_fin - evolution$valeur_debut
)

evolution
evolution_propre <- evolution

evolution_propre$valeur_debut <- round(
  evolution_propre$valeur_debut, 2
)

evolution_propre$valeur_fin <- round(
  evolution_propre$valeur_fin, 2
)

evolution_propre$variation_absolue <- round(
  evolution_propre$variation_absolue, 2
)

evolution_propre$variation_relative <- round(
  evolution_propre$variation_relative, 2
)

evolution_propre
# ============================================
# TABLEAU DE BORD DES 6 INDICATEURS DES ODD
# ============================================

par(
  mfrow = c(2, 3),
  mar = c(4, 4, 3, 1)
)

# 1. Pauvreté
plot(
  poverty_table$annee,
  poverty_table$pauvrete,
  type = "o",
  xlab = "Année",
  ylab = "Pauvreté (%)",
  main = "ODD 1 - Pauvreté"
)

# 2. Mortalité des moins de 5 ans
plot(
  mort_table$annee,
  mort_table$mortalite,
  type = "l",
  xlab = "Année",
  ylab = "Décès / 1 000",
  main = "ODD 3 - Mortalité < 5 ans"
)

# 3. Naissances assistées
plot(
  birth_table$annee,
  birth_table$naissances_assistees,
  type = "o",
  xlab = "Année",
  ylab = "Pourcentage (%)",
  main = "ODD 3 - Naissances assistées"
)

# 4. Accès à l'électricité
plot(
  elec_table$annee,
  elec_table$electricite,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 7 - Électricité"
)

# 5. Accès à l'eau potable
plot(
  water_table$annee,
  water_table$eau_potable,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 6 - Eau potable"
)

# 6. Achèvement du primaire
plot(
  education_table$annee,
  education_table$taux_achevement,
  type = "o",
  xlab = "Année",
  ylab = "Achèvement (%)",
  main = "ODD 4 - Achèvement primaire"
)

# Rétablir l'affichage graphique normal
par(mfrow = c(1, 1))
# ============================================
# TABLEAU DE BORD DES ODD DU BENIN
# ============================================

par(
  mfrow = c(2, 3),
  mar = c(4, 4, 3, 1),
  oma = c(0, 0, 3, 0)
)

# 1. Pauvreté
plot(
  poverty_table$annee,
  poverty_table$pauvrete,
  type = "o",
  xlab = "Année",
  ylab = "Pauvreté (%)",
  main = "ODD 1 - Pauvreté"
)

# 2. Mortalité des moins de 5 ans
plot(
  mort_table$annee,
  mort_table$mortalite,
  type = "l",
  xlab = "Année",
  ylab = "Décès / 1 000",
  main = "ODD 3 - Mortalité < 5 ans"
)

# 3. Naissances assistées
plot(
  birth_table$annee,
  birth_table$naissances_assistees,
  type = "o",
  xlab = "Année",
  ylab = "Pourcentage (%)",
  main = "ODD 3 - Naissances assistées"
)

# 4. Accès à l'électricité
plot(
  elec_table$annee,
  elec_table$electricite,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 7 - Électricité"
)

# 5. Accès à l'eau potable
plot(
  water_table$annee,
  water_table$eau_potable,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 6 - Eau potable"
)

# 6. Achèvement du primaire
plot(
  education_table$annee,
  education_table$taux_achevement,
  type = "o",
  xlab = "Année",
  ylab = "Achèvement (%)",
  main = "ODD 4 - Achèvement primaire"
)

# Titre général
mtext(
  "Tableau de bord des indicateurs des ODD - Bénin",
  outer = TRUE,
  cex = 1.4,
  font = 2
)

# Retour à l'affichage normal
par(mfrow = c(1, 1))
png(
  "dashboard_odd_benin.png",
  width = 1400,
  height = 900,
  res = 120
)

par(
  mfrow = c(2, 3),
  mar = c(4, 4, 3, 1),
  oma = c(0, 0, 3, 0)
)

# ODD 1 - Pauvreté
plot(
  poverty_table$annee,
  poverty_table$pauvrete,
  type = "o",
  xlab = "Année",
  ylab = "Pauvreté (%)",
  main = "ODD 1 - Pauvreté"
)

# ODD 3 - Mortalité
plot(
  mort_table$annee,
  mort_table$mortalite,
  type = "l",
  xlab = "Année",
  ylab = "Décès / 1 000",
  main = "ODD 3 - Mortalité < 5 ans"
)

# ODD 3 - Naissances assistées
plot(
  birth_table$annee,
  birth_table$naissances_assistees,
  type = "o",
  xlab = "Année",
  ylab = "Pourcentage (%)",
  main = "ODD 3 - Naissances assistées"
)

# ODD 7 - Électricité
plot(
  elec_table$annee,
  elec_table$electricite,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 7 - Électricité"
)

# ODD 6 - Eau potable
plot(
  water_table$annee,
  water_table$eau_potable,
  type = "o",
  xlab = "Année",
  ylab = "Accès (%)",
  main = "ODD 6 - Eau potable"
)

# ODD 4 - Achèvement primaire
plot(
  education_table$annee,
  education_table$taux_achevement,
  type = "o",
  xlab = "Année",
  ylab = "Achèvement (%)",
  main = "ODD 4 - Achèvement primaire"
)

mtext(
  "Tableau de bord des indicateurs des ODD - Bénin",
  outer = TRUE,
  cex = 1.5,
  font = 2
)

dev.off()
getwd()

write.csv(
  evolution,
  "synthese_odd_benin.csv",
  row.names = FALSE
)
getwd()
list.files()
dir.create(
  "Benin_SDG_Dashboard",
  showWarnings = FALSE
)
file.exists("Benin_SDG_Dashboard")
file.copy(
  "synthese_odd_benin.csv",
  "Benin_SDG_Dashboard/synthese_odd_benin.csv",
  overwrite = TRUE
)

file.copy(
  "dashboard_odd_benin.png",
  "Benin_SDG_Dashboard/dashboard_odd_benin.png",
  overwrite = TRUE
)
list.files("Benin_SDG_Dashboard")

