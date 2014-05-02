function invK = inverseMod(K)

listaInv = [0 1 0 9 0 21 0 15 0 3 0 19 0 0 0 7 0 23 0 11 0 5 0 17 0 25];


invDet = listaInv(mod(round(det(K)),26)+1);

if invDet > 0
	[n m] = size(K);
	invK = zeros(n,m);
	for i=1:n
		for j=1:m
			invK(j,i) = mod((-1)^(i+j)*det(K([[1:i-1] [i+1:end]],[[1:j-1] [j+1:end]]))*invDet,26);
		end
	end
else
	invK = 0;
end

