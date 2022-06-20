dat_DCM_behavior<- read.csv("../datasets/behavior_DCM_disgust_parameter.csv",TRUE, ",")
class(dat_DCM_behavior)
head(dat_DCM_behavior)


colnames(dat_DCM_behavior) = c("sub_ID","expression_g","expression_gn","expression_p","expression_pn","feeling_g","feeling_gn","feeling_p","feeling_pn", "unpleasantness_g","unpleasantness_gn","unpleasantness_p","unpleasantness_pn","DCM_g","DCM_p") # g: genuine disgust; gn: genuine neutral; p:pretneded disgust; pn: pretended neutral 

library(lme4)
library(lmerTest)
library(optimx)

######genuine conditions #####

Model_genuine_1 <- lm(DCM_g ~ expression_g + feeling_g +unpleasantness_g, data = dat_DCM_behavior)
Model_genuine_2 <- lm(DCM_g ~ expression_g *feeling_g +unpleasantness_g,data = dat_DCM_behavior)
Model_genuine_3 <- lm(DCM_g ~ expression_g +unpleasantness_g *feeling_g,data = dat_DCM_behavior)
Model_genuine_4 <- lm(DCM_g ~ expression_g *unpleasantness_g +feeling_g ,data = dat_DCM_behavior)
Model_genuine_5 <- lm(DCM_g ~ expression_g *feeling_g *unpleasantness_g,data = dat_DCM_behavior)


summary(Model_genuine_1) # could try another model 
anova(Model_genuine_1) # could try another model 

lme4:::anova.merMod(Model_genuine_1,Model_genuine_2,Model_genuine_3,Model_genuine_4,Model_genuine_5) #model comparison

#####pretended conditions #####
Model_pretended_1 <- lm(DCM_p ~ expression_p + feeling_p +unpleasantness_p, data = dat_DCM_behavior)
Model_pretended_2 <- lm(DCM_p ~ expression_p *feeling_p+unpleasantness_p,data = dat_DCM_behavior)
Model_pretended_3 <- lm(DCM_p ~ expression_p +unpleasantness_p *feeling_p,data = dat_DCM_behavior)
Model_pretended_4 <- lm(DCM_p ~ expression_p *unpleasantness_p +feeling_p,data = dat_DCM_behavior)
Model_pretended_5 <- lm(DCM_p ~ expression_p *feeling_p *unpleasantness_p,data = dat_DCM_behavior)

summary(Model_pretended_1)  
anova(Model_pretended_1) 
lme4:::anova.merMod(Model_pretended_1,Model_pretended_2,Model_pretended_3,Model_pretended_4,Model_pretended_5) #model comparion
