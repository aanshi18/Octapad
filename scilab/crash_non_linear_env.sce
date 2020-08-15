clear;
clf;
function y= pulse(t)
    N = length(t);
    a = 1;
    cnt = 0;
    y = zeros(1:N);
    for i = 1 : N
        if cnt < 0.001
            y(i) = a;
            cnt = cnt + 0.00001;
        else
            a = -a;
            cnt = 0;
        end
    end
endfunction
dt = 0.0001;

t=0.0660+dt:dt:2;
//0.98 to 0;
a=0.02200693;
b=1.270352;
c=4.227273;
y=a+b*exp(-c*t);

t1=0:dt:0.0660;
c1=-421.609;
a1=285.93;
m1=-3.55301;
b1=-0.0253805;
y1=c1*t1^3+a1*t1^2+m1*t1+b1;

t2=[t1 t];
zyy=[y1 y];

t5 = 0 : dt : 2;
t6=0:dt:0.046;
rt=zeros(1:length(t6));
f = 444;
x = 0.25*cos(2*%pi*f*t5);

w = rand(x,"normal");

r = x + w;

rtf=[rt r];

t3 = 0 : dt : 2;
yy = pulse(t3)+x+r;
z = zyy.*yy;

dsz = z(1:4:length(z));
zf = dsz(1:1/4:length(dsz));
//plot(t3,z);
//sound(z);

plot(t3,zf);
sound(zf);
xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("Crash Sound","fontsize",4);
