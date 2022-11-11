package baotram.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import baotram.connection.DbCon;
import baotram.model.SanPham;

public class SanPhamDAO {
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private DbCon connectdb;

	public SanPhamDAO() {
		connectdb = new DbCon();
	}

	public ArrayList<SanPham> getSanPhamList(String hangId) {
		ArrayList<SanPham> list = new ArrayList<SanPham>();
		String sql = "SELECT * FROM sanpham WHERE idHang=?";
		try {
			stmt = connectdb.openConnect().prepareStatement(sql);
			stmt.setInt(1, Integer.parseInt(hangId));
			rs = stmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("idSanPham");
				int idHang = rs.getInt("idHang");
				String TenSP = rs.getString("TenSP");
				Double Gia = rs.getDouble("Gia");
				SanPham sp = new SanPham(id, idHang, TenSP, Gia);
				list.add(sp);
			}
		} catch (Exception e) {
			System.out.println("Please check getDanhMucList index.jsp in DanhMucDAO");
		}
		connectdb.closeConnect();
		return list;
	}
	
	public SanPham getSanPhamDetail(String sanPhamId) throws SQLException {
        String sql = "SELECT * FROM sanpham WHERE idSanPham=?";
        stmt = connectdb.openConnect().prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(sanPhamId));
        rs = stmt.executeQuery();
        SanPham sp = null;
        while (rs.next()) {
        	int id = rs.getInt("idSanPham");
			int idHang = rs.getInt("idHang");
			String TenSP = rs.getString("TenSP");
			Double Gia = rs.getDouble("Gia");
            sp = new SanPham(id, idHang, TenSP, Gia);
        }
        return sp;
    }
}
