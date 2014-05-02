function [rate character] = countCharacters(P)

% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

nCount = zeros(1,26);
for i='a':'z'
	nCount(i-'a'+1) = sum(P==i);
end

[rate character] = sort(nCount);
rate = rate/sum(rate);
character = char(character + 'a' - 1);

end
