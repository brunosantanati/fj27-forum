package br.com.alura.forum.validator.dto;

public class FieldErrorOutputDto {
	
	private String field;
	private String message;
	
	public FieldErrorOutputDto() { }
	
	public FieldErrorOutputDto(String field, String message) {
		this.field = field;
		this.message = message;
	}

	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
