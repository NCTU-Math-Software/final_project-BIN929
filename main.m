function main
    %   踩地雷的主程式
    START_GAME = imread('start_game.png');
    image(START_GAME);
    
    [N ,bomb_num] = input_data;             %   input 想玩的大小和炸彈數量
    A = Generate_game_area_background(N);   %   製作游戲背景
    colormap(colorcube)
    image(A)
    data = Generate_game_area(N,bomb_num);  %   計算各個格子附近炸彈的數量
    check = zeros(N);                       %   生成一個 n*n 的矩陣爲了檢查踩過的地方
    while 1
        [x,y,Button] = ginput(1);
        y=round(y);
        x=round(x);
        x1 = round((y+50)/100);
        y1 = round((x+50)/100);
        
        if (x1 >= 1 && x1 <= N && y1 >= 1 && y1 <= N)
            if (Button == 1)
                if check(x1,y1) == 0
                    [A, check] = Step_on(data,x1,y1,A,N,check);
                end
                if check(x1,y1) == -1
                    image(A),drawnow; pause(0.5)
                    B = imread('game_over.png');
                    image(B);
                    disp('Loss！！！');
                    break;
                end
            end
        
            if (Button == 3)
                if check(x1,y1) == 0
                    X = imread('flag.png');
                    for ii = 1:100
                        for jj = 1:100
                            A((((x1-1)*100)+ii),(((y1-1)*100)+jj),:) = X(ii,jj,:);
                        end
                    end
                    check(x1,y1) = 2;
                else
                    if check(x1,y1) == 2
                        for ii = 1:100
                            for jj = 1:100
                                A((((x1-1)*100)+ii),(((y1-1)*100)+jj),:) = 105;
                            end
                        end
                    end
                    check(x1,y1) = 0;
                end
            end
        
            image(A)
        
            win = 0;
            count_bomb = 0;
            no = 0;
            for ii = 1:N
                for jj = 1:N
                    if check(ii,jj) ~= 0
                        if check(ii,jj) == 2 && data(ii,jj) == 99
                            count_bomb = count_bomb + 1;
                        end
                        if check(ii,jj) == 2 && data(ii,jj) ~= 99
                            no = no + 1;
                        end
                        if check(ii,jj) == 1
                            win = win +1;
                        end
                    end
                end
            end
            if (win == (N*N)-bomb_num || (count_bomb == bomb_num && no ==0))
                image(A),drawnow; pause(2.0)
                you_win = imread('win.png');
                image(you_win);
                disp('You win！！！');
                break;
            end
        end
        if (Button == 27)
            break;
        end
    end
    repeat = input('Do you want to play one more time? If you want, please press  enter 1  don’t enter 0：');
    if(repeat == 1)
        main
    end
end
