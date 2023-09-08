package com.monstar.books.product.sevice;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
    public File rename(File file) {
        
        if (file.exists()) {
            file.delete(); // 이미 존재하는 파일을 삭제
        }
        
	return file;
	}
}
