close all;

 figure(1);
 subplot(211);
 plot(t,x,'r',t,sin(4.17*t),'b');
 xlabel('time(s)');ylabel('x  tracking');
 subplot(212);
 plot(t,y,'r',t,0.7*sin(5.67*t),'b');
 xlabel('time(s)');ylabel('y  tracking');

% figure(2);
% % subplot(211);
% plot(t,y,'r',t,1.2*sin(1.5*t),'b' );
% xlabel('time(s)');ylabel('y position tracking');
% % subplot(212);
% % plot(t,dx2,'r',t,1.2*1.5*cos(1.5*t),'b' );
% % xlabel('time(s)');ylabel('y speed tracking');



figure(2);
subplot(221);
plot(t,e3,'r' );
xlabel('time(s)');ylabel('x  tracking error');
subplot(222);
plot(t,e4,'r' );
xlabel('time(s)');ylabel('y  tracking error');


figure(3);
subplot(321);
plot(t,s1,'r' );
subplot(322);
plot(t,s2,'r' );

%figure(4);
%subplot(421);
%plot(t,o2,'r' );
%subplot(422);
%plot(t,o3,'r' );


