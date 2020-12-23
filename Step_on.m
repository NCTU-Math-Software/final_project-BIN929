function [A ,check]= Step_on(data,x1,y1,A,N,check)
    if data(x1,y1) == 99
        X = imread('bomb.png');
        for ii = 1:100
            for jj = 1:100
                A((((x1-1)*100)+ii),(((y1-1)*100)+jj),:) = X(ii,jj,:);
            end
        end
        check(x1,y1) = -1;
    else
        if data(x1,y1) ~= 0
            X = Judgment_number(data,x1,y1);
            for ii = 1:100
                for jj = 1:100
                    A((((x1-1)*100)+ii),(((y1-1)*100)+jj),:) = X(ii,jj,:);
                end
            end
            check(x1,y1) = 1;
        else
            X = Judgment_number(data,x1,y1);
            for ii = 1:100
                for jj = 1:100
                    A((((x1-1)*100)+ii),(((y1-1)*100)+jj),:) = X(ii,jj,:);
                end
            end
            check(x1,y1) = 1;
            for ii = -1:1
                if (x1+ii == 0 || x1+ii == N+1)
                    continue;
                end
                for jj = -1:1
                    if (y1+jj== 0 || y1+jj == N+1 || ii == jj || ii == -jj)
                        continue;
                    end 
                    if check(x1+ii,y1+jj) == 0
                        [A,check] = Step_on(data,x1+ii,y1+jj,A,N,check);
                    end
                end
            end
        end
    end
end