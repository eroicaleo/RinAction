complete <- function(directory, id = 1:332) {
  files <- list.files(path = directory);
  x <- c();
  for (i in id) {
    data <- read.csv(file.path(directory, files[i]));
    x <- rbind(x, c(i, sum(complete.cases(data))));
  }
  data <- as.data.frame(x);
  names(data) <- c("id", "nobs");
  data
}

# print(complete("specdata", 1));
# print(complete("specdata", c(2, 4, 8, 10, 12)));
# print(complete("specdata", 3));
# print(complete("specdata", 30:25));