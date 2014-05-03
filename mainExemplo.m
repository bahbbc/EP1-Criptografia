P = readText('NotesUndergound.txt');

C = monoalfabeticaE(P,'knmporqtsvuxwzybadcfeghjil');
%saveText(C,'crimepunishment_Cifrado.txt');
[rateMono character] = countCharacters(C);
C2 = vigenere(P,'knmporqtsvuxwzybadcfeghjil');
[rateMono2 character] = countCharacters(C2);
C3 = hill(P, randi(26, 449,449));
[rateMono3 character] = countCharacters(C3);
C4 = vigenereIncrementado(P, 'a');
[rateMono4 character] = countCharacters(C4);
    
plot([1:26],[rateMono; rateMono2; rateMono3; rateMono4]);
legend('Monoalfabetica', 'Vigenere', 'Hill', 'vigenere Incrementado');
title('Frequencia de Letras em Textos Cifrados');
xlabel('letras');
ylabel('percentagem de ocorrencia');
print -dpng lab1.png
