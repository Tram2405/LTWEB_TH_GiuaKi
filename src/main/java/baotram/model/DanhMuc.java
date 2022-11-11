package baotram.model;

public class DanhMuc {
	private int idDanhMuc;
	private String TenDM;

	public DanhMuc(int id, String tenDM) {
		super();
		setIdDanhMuc(id);
		setTenDM(tenDM);
	}

	public DanhMuc() {
	}

	public int getIdDanhMuc() {
		return idDanhMuc;
	}

	public void setIdDanhMuc(int idDanhMuc) {
		this.idDanhMuc = idDanhMuc;
	}

	public String getTenDM() {
		return TenDM;
	}

	public void setTenDM(String tenDM) {
		TenDM = tenDM;
	}
}
