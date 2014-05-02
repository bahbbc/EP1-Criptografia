function text = saveText(texto,nome)

fid = fopen(nome,'w');

if fid > 0
	fputs(fid,texto);
	fclose(fid);
end


end
