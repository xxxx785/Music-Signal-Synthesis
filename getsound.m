% 采样率为44100Hz，采样时长为5秒
fs = 44100; 
t = 0:1/fs:15; 

% 录制音频信号
recObj = audiorecorder(fs, 16, 1);
disp('开始录音...');
recordblocking(recObj, 15);
disp('录音结束.');
% 获取音频信号和采样率
y = getaudiodata(recObj);
filename1 = 'D:\\matlab production\input\recorded_audio4.wav';
if ~exist(fileparts(filename1), 'dir')
    mkdir(fileparts(filename1));
end
audiowrite(filename1, y, fs);