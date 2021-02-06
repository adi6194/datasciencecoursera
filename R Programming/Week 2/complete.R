#Method 1 - Save to df and append dfs into one.
complete <- function(directory, id = 1:332){
  lst <- list()
  final <- data.frame()
  for(monitor in id){
    
    path <- paste0(getwd(), "/", directory, "/", sprintf("%03d",monitor),".csv")
    monitor_cases <- read.csv(path)
    
    nobs <- sum(complete.cases(monitor_cases))
    x <- data.frame(id=monitor,nobs=nobs)

    final <- rbind(final,x)
  }
  print(final)
  #Optional
  write.csv(final, paste0(getwd(), "/final.csv"),row.names = F)
}
complete("specdata")

# Method 2 - Save to list and convert to df (Less resource intensive)
complete <- function(directory, id = 1:332){
  lst <- list()
  final <- data.frame()
  for(monitor in id){
    
    path <- paste0(getwd(), "/", directory, "/", sprintf("%03d",monitor),".csv")
    monitor_cases <- read.csv(path)
    
    nobs <- sum(complete.cases(monitor_cases))
    lst[[monitor]] <- c(id = monitor, nobs = nobs)
  }
  final <- do.call(rbind,lst)
  print(final)
  
  #Optional
  write.csv(final, paste0(getwd(), "/final.csv"),row.names = F)
}
complete("specdata")