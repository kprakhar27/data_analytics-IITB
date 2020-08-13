data("iris")
head(iris)

View(iris)
#plotting data - iris
ggplot(iris, aes(x=iris$Petal.Width, y=iris$Petal.Length)) +
  geom_jitter(aes(color= iris$Species))

# minmax scaling or normalization
normalize <- function(x) (x - min(x))/max(x)-min(x)

X <- iris[, 1:4]

iris_norm <- as.data.frame(apply(X,2,normalize))
iris_norm$Species <- iris$Species
str(iris_norm)

summary(iris_norm)

ggplot(data = iris_norm, aes(x = Petal.Width, y = Petal.Length)) +
  geom_jitter(aes(color = iris$Species))
