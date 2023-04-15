% 采样率为44100Hz，采样时长为15秒
fs = 44100; 
t = 0:1/fs:15; 
% 读取音频文件
hObject = findobj('Tag', 'pushbutton1');
handles = guidata(hObject);
% 从 handles 结构体中获取音频文件路径
audioFilePath = handles.audioFilePath;
% 读取音频文件
[y,fs] = audioread(audioFilePath);


% 设计全通结构的混响器
fs = 44100;
N = round(fs*1.5);   % 混响器的冲激响应长度
g = 0.8;           % 混响器增益
a = 0.7;           % 混响器反馈系数
b = sqrt(1-a^2);   % 混响器前馈系数
h = zeros(1,N);
h(1) = 1;
for n = 2:N
    h(n) = -a*h(n-1);
end
h(N/2+1:end) = [];
h = [h fliplr(h)];
h = b * h;
y_reverb = filter(h, 1, y);

% 保存带有混响效果的音频文件
filename = 'D://matlab production/output/recorded_audio/reverb.wav';
audiowrite(filename, g*y_reverb, fs);

% 绘制混响器效果
plot(y_reverb);
title('混响器效果');
xlabel('采样点');
ylabel('幅度');
grid on;
