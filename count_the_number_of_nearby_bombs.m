   function count = count_the_number_of_nearby_bombs(N,A,ii,jj)
    count = 0;
    ii = ii - 1;
    jj = jj - 1;
    temp = jj;
    for mm = 1:3
        jj = temp;
        if ii == 0
            ii = ii + 1;
            continue;
        end
        if ii == N + 1
            continue;
        end
        for nn = 1:3
            if jj == 0
                jj = jj + 1;
                continue;
            end
            if jj == N + 1
                continue;
            end
            if A(ii,jj) == 99
                count = count + 1;
            end
            jj = jj + 1;
        end
        ii = ii + 1;
    end
end