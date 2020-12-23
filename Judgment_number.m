function X = Judgment_number(check,x1,y1)
    %檢查數字對應的號碼
    num = check(x1,y1);
    switch num
        case 1
            X = imread('1.png');
        case 2
            X = imread('2.png');
        case 3
            X = imread('3.png');
        case 4
            X = imread('4.png');
        case 5
            X = imread('5.png');
        case 6
            X = imread('6.png');
        case 7
            X = imread('7.png');
        case 8
            X = imread('8.png');
        case 0
            X = imread('white.png');
    end
end