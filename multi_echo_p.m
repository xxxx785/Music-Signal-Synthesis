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

% 设计多重回声滤波器
fs = 44100;
d1 = 0.05;   % 第1个回声延迟时间
a1 = 0.8;    % 第1个回声衰减系数
d2 = 0.1;    % 第2个回声延迟时间
a2 = 0.6;    % 第2个回声衰减系数
d3 = 0.2;    % 第3个回声延迟时间
a3 = 0.4;    % 第3个回声衰减系数
h1 = [1 zeros(1,round(d1*fs)-1) a1 zeros(1,round(d2*fs)-1) a2 zeros(1,round(d3*fs)-1) a3];
h2 = [1 zeros(1,round(d2*fs)-1) a2 zeros(1,round(d3*fs)-1) a3 zeros(1,round(d1*fs)-1) a1];
h3 = [1 zeros(1,round(d3*fs)-1) a3 zeros(1,round(d1*fs)-1) a1 zeros(1,round(d2*fs)-1) a2];
y_echo = filter(h1, 1, y) + filter(h2, 1, y) + filter(h3, 1, y);

% 保存带有多重回声的音频文件
filename = 'D://matlab production/output/multi_echo/multi_echo.wav';
audiowrite(filename, y_echo, fs);

% 绘制多重回声滤波器的效果
Y_echo = fft(y_echo);
n = length(Y_echo);
amplitude = abs(Y_echo)/n*2;
f = (0:n-1)*(fs/n);

% 绘制频域图像
plot(f(1:floor(n/2)), amplitude(1:floor(n/2)));
title('多重回声滤波器效果的频域图像');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
hold on;
