####SOURCE####
#Week 7 - ANOVAs and Regressions#
#By Chi-yun Kuo

rm(list=ls())

setwd("/Users/Home/Dropbox/Amherst/Courses/SOURCE/2013-Fall/Week7_ANOVAs")

Anole<-read.csv("anolisData.csv",header=T,na.strings="?")
head(Anole)

anova1<-lm(Awesomeness~ecomorph,data=Anole)
anova(anova1)

anova1.5<-aov(Awesomeness~ecomorph,data=Anole)
summary(anova1.5)

TukeyHSD(anova1.5)
plot(TukeyHSD(anova1.5))
pairwise.t.test(Anole$Awesomeness,Anole$ecomorph,p.adj="bonferroni")

anova2<-aov(Awesomeness~ecomorph*Island,data=Anole)
summary(anova2)
interaction.plot(x.factor=Anole$Island,trace.factor=Anole$ecomorph,response=Anole$SVL)
plot(TukeyHSD(anova2))

anova3<-aov(Awesomeness~ecomorph+Island,data=Anole)
summary(anova3)
summary(anova2)

regression1<-lm(attitude~SVL,data=Anole)
summary(regression1)

regression2<-lm(attitude~-1+SVL,data=Anole)
summary(regression2)

regression3<-lm(SVL~Island,data=Anole)
summary(regression3)

regression4<-lm(attitude~SVL*Island,data=Anole)
summary(regression4)

regression5<-lm(attitude~SVL*Awesomeness,data=Anole)
summary(regression5)

cor.test(~SVL+Awesomeness,data=Anole,method="pearson")
cor.test(~SVL+Awesomeness,data=Anole,method="spearman")