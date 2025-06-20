ptu <- c("qqplotr", "ggridges", "gridExtra")
IP <- setdiff(ptu, row.names(installed.packages()))
if(length(IP) > 0) {for(el in IP) {install.packages(el)}}
lapply(X = ptu, FUN = library, character.only = TRUE)



#           Задача 1 - Ежедневни инциденти с мотоциклети
#       Шотландският изпълнителен директор в отдел "Аналитични услуги" на Транспортна 
#   статистика събира данни за произшествията с мотоциклети. В таблицата по-долу са 
#   представени, броят на инцидентите с мотоциклети в Шотландия по пътища с ограничение 
#   до 30 и над 30 мили в час, случили се по дни от седмицата.



Day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
Built_up <- c(88, 100, 76, 98, 103, 85, 69)
Non_built_up <- c(70, 58, 59, 53, 56, 94, 102)

accidentsDf = data.frame(Day,Built_up,Non_built_up)


#   а. Каква е средната стойност и медианата на броя на произшествията за двата вида пътища

mean(accidentsDf$Built_up)
mean(accidentsDf$Non_built_up)

median(accidentsDf$Built_up)
median(accidentsDf$Non_built_up)



#   б. Каква е формата на разпределението по различните пътища. Интересува ни само модалността
#???
summary(accidentsDf$Built_up)
summary(accidentsDf$Non_built_up)


#           Задача 2 - Инвестиции в акциите "LMT" и "FB"
Date <- c('2015-09', '2015-10', '2015-11', '2015-12', '2016-01', '2016-02', '2016-03', '2016-04', 
          '2016-05', '2016-06', '2016-07', '2016-08', '2016-09', '2016-10', '2016-11', '2016-12', 
          '2017-01', '2017-02', '2017-03', '2017-04', '2017-05', '2017-06', '2017-07', '2017-08', 
          '2017-09', '2017-10', '2017-11', '2017-12', '2018-01', '2018-02', '2018-03', '2018-04', 
          '2018-05', '2018-06', '2018-07', '2018-08', '2018-09')
FB <- c(89.9, 101.97, 104.24, 
        104.66, 112.21, 106.92, 114.1, 117.58, 118.81, 114.28, 123.94, 126.12, 128.27, 130.99, 
        118.42, 115.05, 130.32, 135.54, 142.05, 150.25, 151.46, 150.98, 169.25, 171.97, 170.87, 
        180.06, 177.18, 176.46, 186.89, 178.32, 159.79, 172, 191.78, 194.32, 172.58, 175.73, 
        164.46)
LMT <- c(207.31, 219.83, 219.16, 217.15, 211, 215.79, 221.5, 232.38, 236.23, 248.17, 252.73, 
         242.97, 239.72, 246.38, 265.25, 249.94, 251.33, 266.58, 267.6, 269.45, 281.13, 277.61, 
         292.13, 305.39, 310.29, 308.16, 319.12, 321.05, 354.85, 352.44, 337.93, 320.84, 314.54, 
         295.43, 326.1, 320.41, 345.96)
stocksDF <- data.frame(Date, LMT, FB)

#       Анализът трябва да се извърши върху възвръщаемостите на цените, получени по diff(log(x)),
#   където "x" е цената на актива

#   а. Какви са средните стойности и медианите. Според вас как се интерпретират тези числа

mean(diff(log(stocksDF$FB)))
mean(diff(log(stocksDF$LMT)))

median(diff(log(stocksDF$FB)))
median(diff(log(stocksDF$LMT)))

#   б. Можете ли да кажете в кой актив бихте инвестирали при наличието само на тази информация

#if we want stability then we choose the one with higher median and lower volatility
