function color = monoColor(varargin)
%   INPUT:
%     index: Color index number
%     isrgb: 1 - Return RGB Color value; Otherwise Hexadecimal color value
%
%   OUTPUT:
%     color: Specified color matrix  
%---------------------------------

% 色调名备注
%-----------------
%  1 #70DB93 - 海蓝       
%  2 #5C3317 - 巧克力色    
%  3 #9F5F9F - 蓝紫色      
%  4 #B5A642 - 黄铜色
%  5 #D9D919 - 亮金色      
%  6 #A67D3D - 棕色        

%  7 #8C7853 - 青铜色      
%  8 #A67D3D - 青铜色2号 
%  9 #5F9F9F - 士官服蓝色 
% 10 #D98719 - 冷铜色     
% 11 #B87333 - 铜色       
% 12 #FF7F00 - 珊瑚红     

% 13 #42426F - 紫蓝色      
% 14 #5C4033 - 深棕        
% 15 #2F4F2F - 深绿        
% 16 #4A766E - 深铜绿色    
% 17 #4F4F2F - 深橄榄绿    
% 18 #9932CD - 深兰花色    

% 19 #871F78 - 深紫色      
% 20 #6B238E - 深石板蓝    
% 21 #2F4F4F - 深铅灰色    
% 22 #97694F - 深棕褐色    
% 23 #7093DB - 深绿松石色  
% 24 #855E42 - 暗木色     

% 25 #545454 - 淡灰色      
% 26 #545454 - 土灰玫瑰红色 
% 27 #D19275 - 长石色      
% 28 #8E2323 - 火砖色      
% 29 #238E23 - 森林绿      
% 30 #CD7F32 - 金色       

% 31 #DBDB70 - 鲜黄色      
% 32 #C0C0C0 - 灰色        
% 33 #527F76 - 铜绿色      
% 34 #93DB70 - 青黄色      
% 35 #215E21 - 猎人绿     
% 36 #4E2F2F - 印度红     

% 37 #9F9F5F - 土黄色      
% 38 #C0D9D9 - 浅蓝色      
% 39 #A8A8A8 - 浅灰色      
% 40 #8F8FBD - 浅钢蓝色    
% 41 #E9C2A6 - 浅木色      
% 42 #32CD32 - 石灰绿色   

% 43 #E47833 - 桔黄色      
% 44 #8E236B - 褐红色      
% 45 #32CD99 - 中海蓝色    
% 46 #3232CD - 中蓝色      
% 47 #6B8E23 - 中森林绿    
% 48 #EAEAAE - 中鲜黄色    

% 49 #9370DB - 中兰花色    
% 50 #426F42 - 中海绿色    
% 51 #7F00FF - 中石板蓝色  
% 52 #7FFF00 - 中春绿色   
% 53 #70DBDB - 中绿松石色  
% 54 #DB7093 - 中紫红色   

% 55 #A68064 - 中木色     
% 56 #2F2F4F - 深藏青色    
% 57 #23238E - 海军蓝      
% 58 #4D4DFF - 霓虹篮      
% 59 #FF6EC7 - 霓虹粉红    
% 60 #00009C - 新深藏青色  

% 61 #EBC79E - 新棕褐色    
% 62 #CFB53B - 暗金黄色    
% 63 #FF7F00 - 橙色       
% 64 #FF2400 - 橙红色    
% 65 #DB70DB - 淡紫色     
% 66 #8FBC8F - 浅绿色     

% 67 #BC8F8F - 粉红色     
% 68 #EAADEA - 李子色     
% 69 #D9D9F3 - 石英色     
% 70 #5959AB - 艳蓝色     
% 71 #6F4242 - 鲑鱼色     
% 72 #BC1717 - 猩红色     

% 73 #238E68 - 海绿色      
% 74 #6B4226 - 半甜巧克力色 
% 75 #8E6B23 - 赭色        
% 76 #E6E8FA - 银色       
% 77 #3299CC - 天蓝        
% 78 #007FFF - 石板蓝      

% 79 #FF1CAE - 艳粉红色    
% 80 #00FF7F - 春绿色      
% 81 #236B8E - 钢蓝色      
% 82 #38B0DE - 亮天蓝色    
% 83 #DB9370 - 棕褐色      
% 84 #D8BFD8 - 紫红色     

% 85 #ADEAEA - 石板蓝色   
% 86 #5C4033 - 浓深棕色    
% 87 #CDCDCD - 淡浅灰色    
% 88 #4F2F4F - 紫罗兰色    
% 89 #CC3299 - 紫罗兰红色  
% 90 #D8D8BF - 麦黄色 
% 91 #99CC32 - 黄绿色
%---------------------------------
format short
colors = {'#70DB93','#5C3317','#9F5F9F','#B5A642','#D9D919','#A67D3D',...
    '#8C7853','#A67D3D','#5F9F9F','#D98719','#B87333','#FF7F00',...
    '#42426F','#5C4033','#2F4F2F','#4A766E','#4F4F2F','#9932CD',...
    '#871F78','#6B238E','#2F4F4F','#97694F','#7093DB','#855E42'...
    '#545454','#545454','#D19275','#8E2323','#238E23','#CD7F32',...
    '#DBDB70','#C0C0C0','#527F76','#93DB70','#215E21','#4E2F2F',...
    '#9F9F5F','#C0D9D9','#A8A8A8','#8F8FBD','#E9C2A6','#32CD32',...
    '#E47833','#8E236B','#32CD99','#3232CD','#6B8E23','#EAEAAE',...
    '#9370DB','#426F42','#7F00FF','#7FFF00','#70DBDB','#DB7093',...
    '#A68064','#2F2F4F','#23238E','#4D4DFF','#FF6EC7','#00009C',...
    '#EBC79E','#CFB53B','#FF7F00','#FF2400','#DB70DB','#8FBC8F',...
    '#BC8F8F','#EAADEA','#D9D9F3','#5959AB','#6F4242','#BC1717',...
    '#238E68','#6B4226','#8E6B23','#E6E8FA','#3299CC','#007FFF',...
    '#FF1CAE','#00FF7F','#236B8E','#38B0DE','#DB9370','#D8BFD8',...
    '#ADEAEA','#5C4033','#CDCDCD','#4F2F4F','#CC3299','#D8D8BF',...
    '#99CC32'}';
%---------------------------------
narginchk(0,2)

if nargin < 2
    isrgb = 0;
else
    isrgb = varargin{2};
end

numOfColors = length(colors);
numOfcolumn = 12;
if nargin < 1
    disp(colors);                     % Show all colors
    fig=figure('Position',[50 50 1330 770]);
    % set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.2 0.05 0.6 0.88]);

    for k = 1:numOfColors
        subplot(ceil(numOfColors/numOfcolumn), numOfcolumn, k);
        c = hex2rgb(colors{k});
        rectangle('Position', [0.01 0.05 0.08 0.06], 'FaceColor', c, ...
            'EdgeColor', 'none')
        title(['No.', num2str(k), ': ', char(colors{k})])
        axis off;
    end
    set(gcf, 'Color', 'w');            % White Background
    print(fig,'-dpng','常用单颜色.png','-r300')
    return;
end

index = varargin{1};

color = colors{index};              % Hexadecimal color

if isrgb
    color = hex2rgb(color);    % RGB colors with range [0~1]
end

end