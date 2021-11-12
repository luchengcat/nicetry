function [sys,x0,str,ts] = chap7_1plant(t,x,u,flag)


global A B
dxx=0.01;
dxy=0.002;
dyy=0.01;
wxx_2=355.3;
wxy=70.99;
wyy_2=532.9;
omiga=0.1;   %100rad/s

A=[0 1 0 0;
    -wxx_2 -dxx -wxy -(dxy-2*omiga);
    0 0 0 1;
    -wxy -(dxy+2*omiga) -wyy_2 -dyy];

B=[0 0;1 0;0 0;0 1];

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

sizes = simsizes;

sizes.NumContStates  = 4;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   % at least one sample time is needed

sys = simsizes(sizes);


x0  = [0.1 0 0.1 0]';

str = [];

ts  = [0 0];

function sys=mdlDerivatives(t,x,u)
global A B

tol=[u(1);u(2)];
q=[x(1);x(2);x(3);x(4)];
d=[0;rand(1);0;rand(1)];
dq=A*q+B*(tol)+d;


sys(1)= dq(1);
sys(2)= dq(2);
sys(3)= dq(3);
sys(4)= dq(4);


function sys=mdlOutputs(t,x,u)
sys(1) = x(1);
sys(2) = x(2);
sys(3) = x(3);
sys(4) = x(4);
