function A = Generate_game_area_background(N)
    %灰色(128,128,128)
    %灰昏(105，105，105)
    A = zeros(N*100,N*100,3,'uint8');
    A(:,:,:) = 105;
    for ii = 1:N
        for jj = 1:N*100
            A((ii*100)-99,jj,:) = 128;
            A(ii*100,jj,:) = 128;
        end
    end
    for ii = 1:N
        for jj = 1:N*100
            A(jj,(ii*100)-99,:) = 128;
            A(jj,ii*100,:) = 128;
        end
    end
end