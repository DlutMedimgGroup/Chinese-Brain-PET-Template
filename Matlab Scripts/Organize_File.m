function file_list = Organize_File(path, scan)
file_list = {};
for i = 1:length(scan)
    file_list(i,1) = cell(strcat(path, scan(i),',1'));
end
end