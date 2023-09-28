## Multiple and Logistic Regression


data = read.csv("/Users/ariv/Desktop/QMBAssignment/medals-1.csv")
attach(data)
#View(data)

#1.1 create a dummy variable for G20 
top_20th_gdp = head(sort(data$GDP,decreasing = TRUE),n=20)[20]
data$G20 = ifelse(data$GDP >= top_20th_gdp,1,0)
sum(data$G20) #verifying weather the total value is equal to 20

#1.2 investigate the model

hist(data$GoldMedals)
log(data$GoldMedals)
data1 = subset(data,GoldMedals>0)#only countries with one medal, we use this for the first problem
#View(data1) # total of 72 countries 
detach(data)
attach(data1)
hist(log(data1$GoldMedals))  

data1$logGold <-log(GoldMedals)
#corr plot to compare the diffrent variables
library(corrplot)
C = cor(data1[c("GoldMedals","BordaPoints", "Income", "PopnSize", "GDP")])
corrplot(C)

mod1 <- lm(logGold ~ GDP + Income + PopnSize ,data=data1)
mod2 <- lm(logGold ~ GDP + PopnSize ,data=data1)
mod3 <- lm(logGold ~ Income + PopnSize ,data=data1)
mod4 <- lm(logGold ~ GDP  ,data=data1)
mod5 <- lm(logGold ~ Income ,data=data1)
mod6 <- lm(logGold ~ PopnSize ,data=data1)

library(stargazer)
stargazer(mod1,mod2,mod3,mod4,mod5,mod6,type = "html", out = "~/totalGold_compare.htm")

#1.3 Interactions between the G20 variable and other significant variable

mod7 <- lm(G20 ~ GDP + Income + PopnSize ,data=data1)
mod8 <- lm(G20 ~ GDP + PopnSize ,data=data1)
mod9 <- lm(G20 ~ Income + PopnSize ,data=data1)
mod10 <- lm(G20 ~ GDP  ,data=data1)
mod11 <- lm(G20 ~ Income ,data=data1)
mod12 <- lm(G20 ~ PopnSize ,data=data1)
stargazer(mod7,mod8,mod9,mod10,mod11,mod12,type = "html", out = "~/g20_compare.htm")

#lets calcualte some interactions between G20 and other significant variables
modI1 <- lm(G20 ~ GDP*Income*PopnSize,data=data1)   
modI2 <- lm(G20 ~ GDP*Income+PopnSize,data=data1)
modI3 <- lm(G20 ~ GDP*PopnSize+Income,data=data1)
stargazer(modI1,modI2,modI3,type = "html", out = "~/g20_interactions.htm")

#1.4 probability for top10 by total medal count
top_10th_medal_count = head(sort(data$TotalMedals,decreasing = TRUE),n=10)[10]
data$top10medals = ifelse(data$TotalMedals >= top_10th_medal_count,1,0)
sum(data$top10medals)

#logistic regression 
mod1L <-glm(top10medals ~ GDP + Income + PopnSize, family=binomial(link="logit"),data=data)
mod2L <-glm(top10medals ~ GDP + Income , family=binomial(link="logit"),data=data)
mod3L <-glm(top10medals ~  Income + PopnSize, family=binomial(link="logit"),data=data)
mod4L <-glm(top10medals ~ GDP , family=binomial(link="logit"),data=data)
mod5L <-glm(top10medals ~ Income , family=binomial(link="logit"),data=data)
mod6L <-glm(top10medals ~ PopnSize, family=binomial(link="logit"),data=data)
stargazer(mod1L,mod2L,mod3L,mod4L,mod5L,mod6L,format = "html", out = "~/top10_logistic.htm")


