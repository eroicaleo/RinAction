pollutantmean <- function(directory, pollutant, id = 1:332) {
  files <- list.files(path = directory);
  data <- read.csv(file.path(directory, files[id[1]]));
  if (length(id) > 1) {
    for (i in id[2:length(id)]) {
      data = rbind(data, read.csv(file.path(directory, files[i])));
    }
  }
  
  x <- data[[pollutant]];
  mean(x, na.rm = TRUE)
}

# print(pollutantmean("specdata", "sulfate", 1:10));
# print(pollutantmean("specdata", "nitrate", 70:72));
# print(pollutantmean("specdata", "nitrate", 23));