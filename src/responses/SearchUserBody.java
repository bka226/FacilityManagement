package responses;

import com.fasterxml.jackson.annotation.JsonView;

import model.SearchUser;
import view.View;

public class SearchUserBody implements ResponseBody {
	@JsonView(View.Public.class)
	private SearchUser searchuser;

	public SearchUser getSearchuser() {
		return searchuser;
	}

	public void setSearchuser(SearchUser searchuser) {
		this.searchuser = searchuser;
	}
}
