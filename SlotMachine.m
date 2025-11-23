%Author: Lucero Aguilar
%Date : 10/15/25
%Description

close all
clear,clc

    Prompt = 'Welcome. Press any key to start';
    disp(Prompt);
    pause; 
    credit = 10; 
    won = 0;
    ticketPrice = 0;
    count = 0;
    disp(['You have $', num2str(credit,'%.2f'), ' credit']);
while true
    ticketPrice = input('Would you like to purchase a ticket ($1, $2, $5, $10)?','s');

     if credit > 100;
        credit = 100;
     end

    switch(ticketPrice)
      case '10'
          ticketPrice = 10;
      case '5'
          ticketPrice = 5;
      case '2'
         ticketPrice = 2;
      case '1'
         ticketPrice = 1;
     otherwise
          disp("bee . . . . . . . . . . . . . . . . . . . p! Invalid ticket price.");
          return; % Exit if the input is invalid
    end
    %idiot proof
    if credit < ticketPrice
        disp('bee . . . . . . . . . . . . . . . . . . . p!');
        disp('ERROR: Insufficient credit to buy ticket.');
        break;
    end




    useCredit = 0;
    
    credit = GetCredit(credit, ticketPrice,won,useCredit);
    disp(['You have $', num2str(credit, '%.2f'), ' credit']);
    ticketPrice = 0;
    
    useCredit = input('How much of the credit would you like to use?');
    
        %idiot proof
    if useCredit > credit
    disp('ERROR: You cannot use more credit than you have.');
    useCredit = credit;
    end

    credit = GetCredit(credit,ticketPrice,won,useCredit);


    disp('SPINNING...');
    pause(1);%change for testing%%%%%%%

    [selectfruit,result,credit] = GoSpin(credit,ticketPrice);
    disp(selectfruit)

    if result == 1
        %issues with won and credit + 10 not working because of go spin
        count = count + 1;
        won = 1;
        credit = GetCredit(credit,ticketPrice,won,useCredit);
        % credit = credit + 10;

        disp(["You Won! Credit: $" + num2str(credit, '%.2f')])
        won = 0;
        % disp("You Won")
        %everytime you win you should win 10 ,not anymore
        
    else
        won = 0; 
        disp("You Lost")
       
    end


    disp(['You have $', num2str(credit, '%.2f'), ' credit']);

    stopgame = input("Would you like to stop playing",'s');
    if strcmpi(stopgame,'YES')
        disp('Thank you for playing. Bye Bye!');
        break;
    elseif strcmpi(stopgame,'NO')
        continue;
    end
         
end
