function keys = keysMonoalfabetica(N)
% Monta todas as chaves possíveis para cifra monoalfabetica considerando
% que apenas as N letras mais frequentes sofrem permutacao

freq = 'etaoinshrdlcumwfgypbvkjxqz';
alf = 'abcdefghijklmnopqrstuvwxyz';

keys = repmat(alf,factorial(N),1);

indexes = freq(1:N)-'a'+1;

keys(:,indexes) = perms(freq(1:N));
