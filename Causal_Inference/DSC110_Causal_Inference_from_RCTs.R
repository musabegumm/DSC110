library(speff2trial)
data("ACTG175")

# Simplify to just two treatment arms (ZDV vs ZDV+ddI)
actg_simple <- subset(ACTG175, arms %in% c(0, 1))

# Rename treatment: 0 = ZDV only, 1 = ZDV + ddI
actg_simple$treatment <- actg_simple$arms

# PRIMARY ANALYSIS: T-test on outcome (CD4 count at 20 weeks)
t.test(cd420 ~ treatment, data = actg_simple)

# BALANCE CHECK: Check if baseline CD4 is similar (it should be!)
t.test(cd40 ~ treatment, data = actg_simple)
