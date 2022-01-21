sigma=1;
sigma2=1.2;
sigma3=1.4;
sigma4=1.6;
sigma5=1.8;
sigma6=2.0;
x=-12:0.1:12;
s = normpdf(x,0,1);
y = exp(-x.^2/(2*sigma^2))/(sqrt(2*pi)*sigma);
y2 = exp(-x.^2/(2*sigma2^2))/(sqrt(2*pi)*sigma2);
y3 = exp(-x.^2/(2*sigma3^2))/(sqrt(2*pi)*sigma3);
y4 = exp(-x.^2/(2*sigma4^2))/(sqrt(2*pi)*sigma4);
y5 = exp(-x.^2/(2*sigma5^2))/(sqrt(2*pi)*sigma5);
y6 = exp(-x.^2/(2*sigma6^2))/(sqrt(2*pi)*sigma6);
z1 = (y2-y)/(sigma2-sigma);
z2 = (y3-y)/(sigma3-sigma);
z3 = (y4-y)/(sigma4-sigma);
z4 = (y5-y)/(sigma5-sigma);
z5 = (y6-y)/(sigma6-sigma);
z = diff(y);
a = -12:0.1:11.9;
w = diff(z);
b = -12:0.1:11.8;
subplot(611),
plot(b,w);
subplot(612),
plot(x,z1);
subplot(613),
plot(x,z2);
subplot(614),
plot(x,z3);
subplot(615),
plot(x,z4);
subplot(616),
plot(x,z5);