x = rnorm(100)
y = rnorm(100)
# plot(x, y)
# plot(x, y, xlab='This is x-axis', ylab='This is y-axis', main='plot of X VS Y')

pdf("Figure.pdf")
plot(x, y, col="green")
dev.off()

x = 1:10
print(x)
x = seq(1, 10)
print(x)
x = seq(-pi, pi, length=50)
# Contour
y = x
f = outer(x, y, function(x, y)cos(y)/(1+x^2))
contour(x, y, f)
contour(x, y, f, nlevels=45, add=T)
fa = (f-t(f))/2
contour(x, y, fa, nlevels=15)

image(x, y, fa)
persp(x, y, fa)
persp(x, y, fa, theta=30)
persp(x, y, fa, theta=30, phi=20)
persp(x, y, fa, theta=30, phi=70)
persp(x, y, fa, theta=30, phi=40)
