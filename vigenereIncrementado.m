function C = vigenere(P, K)

C = '';
% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

Kdec = 'abcdefghijklmnopqrstuvwxyz';
i = 1;
%P1 = '';
while i <= length(P)
	aux = Kdec(mod(P(i)-'a'+K-'a', 26)+1);
	K = aux;
	C = [C, aux];
	i = i+1;
end
% Retorna para caixa alta
P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
%C(indexTexto) = P;

end
