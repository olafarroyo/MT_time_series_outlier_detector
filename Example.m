clear 
close all

load Example.mat

% Ex=Ex';
% Ey=Ey';
% Hx=Hx';
% Hy=Hy';
S=[Ex,Ey,Hx,Hy];
%Define factors Fm
F=[4,4,4,4];

%Perform outlier detection
non_outliers_indices = tolerance_ellipse(S,F,1);


%FIGURES

% Comparison plots (to evaluate factors)

figure

subplot(1,2,1),plot(Ex,Ey,'.','color',[0.5,0.5,0.5]),hold on
subplot(1,2,1),plot(Ex(non_outliers_indices),Ey(non_outliers_indices),'.r'),grid on
xlabel('Ex'),ylabel('Ey')

subplot(1,2,2),plot(Hx,Hy,'.','color',[0.5,0.5,0.5]),hold on
subplot(1,2,2),plot(Hx(non_outliers_indices),Hy(non_outliers_indices),'.r'),grid on
xlabel('Hx'),ylabel('Hy')

axis equal


%Time series plot


lx=1:1:length(Ex);
lx_noi=lx(non_outliers_indices);
figure

subplot(4,1,1),plot(Ex,'color',[0.5,0.5,0.5]),hold on
subplot(4,1,1),plot(lx_noi,Ex(non_outliers_indices),'r'),hold on
ylim([-1 1]),xlim([0 length(Ex)])

subplot(4,1,2),plot(Ey,'color',[0.5,0.5,0.5]),hold on
subplot(4,1,2),plot(lx_noi,Ey(non_outliers_indices),'r'),hold on
ylim([-1 1]),xlim([0 length(Ex)])

subplot(4,1,3),plot(Hx,'color',[0.5,0.5,0.5]),hold on
subplot(4,1,3),plot(lx_noi,Hx(non_outliers_indices),'r'),hold on
ylim([-25 25]),xlim([0 length(Ex)])

subplot(4,1,4),plot(Hy,'color',[0.5,0.5,0.5]),hold on
subplot(4,1,4),plot(lx_noi,Hy(non_outliers_indices),'r'),hold on
ylim([-25 25]),xlim([0 length(Ex)])
