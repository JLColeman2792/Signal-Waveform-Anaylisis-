%---
%--- display the Bluebird Whistle Waveform
%---
[xx,Fs] = audioread('bluebird.wav');
xmax = max(abs(xx));
%
blowup = 1;  %- 0=FALSE, 1=TRUE
if blowup
   font_size = 24; line_width = 4; dot_size = 40; axis_font = 18;
else
   font_size = 14; line_width = 2; dot_size = 20; axis_font = 14;
end  
Fs   %- echo the value of Fs, it should be 11025
Freq = 800;   %- This is approximate 
figure(1), clf reset
jkl = 11025 + (1:1104);
tt = (jkl-1)/(Fs);
subplot('Position',[0.1 0.57 0.8 0.35])
hp = plot(tt,xx(jkl)),grid on
set(hp,'LineWidth',line_width)
title('BLUEBIRD WHISTLE','FontSize',font_size)
xlabel('time (t) in seconds','FontSize',font_size)
axis([tt(1),tt(length(tt)),1.1*xmax*[-1,1] ])
set(gca,'FontSize',axis_font)
%
figure(2), clf reset
jkl = 11025 + (0:round(7.7*Fs/Freq));
tt = 1000*jkl/Fs;
subplot('Position',[0.1 0.57 0.8 0.35])
hp = plot(tt,xx(jkl)),grid on
set(hp,'LineWidth',line_width)
title('BLUEBIRD WHISTLE','FontSize',font_size)
xlabel('time (t) in milliseconds','FontSize',font_size)
axis([tt(1),tt(length(tt)),1.1*xmax*[-1,1] ])
set(gca,'FontSize',axis_font)
%
jkl = 11025 + (0:round(2.2*Fs/Freq));
tt = 1000*jkl/Fs;
subplot('Position',[0.1 0.07 0.8 0.35])

hold on, plot(tt,xx(jkl),'--'), grid on, hold off
title('ZOOM in on TWO PERIODS (approx)','FontSize',font_size)
xlabel('time (t) in milliseconds','FontSize',font_size)
axis([tt(1),tt(length(tt)),1.1*xmax*[-1,1] ])
set(gca,'FontSize',axis_font)