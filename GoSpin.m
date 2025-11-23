% GoSpin.m: Simulates spinning of three slots out of four 
% different types of fruits (Lemon, Apple, Banana, and Peach) 
% and returns the result to the * caller.

function [selectfruit,result,credit] = GoSpin(credit,ticketPrice)
fruit = ["LEMON", "APPLE", "BANANA", "PEACH"];

%string = string "win"

%select random fruit 
%place a string checker here if all 3 fruit results are the same win
% if not lose

if credit < ticketPrice
        result = "Insufficient Credit";
        selectfruit = [];
        return; 
end

    selectfruit = fruit(randi(numel(fruit), 1, 3));


if numel(unique(selectfruit)) == 1
    result = 1; %"You Won"
    % won = won + 1;
    % credit = credit + 10;
else
    result = 0; %"You Lost"
    % won = won;
    credit = credit - ticketPrice;
end


% if numel(unique(selectfruit)) == 1
%     result = 1; %"You Lost"
%     % won = won;
% 
% 
% 
% else
%     result = 1; %"You Won"
%     % won = won + 1;
%     % credit = credit + 10;
%     credit = credit - ticketPrice;
% end
