package com.jit.common.dao;

import com.jit.common.domain.Pcode;
import com.jit.common.utils.DataSourceUtil;
import org.apache.commons.dbutils.*;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class PcodeDao {

    private BeanProcessor beanProcessor = new GenerousBeanProcessor();
    private RowProcessor processor = new BasicRowProcessor(beanProcessor);
    private QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
    /**
     * 根据code类型获取配置信息
     * @param codeType
     * @return
     */
    public List<Pcode> findPcodeListByCodeType(String codeType)
    {

        String sql = "select * from p_code a where a.code_type = ? order by sn";
        List<Pcode> codeList = null;
        try
        {
            codeList = runner.query(sql, new BeanListHandler<Pcode>(Pcode.class, processor), codeType);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return codeList;
    }

}
