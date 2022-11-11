package baotram.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import baotram.connection.DbCon;
import baotram.model.Hang;
import baotram.model.SanPham;

public class HangDAO {
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DbCon connectdb;

	public HangDAO() {
		connectdb = new DbCon();
	}

	public ArrayList<Hang> getHangList(String danhMucId) {
		ArrayList<Hang> list = new ArrayList<Hang>();
		String sql = "SELECT * FROM hang WHERE idDanhMuc=?";
		try {
			stmt = connectdb.openConnect().prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(danhMucId));
			rs = stmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("idHang");
				int idDanhMuc = rs.getInt("idDanhMuc");
				String TenHang = rs.getString("TenHang");
				Hang h = new Hang(id, idDanhMuc, TenHang);
				list.add(h);
			}
		} catch (Exception e) {
			System.out.println("Please check getDanhMucList index.jsp in DanhMucDAO");
		}
		connectdb.closeConnect();
		return list;
	}
	
	public Hang getHangDetail(String hangId) throws SQLException {
        String sql = "SELECT * FROM hang WHERE idHang=?";
        stmt = connectdb.openConnect().prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(hangId));
        rs = stmt.executeQuery();
        Hang h = null;
        while (rs.next()) {
        	int id = rs.getInt("idHang");
			int idDanhMuc = rs.getInt("idDanhMuc");
			String TenHang = rs.getString("TenHang");
            h = new Hang(id, idDanhMuc, TenHang);
        }
        return h;
    }
}
