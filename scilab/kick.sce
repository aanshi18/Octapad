clear;
clf;
function y= pulse(t)
    N = length(t);
    y = zeros(1,N);
    for i = 1 : N/6
        y(i) = 0.9*(t(i)-t(1))/(N/6-t(1));
    end
    for i = N/6 + 1: 2*N/6
        y(i) = 0.9; 
    end
    for i = 2*N/6+1 : 4*N/6
        y(i) = (-5.4*t(i))+1.8;
    end
    for i = 4*N/6 + 1: 5*N/6
        y(i) = -0.9; 
    end
    for i = 5*N/6+1 : 6*N/6
        y(i) = (5.4*t(i))-5.4;
    end
  // plot2d3(t,y); 
endfunction

dt=0.0001;

t=0:dt:2;
t1=0:dt:0.023;
y1=41.826086956522*t1;
t2=0.023+dt:dt:0.088;
t3=0.088+dt:dt:0.318;
t4=0.318+dt:dt:0.972;
t5=0.972+dt:dt:2;
y2=0.076923076923077*t2+0.96023076923077;
y3=-2.834347826087*t3+1.2164226086957;
y4=-0.36865443425077*t4+0.43233211009174;
y5=-0.11783439490446*t5+0.18853503184713;

y=[y1 y2 y3 y4 y5];

t6 = 0.75 +dt: dt : 2;
f = 5;
y6 = 0.6*sin(2*%pi*f*t6);
//plot(t6,y6);

t7 = 0 : dt : 0.0400;
t8 = 0.0400+dt: dt : 0.1;
t9 = 0.1+dt : dt : 0.18;
t10 = 0.18+dt : dt : 0.28;
t11 = 0.28+dt : dt : 0.42;
t12 = 0.42+dt : dt : 0.6;
t13 = 0.6+dt : dt : 0.75;

x1 = pulse(t7);
x2 = pulse(t8);
x3 = pulse(t9);
x4 = pulse(t10);
x5 = pulse(t11);
x6 = pulse(t12);
x7 = pulse(t13);

x = [x1 x2 x3 x4 x5 x6 x7];
t14 = [t7 t8 t9 t10 t11 t12 t13];

y7 = [x y6];
t15 = [t14 t6];

//plot(t,y7);

y8 = y7.*y;

plot2d3(t,y8);
sound(y8);

xlabel("tX(10^-4)seconds","fontsize",4);
ylabel("amplitude","fontsize",4);
title("kick sound","fontsize",4);

wavwrite(y8,"kick.wav");






