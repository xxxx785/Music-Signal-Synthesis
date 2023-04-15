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

% 对音频信号进行FFT分析
N = length(y);        % 信号长度
f = (0:N-1)*(fs/N);   % 频率范围
Y = fft(y);
P = abs(Y).^2/N; % 功率谱密度
P(2:end-1) = 2*P(2:end-1);

% 绘制FFT图像

semilogx(f,P);
title('音频信号FFT分析');
xlabel('频率(Hz)');
ylabel('功率谱密度');
grid on;