clear;
clf;

dt=0.0001;

t1=0:dt:0.317;
t2=0.317+dt:dt:1.2;

a=0.00008047;
b=-20.53376;
c=459.9165;
d=-3724.726;
e=12843.73;
f=-15744.46;
y1=a+b*t1+c*t1^2+d*t1^3+e*t1^4+f*t1^5;


a1=-0.0057107;
b1=3.9058;
c1=7.5344;
y2=a1+b1*exp(-c1*t2);
t=[t1 t2];
y=[y1 y2];
//plot(t,y);

t3 = 0 : dt : 0.1335;
t4 = 0.1335 + dt : dt : 1.2;

rt=zeros(1:length(t3));
f = 444;
x = 0.25*cos(2*%pi*f*t4)+0.2*cos(4*%pi*f*t4)+0.2*cos(6*%pi*f*t4);

w = rand(x,"normal");

r = x + w;

rtf=[rt r];

z = y.*rtf;
plot(t,z);
sound(z);

xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("low hat sound","fontsize",4);


wavwrite(z,"low hat.wav");
