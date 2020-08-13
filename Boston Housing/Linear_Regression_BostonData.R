library(ggplot2)
library(corrplot)
library(plotly)
library(reshape2)
library(dplyr)
library(caTools)
library(mlbench)
library(readr)
library(datasets)

# Boston Data Analysis
data("BostonHousing")

# storing the values in housing variable
housing <- BostonHousing
View(housing)

class(housing)
# Head of Boston Data
head(housing) 
# Summary
summary(housing)
# sum of 'na' values
sum(is.na(housing))

# Density & Count Plot 

ggplot(housing, aes(medv)) +
  geom_histogram(aes(y = ..count.. ), color="black", 
                 fill="cyan", bins = 30) 
  
ggplot(housing , aes(medv)) + 
  geom_histogram(aes(y= ..density.. ), color="black",fill="cyan", bins = 30) +
  geom_density(color = "black", lwd = 1)

# MedV outliers 
ggplot(housing , aes(y=medv)) + 
  geom_boxplot(aes(y=medv),outlier.color = "red")

# Correaltion
# Feature Selection

corrplot(cor(select(housing, -chas)), method = "number")

corr <- round(cor(select(housing, -chas)), 2)
df <- reshape2::melt(corr)

library(RColorBrewer)

gg <- ggplot(df, aes(x=Var1, y=Var2, fill=value, label=value)) + 
  geom_tile() + theme_bw() + 
  geom_text(aes(label=value, size=2)) + 
  labs(title="Correlation Plot") + 
  theme(text=element_text(size=15), legend.position="none")

gg + scale_fill_distiller(palette="Reds")

# caret library

library(caret)

# Centering/scaling of input features

ncol(housing)

## FEATURE Engineering ####### 

# maxs <- apply(data, 2, max) 
# mins <- apply(data, 2, min)

# scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins))

## scale(as.matrix(sapply(housing[1:13], as.numeric)))  
# housing[1:13]

housing_scale <- cbind(scale(as.matrix(sapply(housing[1:13], as.numeric))),
                       housing[14])

housing_scale

colnames(housing_scale)

### DATA Partitioning #######

# Split Train & Test Dataset

set.seed(123)

# split data will store TRUE for training i.e 80% sample
# False for Testing i.e. 20% sample
split_data <- sample.split(housing_scale, SplitRatio = 0.8)

train_data <- subset(housing_scale, split_data==TRUE)
test_data <- subset(housing_scale, split_data==FALSE)

head(train_data)

# Training Our Model
model <- lm(medv~. , 
            data = train_data)
summary(model)

#predict on test set
pred_lm <- predict(model, newdata = test_data)
pred_lm
# Root-mean squared error
summary(model)
rmse_lm <- sqrt(sum((pred_lm - test_data$medv)^2)/ length(test_data$medv))

c(RMSE = rmse_lm, R2 = summary(model)$r.squared)

## Variance inflation factors are computed using vif() for the standard errors 
## of linear model coefficient estimates

library(car)
vif(model)  

# MODEL 2
colnames(train_data)
#Try simple linear model using selected features
lm_model <- lm (medv ~ crim + chas + nox + rm + dis + ptratio + 
                rad + b + lstat, data = train_data)
summary(model)
#predict on test set
pred_lm <- predict(lm_model, newdata = test_data)
pred_lm
# Root-mean squared error
rmse_lm <- sqrt(sum((pred_lm - test_data$medv)^2)/ length(test_data$medv))

c(RMSE = rmse_lm, R2 = summary(lm_model)$r.squared)

# Residuals
res <- residuals(model)

res <- as.data.frame(res)
ggplot(res, aes(res)) + geom_histogram(fill='violet', 
                                       bins=30) 

plot(model)

predict(model,c())
# PREDICTIONS
test_data$predicted.medv <- predict(model,test_data)
print(predicted.medv)

## PLot
plt1 <- test_data %>% ggplot(aes(medv,predicted.medv)) + 
  geom_point() +
  stat_smooth(aes(color = 'black')) + 
  xlab("Actual Value of MedV (Y)") +
  ylab("Predicted Value of MedV (Yhat)")
ggplotly(plt1)

# ERROR FUNCTION OR COST FUNCTION
# RMSE