package pack.user;

public class UserDTO {
	private String id;
	private String pwd;
	private String pwdc;
	private String name;
	private String age;
	private String gender;
	
	public UserDTO(String id, String pwd, String pwdc, String name, String age, String gender) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.pwdc = pwdc;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

	
	public UserDTO(String id, String pwd, String name, String age, String gender) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}



	public UserDTO(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwdc() {
		return pwdc;
	}

	public void setPwdc(String pwdc) {
		this.pwdc = pwdc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
