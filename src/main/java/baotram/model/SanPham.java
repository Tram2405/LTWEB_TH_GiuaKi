package baotram.model;

public class SanPham {
	private int idSanPham;
	private int idHang;
	private String TenSP;
	private Double Gia;

	public SanPham(int id, int idHang, String TenSP, Double Gia) {
		super();
		setIdSanPham(id);
		setIdHang(idHang);
		setTenSP(TenSP);
		setGia(Gia);
	}

	public int getIdSanPham() {
		return idSanPham;
	}

	public void setIdSanPham(int idSanPham) {
		this.idSanPham = idSanPham;
	}

	public int getIdHang() {
		return idHang;
	}

	public void setIdHang(int idHang) {
		this.idHang = idHang;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}

	public Double getGia() {
		return Gia;
	}

	public void setGia(Double gia) {
		Gia = gia;
	}

}
