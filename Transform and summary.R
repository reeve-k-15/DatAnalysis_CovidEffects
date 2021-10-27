# data Transform and summary
df_clean<- data
df_clean$Health[df_clean$Health =='Happy']<-1
df_clean$Health[df_clean$Health =='Content']<-2
df_clean$Health[df_clean$Health =='Restless']<-3
df_clean$Health<- as.numeric(df_clean$Health)

df_clean$Health
# efficiency
df_clean$Effeciency_before[df_clean$Effeciency_before =='0-2 hours']<-1
df_clean$Effeciency_before[df_clean$Effeciency_before =='2-5 hours']<-2
df_clean$Effeciency_before[df_clean$Effeciency_before =='More than 5']<-3
df_clean$Effeciency_before<- as.numeric(df_clean$Effeciency_before)

df_clean$Effeciency_before

df_clean$efficiency_during[df_clean$efficiency_during == "0-2 hours"]<-1
df_clean$efficiency_during[df_clean$efficiency_during == "2-5 hours"]<-2
df_clean$efficiency_during[df_clean$efficiency_during == "More than 5"]<-3
df_clean$efficiency_during <-as.numeric(df_clean$efficiency_during)

df_clean$efficiency_during

# screen time
df_clean$Screen_time[df_clean$Screen_time =="Yes"]<-1
df_clean$Screen_time[df_clean$Screen_time =="No"]<-0
df_clean$Screen_time<-as.numeric(df_clean$Screen_time)
df_clean$Screen_time

# engagement
df_clean$engagement_with_teachers[df_clean$engagement_with_teachers =="Always"]<-1
df_clean$engagement_with_teachers[df_clean$engagement_with_teachers =="Sometimes"]<-2
df_clean$engagement_with_teachers[df_clean$engagement_with_teachers =="Never"]<-3
df_clean$engagement_with_teachers<- as.numeric(df_clean$engagement_with_teachers)

df_clean$engagement_with_teachers
# expense
df_clean$monthly_expense[df_clean$monthly_expense == 'Increased']<-1
df_clean$monthly_expense[df_clean$monthly_expense == 'Remains the same']<-2
df_clean$monthly_expense[df_clean$monthly_expense == 'Decreased']<-3
df_clean$monthly_expense<-as.numeric(df_clean$monthly_expense)

df_clean$monthly_expense
#Social issues
df_clean$effect_on_social_issues[df_clean$effect_on_social_issues == 'Yes']<-1
df_clean$effect_on_social_issues[df_clean$effect_on_social_issues == 'No']<-0
df_clean$effect_on_social_issues<- as.numeric(df_clean$effect_on_social_issues)

df_clean$effect_on_social_issues
# Reopening
df_clean$Reopening_thoughts[df_clean$Reopening_thoughts == 'Yes']<-1
df_clean$Reopening_thoughts[df_clean$Reopening_thoughts == 'No']<-0
df_clean$Reopening_thoughts<- as.numeric(df_clean$Reopening_thoughts)

df_clean$Reopening_thoughts

drops<- c("serial","social_platforms","new_subscriptions")

df_clean<-df_clean[,!names(df_clean)%in% drops]

head(df_clean,10)

summary(df_clean)
