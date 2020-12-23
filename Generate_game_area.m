function A = Generate_game_area(N,bomb_num)
    A = zeros(N);
    x = [];
    y = [];
    count = 0;
    while (bomb_num ~= count)
        a = round(rand(1,1)*(N-1))+1;
        b = round(rand(1,1)*(N-1))+1;
        if A(a,b) ~= 99
            A(a,b) = 99;
            x = [x a];
            y = [y b];
            count = count + 1;
        end
    end
    
    for ii = 1:N
        for jj = 1: N
            if A(ii,jj) == 99
                continue;
            end
           A(ii,jj) = count_the_number_of_nearby_bombs(N,A,ii,jj);
        end
    end
end