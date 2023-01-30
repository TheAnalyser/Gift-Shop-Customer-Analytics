#read in the data
data = read.csv('mitchell_final_final.csv')



removed_binary = data[,-2:-25]
str(removed_binary)

change_binary = data[,2:25]
str(change_binary)

change_binary[change_binary == 'Y'] <- 1
change_binary[change_binary == 'N'] <- 0
change_binary[is.na(change_binary)] <- 0
change_binary[change_binary == '' | change_binary == ' ' ] <- 0
change_binary[change_binary == 'NA'] <- 0

str(change_binary)

#i just changed the df name to something else as I was testing.
test = change_binary
test$Email = as.integer(test$Email)
test$Travel = as.integer(test$Travel)
test$CurrAff = as.integer(test$CurrAff)
test$CurrEv = as.integer(test$CurrEv)
test$Wines = as.integer(test$Wines)
test$FineArts = as.integer(test$FineArts)
test$Exercise = as.integer(test$Exercise)
test$SelfHelp = as.integer(test$SelfHelp)
test$Collect = as.integer(test$Collect)
test$Needle = as.integer(test$Needle)
test$Sewing = as.integer(test$Sewing)
test$DogOwner = as.integer(test$DogOwner)
test$CarOwner = as.integer(test$CarOwner)
test$Cooking = as.integer(test$Cooking)
test$Pets = as.integer(test$Pets)
test$Fashion = as.integer(test$Fashion)
test$Camping = as.integer(test$Camping)
test$Hunting = as.integer(test$Hunting)
test$Boating = as.integer(test$Boating)
test$Child0_2 = as.integer(test$Child0_2)
test$Child3_5 = as.integer(test$Child3_5)
test$Child6_11 = as.integer(test$Child6_11)
test$Child12_16 = as.integer(test$Child12_16)
test$Child17_18 = as.integer(test$Child17_18)

summary(test)

final_data = cbind(removed_binary,test)

str(final_data)

model = lm(final_data$Lifetime_CLV ~ ., data=final_data)
summary(model)