pollutantmean <- function(directory, pollutant,id=1:332){
    final <- c()
    for (monitor in id){
        path <- paste0(getwd(), "/", directory, "/", sprintf("%03d",monitor),".csv")
        #print(path)
        monitor_data <- read.csv(path)
        #print(monitor_data)
        reqd_data <- monitor_data[,pollutant]
        #print(reqd_data)
        final <- c(final,reqd_data[!is.na(reqd_data)])
    }
    print(final)
    #mean(final)
}
