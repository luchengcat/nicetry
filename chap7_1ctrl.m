 function [sys,x0,str,ts] = chap7_1ctrl(t,x,u,flag)
global D K omega


D=[dxx dxy;dxy dyy];
K=[wxx_2 wxy;wxy wyy_2];
omega=[0 -omiga;omiga 0];

switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);    
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
global  lama 
lama=[25 0;0 35];


sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0=[ -0.1252;  -0.1095];
str = [];
ts  = [0 0];

   

function sys=mdlDerivatives(t,x,u)
global delta  s1  b e de

b=0.5;




function sys=mdlOutputs(t,x,u)
global  lama  s e de  q dq  s2  D K omega delta

s2=[x(1);x(2)];
  
x1d=u(1);
dx1d=4.17*cos(4.17*t);
ddx1d=-4.17*4.17*sin(4.17*t);

x2d=u(2);
dx2d=0.7*5.67*cos(5.67*t);
ddx2d=-0.7*5.67*5.67*sin(5.67*t);


x1=u(3);
dx1=u(4);
x2=u(5);
dx2=u(6);

q=[x1;x2];
dq=[dx1;dx2];

e1=x1d-x1;
de1=dx1d-dx1;

e2=x2d-x2;
de2=dx2d-dx2;

e=[e1 e2]';
de=[de1 de2]';

ddqd=[ddx1d ddx2d]';

a=1.2;
xite=[500 0;0 500];
g=[25 0;0 32];
gama=[10 0; 0 10];
s1=de+g*e+gama*abs(e).^a.*sign(e);

s=lama*s2+s1;


ut=lama*de+ddqd+((D+2*omega)*dq+K*q)+xite*sign(s)+lama*delta+g*de+(gama*a*abs(e).^(a-1)).*de;


sys(1)=ut(1);
sys(2)=ut(2);


