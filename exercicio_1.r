#Como resolver um exercicio fazendo a modelagem de Pesquisa Operacional ( P.O )
# Autor: Gabriel Aderaldo
# Data: 2021-09-06
# Enuciado:
# Uma empresa fabrica dois produtos P1 e P2. O lucro por unidade de P1 é de R$ 1000,00 e de P2 é de R$ 1800,00.
# A empresa precisa de 20 horas para fabricar uma unidade de P1 e 30 horas para fabricar uma unidade de P2. 
# A demanda esperada de produção ANUAL para p1 é de 40 unidades e para p2 é de 30 unidades.
# A empresa tem disponível anual 1200 horas por ano. Qual a quantidade de cada produto que a empresa deve produzir para maximizar o lucro?

# I ) Definir as variáveis de decisão -> x1...xN
# II ) Definir a função objetivo -> max ou min
# III ) Definir as restrições
# IV ) Definir a modelagem

# Exercicio 1

# Variaveis de decisão
# x1 => quantidade de P1
# x2 => quantidade de P2

# Função objetivo
# Fmax = 1000x1 + 1800x2

# Restrições
# I) A empresa precisa de 20 horas para fabricar uma unidade de P1 e 30 horas para fabricar uma unidade de P2
# II) A demanda esperada de produção ANUAL para p1 é de 40 unidades e para p2 é de 30 unidades
# III) A empresa tem disponível anual 1200 horas por ano
# Restrições tecnicas
# IV) 20x1 + 30x2 <= 1200
# V) x1 <= 40
# VI) x2 <= 30
# Restrições de não negatividade
# VII) x1 >= 0
# VIII) x2 >= 0

# resolvendo o problema
library(lpSolve)

func_obj <- c(1000, 1800) # função objetivo
restricoes <- matrix(c(20,30,1,0,0,1), nrow = 3, byrow = TRUE)
restricoes_dir <- c("<=", "<=","<=")
restricoes_val <- c(1200, 40, 30)

res_modelo <- lp("max",func_obj,restricoes,restricoes_dir,restricoes_val,compute.sens = TRUE)

print(res_modelo$solution)