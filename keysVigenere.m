function keys = keysVigenere(N,V)
% Monta todas as chaves possíveis para cifra de Vigenere considerando uma palavra de tamanho N e considerando valores entre 0..V-1

keys = zeros(0,N);

for i=0:(V^(N)-1)

	x = i;
	K = [];
	for j=1:N
		K = [K, mod(x,V)];
		x = floor(x/V);
	end
	
	keys = [keys; K];
	
end


