:- module(cube_rotations, [rotateHorizontal/2, rotateVerticalFront/2, rotateVerticalSide/2]).

% ===============================================
%                   Horizontal
% =============================================== 
rotateHorizontal(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To7,To4,To1],
    [To8,To5,To2],
    [To9,To6,To3]
    ],[
    [Le1,Le2,Le3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Fr1,Fr2,Fr3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Ba1,Ba2,Ba3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ) :- writeln("Horizontal1").
    rotateHorizontal(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Le4,Le5,Le6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Fr4,Fr5,Fr6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ri4,Ri5,Ri6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Ba4,Ba5,Ba6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ) :- writeln("Horizontal2").
    rotateHorizontal(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Le7,Le8,Le9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ri7,Ri8,Ri9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Ba7,Ba8,Ba9]
    ],[
    [Bo7,Bo4,Bo1],
    [Bo8,Bo5,Bo2],
    [Bo9,Bo6,Bo3]
    ]]
    
    ) :- writeln("Horizontal3").
    

% ===============================================
%                   Vertical front
% ===============================================
rotateVerticalFront(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [Fr1,To2,To3],
    [Fr4,To5,To6],
    [Fr7,To8,To9]
    ],[
    [Bo1,Fr2,Fr3],
    [Bo4,Fr5,Fr6],
    [Bo7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,To7],
    [Ba4,Ba5,To4],
    [Ba7,Ba8,To1]
    ],[
    [Le3,Le6,Le9],
    [Le2,Le5,Le8],
    [Le1,Le4,Le7]
    ],[
    [Ba9,Bo2,Bo3],
    [Ba6,Bo5,Bo6],
    [Ba3,Bo8,Bo9]
    ]]
    
    ) :- writeln("Vertical Front").
    rotateVerticalFront(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,Fr2,To3],
    [To4,Fr5,To6],
    [To7,Fr8,To9]
    ],[
    [Fr1,Bo2,Fr3],
    [Fr4,Bo5,Fr6],
    [Fr7,Bo8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,To8,Ba3],
    [Ba4,To5,Ba6],
    [Ba7,To2,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Ba8,Bo3],
    [Bo4,Ba5,Bo6],
    [Bo7,Ba2,Bo9]
    ]]
    
    ) :- writeln("Vertical Front").
    rotateVerticalFront(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,To2,Fr3],
    [To4,To5,Fr6],
    [To7,To8,Fr9]
    ],[
    [Fr1,Fr2,Bo3],
    [Fr4,Fr5,Bo6],
    [Fr7,Fr8,Bo9]
    ],[
    [Ri7,Ri4,Ri1],
    [Ri8,Ri5,Ri2],
    [Ri9,Ri6,Ri3]
    ],[
    [To9,Ba2,Ba3],
    [To6,Ba5,Ba6],
    [To3,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Ba7],
    [Bo4,Bo5,Ba4],
    [Bo7,Bo8,Ba1]
    ]]
    
    ) :- writeln("Vertical Front").
    

% ===============================================
%                   Vertical side
% ===============================================
rotateVerticalSide(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [Le7,Le4,Le1],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr7,Fr4,Fr1],
    [Fr8,Fr5,Fr2],
    [Fr9,Fr6,Fr3]
    ],[
    [Ri1,Ri2,To1],
    [Ri4,Ri5,To2],
    [Ri7,Ri8,To3]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Bo7,Le2,Le3],
    [Bo8,Le5,Le6],
    [Bo9,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Ri9,Ri6,Ri3]
    ]]
    
    ) :- writeln("Vertical side.").
    rotateVerticalSide(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,To2,To3],
    [Le8,Le5,Le2],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,To4,Ri3],
    [Ri4,To5,Ri6],
    [Ri7,To6,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Bo4,Le3],
    [Le4,Bo5,Le6],
    [Le7,Bo6,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Ri8,Ri5,Ri2],
    [Bo7,Bo8,Bo9]
    ]]
    
    ) :- writeln("Vertical side.").
    rotateVerticalSide(
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [To7,To8,To9]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [Ri1,Ri2,Ri3],
    [Ri4,Ri5,Ri6],
    [Ri7,Ri8,Ri9]
    ],[
    [Ba1,Ba2,Ba3],
    [Ba4,Ba5,Ba6],
    [Ba7,Ba8,Ba9]
    ],[
    [Le1,Le2,Le3],
    [Le4,Le5,Le6],
    [Le7,Le8,Le9]
    ],[
    [Bo1,Bo2,Bo3],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ,
    
    [[
    [To1,To2,To3],
    [To4,To5,To6],
    [Le9,Le6,Le3]
    ],[
    [Fr1,Fr2,Fr3],
    [Fr4,Fr5,Fr6],
    [Fr7,Fr8,Fr9]
    ],[
    [To7,Ri2,Ri3],
    [To8,Ri5,Ri6],
    [To9,Ri8,Ri9]
    ],[
    [Ba3,Ba6,Ba9],
    [Ba2,Ba5,Ba8],
    [Ba1,Ba4,Ba7]
    ],[
    [Le1,Le2,Bo1],
    [Le4,Le5,Bo2],
    [Le7,Le8,Bo3]
    ],[
    [Ri7,Ri4,Ri1],
    [Bo4,Bo5,Bo6],
    [Bo7,Bo8,Bo9]
    ]]
    
    ) :- writeln("Vertical side.").
    