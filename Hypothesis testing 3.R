library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)
library(psych)
library(epiR)


# offline rate depends on engaement with teachers

x<- table(data$online_rating,data$engagement_with_teachers)
x

chisq.test(x)

x1<- cbind(x[,1]+x[,3],x[,2])
x2<- rbind(x1[1,]+x1[2,],x1[3,]+x1[4,]+x1[5,])
x2
colnames(x2)<- c("Sometimes","Never")
rownames(x2)<- c("3","4")
yu<- Yule(x2,Y=FALSE)
yu
epi.2by2(x2,conf.level = 0.95)


# effect on social issues dependant on screen time

y<- table(data$Screen_time,data$effect_on_social_issues)
rownames(y2)<-c("increased","Decreased")

y1<- cbind(y[,2],y[,1])
y2<- rbind(y1[2,],y1[1,])

chisq.test(y2)

Yule(y2)
epi.2by2(y2)


# Between offline rating and reopening thoughts
reopen<- data$Reopening_thoughts
reopen[reopen == 'Yes']<- 1
reopen[reopen == 'No']<- 0
r<- table(data$offline_rating,reopen)
r

chisq.test(r)
r1<- rbind(r[1,]+r[2,]+r[3,]+r[4,],r[5,])
rownames(r1)<- c("4","5")

Yule(t(r1))

epi.2by2(t(r1))


# Did happier people ehave less screen time

z<- table(data$Health,data$Screen_time)
z

chisq.test(z)

#join content and restless
z1<- rbind(z[1,]+z[3,],z[2,])
z2<- cbind(z1[,2],z1[,1])
rownames(z2)<- c("Restless","Happy")
colnames(z2)<- c("Yes","No")

Yule(z2)

epi.2by2(z2)

barplot(z2,beside = TRUE,col=c("#405856","#FFFFFF"))
legend("topright",legend = c("restless","Happy"),fill= c("#405856","#FFFFFF"))


# mood as factor of increased expenditure
a<- table(data$Health,data$monthly_expense)
a
chisq.test(a)

#efficiency_during and screen time
b<-table(df$efficiency_during,df$Screen_time)
b

chisq.test(b)

# monthly expenses on reopening thoughts

c1<- table(data$monthly_expense,data$Reopening_thoughts)
c1

chisq.test(c1)

c2<- rbind(c1[1,]+c1[3,],c1[2,])
c3<- cbind(c2[,2],c2[1,])
colnames(c3)<- c("Yes","No")

Yule(c3)
epi.2by2(c3)

# increased screen time caused change in thoughts on social issues
d<- table(data$Screen_time[data$Health != "Happy"  ],data$effect_on_social_issues[data$Health != "Happy"  ])
d
d1<- cbind(d[,2],d[,1])
d2<- rbind(d1[2,],d1[1,])
d2
chisq.test(d2)