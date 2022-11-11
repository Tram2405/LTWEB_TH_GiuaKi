package baotram.model;

public class Hang {
	private int idHang;
	private int idDanhMuc;
	private String TenHang;

	public Hang(int id, int idDanhMuc, String TenHang) {
		super();
		setIdHang(id);
		setIdDanhMuc(idDanhMuc);
		setTenHang(TenHang);
	}

	public int getIdHang() {
		return idHang;
	}

	public void setIdHang(int idHang) {
		this.idHang = idHang;
	}

	public int getIdDanhMuc() {
		return idDanhMuc;
	}

	public void setIdDanhMuc(int idDanhMuc) {
		this.idDanhMuc = idDanhMuc;
	}

	public String getTenHang() {
		return TenHang;
	}

	public void setTenHang(String tenHang) {
		TenHang = tenHang;
	}
}
