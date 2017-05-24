# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

#Fitting Simple Linear Regression in Training set
regressor <- lm(formula = Salary ~ YearsExperience,
                data = training_set)

#Predicting the test set results
y_predicted <- predict(regressor, newdata = test_set)

#Visualising the Training Set results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
        geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
                   colour = 'red') +
        geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                  colour = 'blue') + 
        ggtitle('Salary vs Experience (Training Set)') + 
        xlab('Years of experience') + 
        ylab('Salary')

#Visualising the Test Set results
# install.packages('ggplot2')
# library(ggplot2)
ggplot() +
        geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
                   colour = 'red') +
        geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                  colour = 'blue') +
        ggtitle('Salary vs Experience (Test Set)') +
        xlab('Years of experience') +
        ylab('Salary')

#Visualising the Training Set and Test Set results
# install.packages('ggplot2')
# library(ggplot2)
# ggplot() +
#         geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
#                    colour = 'red') +
#         geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
#                    colour = 'green') +
#         geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
#                   colour = 'blue') + 
#         ggtitle('Salary vs Experience (Training Set)') + 
#         xlab('Years of experience') + 
#         ylab('Salary')