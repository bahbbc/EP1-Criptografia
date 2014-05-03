function C = hill(P, K)

	C = P;
	%primeiro verifica se a chave eh invertivel - esta dando problemas, acho que precisamos perguntar ao valdinei
	%inverse = inverseMod(K) 
	% Elimina caracteres que nao sao texto
	indexTexto = find((P>='a'&P<='z')|(P>='A'&P<='Z'));
	P = P(indexTexto);

	% Reduz a caixa de todos caracteres
	indexCaixaAlta = find((P>='A'&P<='Z'));
	P(indexCaixaAlta) = P(indexCaixaAlta) + ('a'-'A');

	Kdec = 'abcdefghijklmnopqrstuvwxyz';
	%para o calculo do indice na letra
	M = P-'a';
	%calcula o teto para fazer uma matriz quadrada (automaticamente preenche o resto com zeros)
	raiz = ceil(sqrt(length(M)));
	%guarda o tamanho original da matriz para refazer o texto criptografado
	original_size = length(P)
	%transforma o texto claro em matriz
	Q = vec2mat(M,raiz);
	M = mod(Q*K, 26)+1;
	%transforma o resultado criptografado em vetor para o match das letras
	P = Kdec(M(:)');
	%remove zeros preenchidos anteriormente
	P = (1:original_size)
	% Retorna para caixa alta
	P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

	% Atualiza caracteres que sao texto
	C(indexTexto) = P;
end
