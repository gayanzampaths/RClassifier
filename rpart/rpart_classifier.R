#install rpart and rpart.plot
install.packages("rpart")
install.packages("rpart.plot")

#import packages
require(rpart)
require(rpart.plot)

#use in-built dataset
data("iris")

#revire head section of the dataset
head(iris)

#shuffel dataset
set.seed(9850)
g<-runif(nrow(iris))
newIris <- iris[order(g),]

#revire head section of the dataset
head(newIris)

#built model
model2 <- rpart(Species ~., data = newIris[1:100,], method = "class")

#view model
model2

#summary of the model
summary(model2)

#plot the model
rpart.plot(model2)

#predict using rest 50 data
pred2 <- predict(model2, newIris[101:150,], type = "class")

#view predicted data
pred2

#compare original data with predicted data
table(original = newIris[101:150,5], pred2)
