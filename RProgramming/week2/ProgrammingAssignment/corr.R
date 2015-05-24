corr <- function(directory, threshold = 0) {
  files <- list.files(path = directory);
  x <- c();
  for (f in files) {
    data <- read.csv(file.path(directory, f));
    g = complete.cases(data);
    if (sum(g) <= threshold) {
      next;
    }
    data = data[g,];
    c <- cor(data$sulfate, data$nitrate);
    x <- c(x, c);
  }
  x
}

# cr <- corr("specdata", 150);
# print(head(cr));
# cr <- corr("specdata", 400);
# print(head(cr));