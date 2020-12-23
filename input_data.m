function [N ,bomb_num] = input_data
    %輸入：N 是記錄 n*n 的矩陣
    %     N 的最高上限我給到16*16的矩陣最低是9*9
    %     bomb_num 是記錄玩家想要放多少顆炸彈
    %     炸彈的算法是最低我們給他們最少可以放10顆
    %     最多可以放（（N*N）/ 2） 顆炸彈
    
    N = input('請輸入想要玩N*N的大小的N( 最低9*9 最高16*16 ):');
    %   如果輸入低於9或高於16就需要玩家再次輸入
    while( N < 9 || N > 16 )                                        
        N = input('請輸入想要玩N*N的大小的N( 最低9*9 最高16*16 ):');
    end
    
    bomb_min = 10;
    bomb_max = round((N*N)/2);
    fprintf('請輸入 %d 到 %d 之間的炸彈數量\n',bomb_min,bomb_max);
    bomb_num = input('幾顆炸彈:');
    %   如果輸入低於 bomb_min 或高於 bomb_max 就需要玩家再次輸入
    while (bomb_num < bomb_min || bomb_num > bomb_max)
        fprintf('請輸入 %d 到 %d 之間的炸彈數量\n',bomb_min,bomb_max);
        bomb_num = input('炸彈數量:');
    end
    
end