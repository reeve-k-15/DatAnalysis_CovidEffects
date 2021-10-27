data = read.csv("C:\\Users\\John\\Desktop\\programing\\Project 701\\project.csv")
head(df_clean)

drops<- c("serial","social_platforms","new_subscriptions")

df<-data[,!names(data)%in% drops]

df$Screen_time[df$Screen_time =="Yes"]<- "increased"
df$Screen_time[df$Screen_time =="No"]<- "Same"


#plots
ggplot(df, aes(x=Health,fill = Screen_time))+ geom_bar()+scale_x_discrete(labels=c("Happy","Content","Restless"))+ scale_fill_manual(values = c("chartreuse3","brown1"))+
  facet_wrap(~Screen_time)

ggplot(df,aes(x=online_rating,fill= Reopening_thoughts))+
  geom_bar()+scale_fill_manual(values = c("chartreuse3","brown1"))


ggplot(df,aes(x=physical_during)) + geom_bar()+ facet_wrap(~efficiency_during)
  
ggplot(df,aes(x=physical_during,y=physical_before))+ mosaicplot()

class_rate<- table(df$offline_rating,df$online_rating)
phys_rate<-table(df$physical_before,df$physical_during)

mosaicplot(class_rate,color = "Purple1",type = "Pearson",xlab = "Offline",ylab = "online")

mosaicplot(phys_rate,color = "Red1",type = "Pearson",xlab = "Before",ylab = "During")


ggplot(df,aes(x=online_rating, fill= engagement_with_teachers))+ 
  geom_bar()+scale_fill_manual(values = c("chartreuse3","brown1","Blue1"))


ggplot(df,aes(x=Screen_time))+geom_bar()+facet_wrap(~monthly_expense)

ggplot(df,aes(x=Screen_time))+geom_bar()+facet_wrap(~effect_on_social_issues)

ggplot(df,aes(x=offline_rating,fill=Reopening_thoughts))+
  geom_bar()

ggplot(df,aes(x = Health,fill= Screen_time))+ geom_bar()

ggplot(df,aes(x= monthly_expense,fill= as.factor(monthly_expense)))+ geom_bar()+ facet_wrap(~Health)

ggplot(df,aes(x=monthly_expense,fill=monthly_expense))+geom_bar()+facet_grid(~physical_before)

ggplot(df,aes(efficiency_during,fill=Screen_time))+geom_bar()

ggplot(df,aes(x=physical_during,fill=physical_during))+geom_bar(width = 0.5)+
  theme()+facet_grid(~Health)
ggplot(df,aes(x=monthly_expense, fill = Health))+geom_bar(width = 0.5)+facet_wrap(~Reopening_thoughts)
colnames(df)

ggplot(df,aes(x=Screen_time,fill = effect_on_social_issues))+geom_bar(width = 0.5)




