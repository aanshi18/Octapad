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
t1 = 0 : dt : 0.7000;

//a1 = 0.00000524;
//b1 = 33.1968;
//c1 = -216.738;
//d1 = 462.5254;
//e1 = -320.5478;
a1 = 235.9657;
b1 = -2201.459;
c1 = 8108.795;
d1 = -14753.59;
e1 = 13277.55;
f1 = -4732.022;

y1 = a1 + b1*t1 + c1*t1^2 + d1*t1^3 + e1*t1^4 + f1*t1^5;
//plot(t1,y1);

t2 = 0.7000+dt : dt : 5;

//a = 0.50015;
//b = -0.39261;
//c = 0.1459;
//d = -0.02495;
//e = 0.00155;
a = 1.01643;
b = -1.39373;
c = 0.839306;
d = -0.24220;
e = 0.03282;
f = -0.001679

y2= a+ b*t2 + c*t2^2 + d*t2^3 + e*t2^4 + f*t2^5;
//plot(t2,y2);
//t3 = 6.4890+dt : dt : 8.9225;
///3 =-0.0086295;
//b3 =0.0869971;
//y3 = a3*t3 + b3;

y4= [y1 y2];
t4 = [t1 t2 ];
//plot(t4,y4);

t5 = 0 : dt : 0.4080;
t6 = 0.4080 + dt : dt : 5;

rt=zeros(1:length(t5));
f = 444;
x = 0.35*cos(2*%pi*f*t6);

w = rand(x,"normal");

r = x + w;
z1 = pulse(t6)+r+x;

rtf=[rt z1];

z = y4.*rtf;
plot(t4,z);
sound(z);
xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("hi hat Sound","fontsize",4);

wavwrite(z,"hi-hat.wav");



