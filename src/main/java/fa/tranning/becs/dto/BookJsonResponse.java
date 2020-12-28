/**
 * 
 */
package fa.tranning.becs.dto;

import java.util.List;

/**
 * @author USER
 *
 */
public class BookJsonResponse {
	private boolean validated;
	private List<String> errorMessages;
	public boolean isValidated() {
		return validated;
	}
	public void setValidated(boolean validated) {
		this.validated = validated;
	}
	public List<String> getErrorMessages() {
		return errorMessages;
	}
	public void setErrorMessages(List<String> errorMessages) {
		this.errorMessages = errorMessages;
	}
	
	
}
