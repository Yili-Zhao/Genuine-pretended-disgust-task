dat_DCM_qeustionnaire<- read.csv("questionnaire_DCM_disgust_parameter.csv",TRUE, ",")

class(dat_DCM_qeustionnaire)
head(dat_DCM_qeustionnaire)

#: DCM_g: DCM modulatory parameters for genuine disgust; DCM_p:DCM modulatory parameters for genuine disgust
colnames(dat_DCM_qeustionnaire) = c("TAS_DDF", "TAS_DIF","TAS_EOT","IRI_PT", "IRI_FA","IRI_EC","IRI_PD","ECQ_CA","ECQ_CD","ECQ_AA","ECQ_AD","ECQ_AR","DCM_g", "DCM_p")

####genuine conditions ##########
Model_genuine <- lm(DCM_real ~., data = dat_DCM_qeustionnaire)


summary(Model_genuine)

# stepwise variable selection for genuine disgust 
require(MASS)
fit1_LM_genuine<-stepAIC(Model_genuine,direction='both')
summary(fit1_LM_genuine)


#####pretended conditions #########
Model_pretended<- lm(DCM_p ~., data = dat_DCM_qeustionnaire)

summary(Model_pretended)

fit1_LM_pretended<-stepAIC(Model_acting_r,direction='both')
summary(fit1_LM_pretended)
