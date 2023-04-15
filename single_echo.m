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

% 设计单回声滤波器
fs = 44100;
d = 0.2;     % 回声延迟时间
a = 0.8;     % 回声衰减系数
h = [1 zeros(1,round(d*fs)-1) a];
y_echo = filter(h, 1, y);
filename3 = 'D://matlab production/output/singal_echo/singal_echo.wav';
audiowrite(filename3, y_echo, fs);

% 绘制单回声滤波器的效果


plot(y_echo);
title('单回声滤波器效果');
xlabel('采样点');
ylabel('幅度');
grid on;