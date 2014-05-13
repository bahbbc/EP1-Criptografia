function probs = mlMonoalfabetica(freq,keys,cifra)
% calcula a verosimilhanca para todas as chaves 'keys', considerando a
% frequencia de ocorrencia dos digramas 'freq' e o texto cifrado 'cifra'

nK = size(keys,1);
probs = ones(1,nK)/nK;
nCaracter = length(cifra);


for i='a':'z'
		for kInd = 1:nK
			plain = viginere(cifra,keys(kInd,:));
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
