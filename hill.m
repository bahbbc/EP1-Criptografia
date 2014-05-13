function C = hill(P, K)

	C = P;
	inverse = inverseMod(K);
	if length(inverse) > 1 
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
		raiz = length(K);
		%raiz = ceil(sqrt(length(M)));
		%guarda o tamanho original da matriz para refazer o texto criptografado
		original_size = length(P);
		%transforma o texto claro em matriz
		j = raiz+1;
		i = raiz*2;
		Q = M(:)';
		answer = mod(K*Q(1:raiz)', 26)+1;
		while j <= length(M)
			if i > length(M)
				final_vector = zeros(1,i-length(Q));
				Q = [Q,final_vector];
			end
			S = Q(j:i);
			answer = [answer,mod(K*S', 26)+1];
			j = i+1;
			i = i+raiz;
		end
		%transforma o resultado criptografado em vetor para o match das letras
		P = Kdec(answer(:));
		%remove zeros preenchidos anteriormente
		P = P(1:original_size);
		% Retorna para caixa alta
		P(indexCaixaAlta) = P(indexCaixaAlta) + ('A'-'a');

		% Atualiza caracteres que sao texto
		C(indexTexto) = P;
    end
end
