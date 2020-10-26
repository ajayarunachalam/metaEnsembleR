# metaEnsembleR
Intuitive Package for Heterogeneous Ensemble Meta-Learning

## Table of Contents
- [Overview](#description)
  * [How to start](#installation)
  * [Examples](#examples)
  		* [demo classification] (#demo classification)
  		* [demo regression] (#demo regression)
  * [Contact](#contact)

## Overview
metaEnsembleR is a package for meta-level ensemble learning (Classification, Regression) that is fully-automated.
It significantly lowers the barrier for the practitioners to apply heterogeneous ensemble learning techniques in an amateur fashion to their everyday predictive problems. Comprehensive demo examples can be found in ``` Rscript Demo.R ```

## How to start
```
Install from GitHub :  devtools::install_github("ajayarunachalam/metaEnsembleR")
```

```
Install from Rconsole :  install.packages("metaEnsembleR")
```

## Examples

# demo classification
```
library("metaEnsembleR")
attach(iris)
data("iris")
unseen_new_data_testing <- iris[130:150,]
write.csv(unseen_new_data_testing, 'unseen_check.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.classifier(iris[1:130,], 5, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, unseen_new_data_testing) # read.csv('./unseen_check.csv') 


testpreddata <- data.frame(ensembler_return[1])
table(testpreddata$actual_label)
table(ensembler_return[2])
modelresult <- ensembler_return[3]
modelresult
####Performance comparison#####
act_mybar <- qplot(testpreddata$actual_label, geom="bar")
act_mybar
pred_mybar <- qplot(testpreddata$predictions, geom='bar')
pred_mybar
act_tbl <- tableGrob(t(summary(testpreddata$actual_label)))
pred_tbl <- tableGrob(t(summary(testpreddata$predictions)))
ggsave("testdata_actual_vs_predicted_chart.pdf",grid.arrange(act_tbl, pred_tbl))
ggsave("testdata_actual_vs_predicted_plot.pdf",grid.arrange(act_mybar, pred_mybar))
####unseen data###
unseenpreddata <- data.frame(ensembler_return[4])
table(unseenpreddata$unseenpreddata)
```

# demo regression
```
house_price <- read.csv(file = './data/regression/house_price_data.csv')
unseen_new_data_testing_house_price <- house_price[250:414,]
write.csv(unseen_new_data_testing_house_price, 'unseen_house_price_regression.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.regression(house_price[1:250,], 1, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_house_price_regression.csv'))
testpreddata <- data.frame(ensembler_return[1])


####Performance comparison#####
modelresult <- ensembler_return[3]
modelresult
write.csv(modelresult[[1]], "performance_chart.csv")

####unseen data###
unseenpreddata <- data.frame(ensembler_return[4])
```


## Contact
If there is some implementation you would like to see here or add in some examples feel free to do so. You can reach me at [email](mailto:ajay.arunachalam08@gmail.com)

 
