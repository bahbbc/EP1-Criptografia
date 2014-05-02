P = readText('NotesUndergound.txt');

C = monoalfabeticaE(P,'knmporqtsvuxwzybadcfeghjil');
%saveText(C,'crimepunishment_Cifrado.txt');
[rateMono character] = countCharacters(C);
C2 = vigenere(P,'knmporqtsvuxwzybadcfeghjil');
[rateMono2 character] = countCharacters(C2);
%C3 = vigenereIncrementado(P,'rdf');
%[rateMono3 character] = countCharacters(C3);

    
plot([1:26],[rateMono;rateMono2]);
legend('Monoalfabetica', 'Vigenere');
title('Frequencia de Letras em Textos Cifrados');
xlabel('letras');
ylabel('percentagem de ocorrencia');
print -dpng lab1.png
