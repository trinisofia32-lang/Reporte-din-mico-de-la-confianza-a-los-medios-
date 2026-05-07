library(haven)
library(dplyr)

data <- read_dta("input/ELSOC_2022.dta")

data <- data %>%
  mutate(
    edad = as.numeric(edad),
    edad = ifelse(edad < 0, NA, edad),
    
    sexo = factor(sexo,
                  levels = c(1, 2),
                  labels = c("Hombre", "Mujer")),
    
    conf_medios = as.numeric(conf_medios),
    conf_medios = ifelse(conf_medios < 0, NA, conf_medios),
    conf_medios = factor(conf_medios,
                         levels = c(1, 2, 3, 4, 5),
                         labels = c("Nada",
                                    "Poca",
                                    "Media",
                                    "Bastante",
                                    "Mucha"),
                         ordered = TRUE),
    
    nivel_educ = as.numeric(nivel_educ),
    nivel_educ = ifelse(nivel_educ < 0, NA, nivel_educ),
    nivel_educ = factor(nivel_educ,
                        levels = c(1, 2, 3, 4),
                        labels = c("Básica",
                                   "Media",
                                   "Técnica",
                                   "Universitaria"),
                        ordered = TRUE)
  )
