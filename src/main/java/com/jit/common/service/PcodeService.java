package com.jit.common.service;

import com.jit.common.dao.PcodeDao;
import com.jit.common.domain.Pcode;

import java.util.List;

public class PcodeService {
    private PcodeDao dao = new PcodeDao();

    public List<Pcode> findPcodeListByCodeType(String codeType){
        return dao.findPcodeListByCodeType(codeType);
    }
}
