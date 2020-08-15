clear;
clf;
dt=0.0001;

t1=0:dt:0.245;
a=-0.000016;
b=186.7168;
c=-3682.684;
d=26348.78;
e=-81213.64;
f=91903.73;
y1=a+b*t1+c*t1^2+d*t1^3+e*t1^4+f*t1^5;

t2=0.2450+dt:dt:1.5;
a1=0.028235;
//a1 = -0.26618
b1=1.53787;
//b1 = 2.5896;
c1=4.19614;
//c1 = 4.3281;
y2=a1+b1*exp(-c1*t2);


t=[t1 t2];
y=[y1 y2];
//plot(t,y);

t3 = 0 : dt : 0.1380;
t4 = 0.1380 + dt : dt : 1.5;

rt=zeros(1:length(t3));
f = 33;
//x = 0.5*sin(2*%pi*f*t4)+0.25*sin(4*%pi*f*t4)+0.125*sin(8*%pi*f*t4);
x = 10*sin(2*%pi*f*t4)+5*sin(1*%pi*2*f*t4)+2*sin(2*%pi*3*f*t4)+sin(2*%pi*4*f*t4)+0.5*sin(2*%pi*5*f*t4);
w = rand(x,"normal");

r = x + w;

rtf=[rt x];

z = y.*rtf;
plot(t,z);
sound(z);

xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("tom Sound","fontsize",4);

wavwrite(z,"tom.wav");
