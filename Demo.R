##########################  Classification ###################
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
#### Performance comparison #####
act_mybar <- qplot(testpreddata$actual_label, geom="bar")
act_mybar
pred_mybar <- qplot(testpreddata$predictions, geom='bar')
pred_mybar
act_tbl <- tableGrob(t(summary(testpreddata$actual_label)))
pred_tbl <- tableGrob(t(summary(testpreddata$predictions)))
ggsave("testdata_actual_vs_predicted_chart.pdf",grid.arrange(act_tbl, pred_tbl))
ggsave("testdata_actual_vs_predicted_plot.pdf",grid.arrange(act_mybar, pred_mybar))
#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])
table(unseenpreddata$unseenpreddata)


# testing dhfr

data("dhfr")
unseen_new_data_testing <- dhfr[300:325,]
write.csv(unseen_new_data_testing, 'unseen_check_dhfr.csv', fileEncoding = 'UTF-8', row.names = F)

ensembler_return <- ensembler.classifier(dhfr[1:300,], 1, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_check_dhfr.csv'))
testpreddata <- data.frame(ensembler_return[1])
table(testpreddata$actual_label)
table(ensembler_return[2])
modelresult <- ensembler_return[3]
modelresult
#### Performance comparison #####
act_mybar <- qplot(testpreddata$actual_label, geom="bar")
act_mybar
pred_mybar <- qplot(testpreddata$predictions, geom='bar')
pred_mybar
act_tbl <- tableGrob(t(summary(testpreddata$actual_label)))
pred_tbl <- tableGrob(t(summary(testpreddata$predictions)))
ggsave("testdata_actual_vs_predicted_chart.pdf",grid.arrange(act_tbl, pred_tbl))
ggsave("testdata_actual_vs_predicted_plot.pdf",grid.arrange(act_mybar, pred_mybar))
#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])
table(unseenpreddata$unseenpreddata)
# unseen data actual
table(unseen_new_data_testing$Y)




# testing glass

Glass <- read.csv('./data/classification/glass.csv')
table(Glass$Type)

unseen_new_data_testing <- Glass[200:214,]
write.csv(unseen_new_data_testing, 'unseen_check_glass.csv', fileEncoding = 'UTF-8', row.names = F)
Glass$Type <- as.factor(Glass$Type)
ensembler_return <- ensembler.classifier(Glass[1:200,], 10, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_check_glass.csv'))
testpreddata <- data.frame(ensembler_return[1])
table(testpreddata$actual_label)
table(ensembler_return[2])
modelresult <- ensembler_return[3]
modelresult
#### Performance comparison #####
act_mybar <- qplot(testpreddata$actual_label, geom="bar")
act_mybar
pred_mybar <- qplot(testpreddata$predictions, geom='bar')
pred_mybar
act_tbl <- tableGrob(t(summary(testpreddata$actual_label)))
pred_tbl <- tableGrob(t(summary(testpreddata$predictions)))
ggsave("testdata_actual_vs_predicted_chart.pdf",grid.arrange(act_tbl, pred_tbl))
ggsave("testdata_actual_vs_predicted_plot.pdf",grid.arrange(act_mybar, pred_mybar))
#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])
table(unseenpreddata$unseenpreddata)
# unseen data actual
table(unseen_new_data_testing$Type)


############### Regression ###########################

# testing house price

house_price <- read.csv(file = './data/regression/house_price_data.csv')
unseen_new_data_testing_house_price <- house_price[250:414,]
write.csv(unseen_new_data_testing_house_price, 'unseen_house_price_regression.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.regression(house_price[1:250,], 1, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_house_price_regression.csv'))
testpreddata <- data.frame(ensembler_return[1])


#### Performance comparison #####
modelresult <- ensembler_return[3]
modelresult
write.csv(modelresult[[1]], "performance_chart.csv")

#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])


# testing spectral data

soil_spectral <- read.csv(file = './data/regression/SOIL_SPECTRAL.csv')
unseen_new_data_testing_soil_spectral <- soil_spectral[20:26,-c(1)]
write.csv(unseen_new_data_testing_soil_spectral, 'unseen_soil_spectral_regression.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.regression(soil_spectral[1:20,-c(1)], 1, c('lm'), 'rf', 0.40, 0.30, 0.30, read.csv('./unseen_soil_spectral_regression.csv'))
testpreddata <- data.frame(ensembler_return[1])


#### Performance comparison #####
modelresult <- ensembler_return[3]
modelresult
write.csv(modelresult[[1]], "performance_chart.csv")

#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])


# testing servo (high dimensional data)

servo <- read.csv(file = './data/regression/Servo.csv')
unseen_new_data_testing_servo <- servo[137:167,]
write.csv(unseen_new_data_testing_servo, 'unseen_servo_regression.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.regression(servo[1:137,], 5, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_servo_regression.csv'))
testpreddata <- data.frame(ensembler_return[1])


#### Performance comparison #####
modelresult <- ensembler_return[3]
modelresult
write.csv(modelresult[[1]], "performance_chart.csv")

#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])



#### testing FW, DW phenotype dataset


FW_DW_DATA <- read.csv(file = './data/regression/high_dim_data.csv')
unseen_new_data_testing_FW_DW <- FW_DW_DATA[240:280,-c(1)]
write.csv(unseen_new_data_testing_FW_DW, 'unseen_FW_DW_regression.csv', fileEncoding = 'UTF-8', row.names = F)
ensembler_return <- ensembler.regression(FW_DW_DATA[1:240,-c(1)], 3, c('treebag','rpart'), 'gbm', 0.60, 0.20, 0.20, read.csv('./unseen_FW_DW_regression.csv'))
testpreddata <- data.frame(ensembler_return[1])



#### Performance comparison #####
modelresult <- ensembler_return[3]
modelresult
write.csv(modelresult[[1]], "performance_chart.csv")

#### unseen data ###
unseenpreddata <- data.frame(ensembler_return[4])


