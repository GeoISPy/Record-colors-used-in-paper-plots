function colorPalette = getColorPalette(index)
% GETCOLORPALETTE 根据序号从文件中获取已保存的RGB调色板。
%
% 输入:
%   index: 想要获取的调色板的序号 (正整数)。
%
% 输出:
%   colorPalette: N x 3 的 RGB 矩阵，范围为 0 到 1。
%
% 如果找不到文件或序号，则返回空矩阵并报错。

% 定义数据文件路径
dataFileName = 'customColorPalettes.mat';

if ~exist(dataFileName, 'file')
    error('getColorPalette:FileNotFound', '数据文件 "%s" 不存在。请先运行 addNewColorPalette 函数添加颜色。', dataFileName);
end

% 加载数据
data = load(dataFileName);
colorPalettes = data.colorPalettes;

% 查找匹配的序号
paletteFound = false;
colorPalette = [];

for k = 1:length(colorPalettes)
    if colorPalettes(k).index == index
        colorPalette = colorPalettes(k).rgb_0_1;
        paletteFound = true;
        break;
    end
end

if ~paletteFound
    error('getColorPalette:IndexNotFound', '找不到序号为 %d 的颜色调色板。当前最大序号为 %d。', index, data.lastIndex);
end

end