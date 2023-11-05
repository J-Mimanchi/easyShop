package com.jit.common.server;

import com.jit.common.dao.PcodeDao;
import com.jit.common.entitys.Pcode;

import java.util.List;

public class PcodeServer {
    private PcodeDao dao = new PcodeDao();
    public List<Pcode> findPcodeListByCodeType(String codeType){
        return dao.findPcodeListByCodeType(codeType);
    }
}
