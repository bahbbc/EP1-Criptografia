function C = vigenere(P, K)

C = P;
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

Kdec = 'abcdefghijklmnopqrstuvwxyz';
P1 = '';
for i = 1:length(P)
	aux = Kdec(mod(P(i)-'a'+K-'a', 26)+1);
	K = aux;
	P1 = [P1, aux];
end
% Retorna para caixa alta
P1(indexCaixaAlta) = P1(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = P1;

end
