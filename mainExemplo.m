P = readText('NotesUndergound.txt');

C = monoalfabeticaE(P,'knmporqtsvuxwzybadcfeghjil');
%saveText(C,'crimepunishment_Cifrado.txt');
[rateMono character] = countCharacters(C);
C2 = vigenere(P,'knmporqtsvuxwzybadcfeghjil');
[rateMono2 character] = countCharacters(C2);
C3 = hill(P, [17, 17, 5; 21,18,21;2,2,19]);
[rateMono3 character] = countCharacters(C3);

    
plot([1:26],[rateMono;rateMono2, rateMono3]);
legend('Monoalfabetica', 'Vigenere', 'Hill');
title('Frequencia de Letras em Textos Cifrados');
xlabel('letras');
ylabel('percentagem de ocorrencia');
print -dpng lab1.png
