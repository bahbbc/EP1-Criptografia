function keys = keysHill(N,V)
% Monta todas as chaves possíveis para cifra de Hill considerando uma matriz de tamanho N e considerando valores entre 0..V-1

keys = zeros(0,N^2);

for i=0:(V^(N^2)-1)

	x = i;
	K = [];
	for j=1:N^2
		K = [K, mod(x,V)];
		x = floor(x/V);
	end
	
	matrizK = reshape(K,N,N);
	if any(inverseMod(matrizK))
		keys = [keys; K];
	end
	
end


