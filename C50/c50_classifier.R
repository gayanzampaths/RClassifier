#install C50 package
install.packages("C50")

#import C50
require(C50)

#use in-built dataset called iris
data(iris)

#revire head section of the dataset
head(iris)

#shuffel dataset
set.seed(9850)
g<-runif(nrow(iris))
newIris <- iris[order(g),]

#revire head section of the dataset
head(newIris)

#built data model using C50 (only use 100 rows of the dataset)
model1 <- C5.0(newIris[1:100,-5],newIris[1:100,5])

#view model
model1

#summary of the model
summary(model1)

#check prediction with the rest of the dataset
pred1 <- predict(model1, newIris[101:150,])

#view prediction data
pred1

#compare original data with predictd data
table(original = newIris[101:150,5], predict = pred1)

#plot the classifire decision graph
plot(model1)
