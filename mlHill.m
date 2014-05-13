function probs = mlHill(freq,keys,cifra)
% calcula a verosimilhanca para todas as chaves 'keys', considerando a
% frequencia de ocorrencia dos digramas 'freq' e o texto cifrado 'cifra'

[nK, c] = size(keys);
probs = ones(1,nK)/nK;
nCaracter = length(cifra);

tam = sqrt(c);

for i='a':'z'
		for kInd = 1:nK
			random_key = vec2mat(keys(kInd,:),tam);
			plain = hill(cifra,random_key);
			auxText = plain(find(plain(1:end-1)==i)+1); 
			count = hist(auxText-'a',0:25);
            if size(count,1) > 1
                count = count';
            end
			probs(kInd) = probs(kInd)*prod(binopdf(count,length(auxText),freq(i-'a'+1,:)));
		end
		probs = probs/sum(probs);
end

return
