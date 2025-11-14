function colorPalette = addNewColorPalette(newRgbColors_0_255)
% ADDNEWCOLORPALETTE 接收一组RGB颜色（0-255），保存到'customColorPalettes.mat'，并生成图示。
%
% 输入:
%   newRgbColors_0_255: 一个 N x 3 矩阵，其中 N 是颜色数量 (2 <= N <= 10)，
%                       每行包含 [R G B] 值，范围为 0 到 255。
%
% 输出:
%   colorPalette: 转换后的 N x 3 RGB 矩阵，范围为 0 到 1。

% --- 1. 参数校验和初始化 ---
if nargin ~= 1
    error('addNewColorPalette:InputError', '函数需要一个输入参数：一个 N x 3 的RGB颜色矩阵。');
end

[N, M] = size(newRgbColors_0_255);
if M ~= 3 || N < 2 || N > 10
    error('addNewColorPalette:InputError', '输入必须是 2 到 10 行，3 列的矩阵 ([R G B])。');
end
if any(newRgbColors_0_255 < 0, 'all') || any(newRgbColors_0_255 > 255, 'all') || ~isreal(newRgbColors_0_255)
    error('addNewColorPalette:InputError', 'RGB值必须是 0 到 255 之间的实数。');
end

% 定义数据文件路径
dataFileName = 'customColorPalettes.mat';

% --- 2. 加载或初始化数据 ---
if exist(dataFileName, 'file')
    data = load(dataFileName);
    colorPalettes = data.colorPalettes;
    lastIndex = data.lastIndex;
else
    % 初始化结构体数组和序号
    colorPalettes = struct('index', {}, 'rgb_0_255', {}, 'rgb_0_1', {});
    lastIndex = 0;
end

% --- 3. 检查是否已存在相同调色板 ---
% 查找是否存在完全一致的 RGB 序列
duplicateIdx = [];
if ~isempty(colorPalettes)
    duplicateIdx = find(arrayfun(@(p) isequal(p.rgb_0_255, newRgbColors_0_255), colorPalettes), 1);
end

if ~isempty(duplicateIdx)
    existingPalette = colorPalettes(duplicateIdx);
    colorPalette = existingPalette.rgb_0_1;
    fprintf('输入的颜色矩阵已存在，序号: %d。跳过新增操作。\n', existingPalette.index);
    return;
end

% --- 4. 颜色转换和数据存储 ---
% 将 [0-255] 转换为 [0-1]
colorPalette = double(newRgbColors_0_255) / 255;
newIndex = lastIndex + 1;

% 创建新的调色板数据结构
newPalette.index = newIndex;
newPalette.rgb_0_255 = newRgbColors_0_255;
newPalette.rgb_0_1 = colorPalette;

% 添加到结构体数组
colorPalettes(end+1) = newPalette;

% 更新最新的序号
lastIndex = newIndex;

% 保存到 .mat 文件
save(dataFileName, 'colorPalettes', 'lastIndex');

fprintf('成功添加新的颜色数组！\n');
fprintf('序号: %d\n', newIndex);

% --- 5. 生成图示 (Figure) ---
fig = figure('Name', ['新增颜色序号: ', num2str(newIndex)], 'Position', [100 100 800 600]);

% (a) 绘制线图
subplot('position', [0.1 0.4 0.85 0.5]);
x = 1:8; % 固定为8个x点以便展示连续样式

% 逐个颜色绘制线段，每条线使用独立随机的Y向量
hold on;
for k = 1:N
    % 为每条颜色生成一个独立随机y序列（长度8），并加上小偏移以区分
    rng('shuffle'); % 使每次调用随机性更好（可改为固定seed以复现）
    yvals = 1 + 0.5 * (2 * rand(1, 8) - 1) + 0.02 * (k - N/2);
    plot(x, yvals, '-o', ...
         'Color', colorPalette(k,:), ...
         'LineWidth', 4, 'MarkerSize', 8, ...
         'DisplayName', ['Color ', num2str(k)]);
end
hold off;

title(['\fontname{宋体}序号 ', num2str(newIndex), ' \fontname{宋体}的颜色调色板效果图 (N=', num2str(N), ')'], 'FontName', 'Times New Roman', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0.8 8.2]);
ylim([0 3.2]);
xticks(1:8)
xlabel('Xlabel');
ylabel('Ylabel');
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10, 'FontWeight', 'bold', 'Box', 'on');
grid('on')

% (b) 绘制色块和信息
subplot('position', [0.1 0.05 0.85 0.3]);
ax = gca;
ax.Visible = 'off'; % 隐藏轴
axis([0 1 0 1]);
hold on;

yPos = 0.25;
blockWidth = 1/N ; % 色块宽度
startPos = (1 - N * blockWidth) / 2; % 居中起始位置

text(0.5, 0.8, ['\fontname{宋体}调色板序号: ', num2str(newIndex)], 'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');

for k = 1:N
    xBlock = startPos + (k-1) * blockWidth;

    % 绘制色块（使用坐标轴单位，确保与文本一致）
    rectangle('Position', [xBlock, yPos, blockWidth*0.9, 0.5], ...
              'FaceColor', colorPalette(k,:), 'EdgeColor', 'none', 'LineWidth', 1, ...
              'Parent', ax);

    % 添加序号和RGB值
    rgb255Str = sprintf('[%d %d %d]', newRgbColors_0_255(k, 1), newRgbColors_0_255(k, 2), newRgbColors_0_255(k, 3));
    text(xBlock+blockWidth*0.45, yPos - 0.1, ...
         {['\fontname{宋体}颜色: ', num2str(k)], rgb255Str}, ...
         'HorizontalAlignment', 'center', 'FontSize', 10,'FontName', 'Times New Roman', 'FontWeight', 'bold');
end
set(gca, 'FontName', 'Times New Roman', 'FontSize', 10);

% --- 6. 保存图像到 Multi_Color_Map 文件夹 ---
currentFunctionPath = mfilename('fullpath');
if isempty(currentFunctionPath)
    currentDir = pwd;
else
    currentDir = fileparts(currentFunctionPath);
end

outputDir = fullfile(currentDir, 'Multi_Color_Map');
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

outputFileName = sprintf('序号%d_%d个颜色.png', newIndex, N);
saveas(fig, fullfile(outputDir, outputFileName));

end
