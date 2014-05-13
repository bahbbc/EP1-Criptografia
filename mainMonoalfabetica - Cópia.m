text = readText('NotesUndergound.txt');

% Elimina caracteres que nao sao texto
indexTexto = find((text>='a'&text<='z')|(text>='A'&text<='Z'));
text = text(indexTexto);

% Reduz a caixa de todos caracteres
indexCaixaAlta = find((text>='A'&text<='Z'));
text(indexCaixaAlta) = text(indexCaixaAlta) + ('a'-'A');

N = length(text);

% Faz a contagem dos digramas
freq = zeros(26,26);
for i=1:26
	for j=1:26
		freq(i,j) = length(findstr(text,[i j]-1 + 'a'));
	end
end

freq = (freq+1/100)/(N-1+26*26/100);

% Escolhe o tamanho do experimento
Nsize = 10;  % quantos tamanhos de textos diferentes (aumenta de 10 em 10)
Ntextos = 2; % quantas vezes repete o experimento

keys = keysVigenere(3,17);

probMax = zeros(Nsize, Ntextos);
probReal = zeros(Nsize, Ntextos);

for texto=1:Ntextos
for tamanho=1:Nsize
	% sorteia um texto aberto
    nCaracter = tamanho*10;
	aux = ceil(rand*(N-nCaracter+1));
	plain = text(aux:aux+nCaracter-1);
    
    % sorteia uma chave	
	keyRealInd = ceil(rand*size(keys,1));
	cifra = vigenere(plain,keys(keyRealInd,:));

    % encontra a verossimilhanca de toda chave
	probs = mlMonoalfabetica(freq,keys,cifra);
	probMax(tamanho,texto) = max(probs);
	probReal(tamanho,texto) = probs(keyRealInd);
    
    %save monoalfabetica.mat probMax probReal
end
end

plot(10*[1:Nsize],mean(probMax,2),10*[1:Nsize],mean(probReal,2))
legend('Maxima Probabilidade', 'Probabilidade da Chave Correta')
xlabel('numero de caracteres')
ylabel('probabilidade')




