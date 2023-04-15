% 采样率为44100Hz，采样时长为5秒
fs = 44100; 
t = 0:1/fs:15; 

% 读取音频文件
hObject = findobj('Tag', 'pushbutton1');
handles = guidata(hObject);
% 从 handles 结构体中获取音频文件路径
audioFilePath = handles.audioFilePath;
% 读取音频文件
[y,fs] = audioread(audioFilePath);

% 计算音频信号的频域表示
Y = fft(y);
f = linspace(0,fs,length(y));
ampl = abs(Y);

% 绘制音频信号的频域表示
plot(f(1:floor(length(y)/2)), ampl(1:floor(length(y)/2)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of Audio Signal');
grid on;
