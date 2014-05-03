function C = vigenere(P, K)

C = P;

% Elimina caracteres que nao sao texto
indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
P = P(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((P>='A'&P<='Z'));
P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

Kdec = 'abcdefghijklmnopqrstuvwxyz';
i = 1;
I = '';
while i <= length(P)
	%calculo por posicao do texto claro
	aux = Kdec(mod(P(i)-'a'+K-'a', 26)+1);
	%guarda a letra salva pra prox chave
	K = aux;
	%incrementa a letra no vetor ja obtido
	I = [I, aux];
	i = i+1;
end
% Retorna para caixa alta
I(indexCaixaAlta) = I(indexCaixaAlta) + ('A'-'a');

% Atualiza caracteres que sao texto
C(indexTexto) = I;

end
