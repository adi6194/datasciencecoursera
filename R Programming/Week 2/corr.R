#Method 1
corr <- function(directory, threshold = 0){
  correl <- c()
  
  filelist <- list.files(directory)
  for(i in 1:length(filelist)){
    monitor_cases <- read.csv(paste0(directory,"/",filelist[i]))
    tvals <- monitor_cases[complete.cases(monitor_cases),]
    if(sum(complete.cases(monitor_cases)) > threshold){
      correl <- c(correl,cor(tvals[,2],tvals[,3]))
    }
  }
  return(correl)
}

corr("specdata",150)
