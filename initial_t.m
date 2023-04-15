% 采样率为44100Hz，采样时长为5秒
fs = 44100; 
hObject = findobj('Tag', 'pushbutton1');
handles = guidata(hObject);
% 从 handles 结构体中获取音频文件路径
audioFilePath = handles.audioFilePath;
% 读取音频文件
[y,fs] = audioread(audioFilePath);
% 计算时间范围
t = linspace(0, length(y)/fs, length(y));

% 绘制音频信号波形图
plot(t, y);
title('原始音频信号');
xlabel('时间 (s)');
ylabel('幅度');
grid on;
