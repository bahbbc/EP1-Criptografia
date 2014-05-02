function text = readText(nome)

fid = fopen(nome,'r');

text = [];
if fid > 0
	while (~feof(fid))
		linha = fgets(fid);
	        text = [text linha];        
	end 
	fclose(fid);
end


end
