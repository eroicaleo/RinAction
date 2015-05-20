x <- 10;
if (x > 3) {
  y <- 10;
} else {
  y <- 0;
}
print(x);

x <- -1;
y <- if (x > 3) {
  10
} else {
  0
}
print(x);

for (i in 1:10) {
  print(i);
}

x <- c("a", "b", "c", "d");
for (i in 1:4) {
  print(x[i]);
}

for (i in seq_along(x)) {
  print(x[i]);
}

for (letter in x) {
  print(letter);
}

m <- matrix(1:6, 2, 3);
for (i in seq_len(nrow(m))) {
  for (j in seq_len(ncol(m))) {
    print(m[i, j]);
  }
}

count <- 0;
while (count < 10) {
  print(count);
  count <- count + 1;
}

