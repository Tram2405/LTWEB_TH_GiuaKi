package baotram.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import baotram.connection.DbCon;
import baotram.model.DanhMuc;
import baotram.model.Hang;

public class DanhMucDAO {
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DbCon connectdb;

	public DanhMucDAO() {
		connectdb = new DbCon();
	}

	public ArrayList<DanhMuc> getDanhMucList() {
		ArrayList<DanhMuc> list = new ArrayList<DanhMuc>();
		String sql = "SELECT * FROM danhmuc";
		try {
			rs = connectdb.getStatement().executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("idDanhMuc");
				String tenDM = rs.getString("TenDM");
				DanhMuc c = new DanhMuc(id, tenDM);
				list.add(c);
			}
		} catch (Exception e) {
			System.out.println("Please check getDanhMucList index.jsp in DanhMucDAO");
		}
		connectdb.closeConnect();
		return list;
	}
	
	public DanhMuc getDanhMucDetail(String danhMucId) throws SQLException {
        String sql = "SELECT * FROM danhmuc WHERE idDanhMuc=?";
        stmt = connectdb.openConnect().prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(danhMucId));
        rs = stmt.executeQuery();
        DanhMuc dm = null;
        while (rs.next()) {
        	int id = rs.getInt("idDanhMuc");
			String tenDM = rs.getString("TenDM");
			dm = new DanhMuc(id, tenDM);
        }
        return dm;
    }
}
