clear;
clf;

dt = 0.001;

t=0.0660+dt:dt:2.3;
//0.98 to 0;
a=0.02200693;
b=1.270352;
c=4.227273;
y=a+b*exp(-c*t);

x1=0:dt:0.0660;
c1=-421.609;
a1=285.93;
m1=-3.55301;
b1=-0.0253805;
y1=c1*x1^3+a1*x1^2+m1*x1+b1;

t2=[x1 t];
zyy=[y1 y];

t5 = 0.046+dt : dt : 2.3;
t6=0:dt:0.046;
rt=zeros(1:length(t6));
f = 444;
x = 0.25*cos(2*%pi*f*t5)+0.2*cos(4*%pi*f*t5)+0.2*cos(6*%pi*f*t5);

w = rand(x,"normal");

r = x + w;

rtf=[rt r];
c = ffilt("bp",100,1,10000);
[hm,fr] = frmag(c,1,100);
zi = filter(c,1,r);
//plot(t5,zi);
//sound(zi);

z = zyy.*rtf;
plot(t2,z);
sound(z);

xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("snare sound","fontsize",4);

wavwrite(z,"snare.wav");
