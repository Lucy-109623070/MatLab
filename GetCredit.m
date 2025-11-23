%GetCredit.m: Determines the TOTAL credit [based on the 
% previous credit, current win/loss, and the ticket 
% purchased] and returns it to the caller.
%The maximum prize will be $10.00 for each win (match).
%
function newCredit = GetCredit(credit, ticketPrice,won,useCredit)%add won soon
    %newCredit = credit + ticketPrice - useCredit;%add won soon

    % if credit < ticketPrice
    %     newCredit = credit;
    %     return;
    % end


    if won > 0
        newCredit = useCredit + credit + 10;
        return;
    end

    newCredit = credit + ticketPrice;
    newCredit = newCredit - useCredit; 


    if newCredit < 0
        newCredit = 0;
    end


    newCredit = round(newCredit / 0.25) * 0.25;
end