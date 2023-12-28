package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
public class Category implements Serializable {

	@Id
	private String categoryId;
	
	private String categoryName;
	
	@OneToMany(mappedBy = "category",fetch = FetchType.LAZY,cascade=CascadeType.ALL)

	private List<Story> stories;

	public Category() {
		super();
	}

	public Category(String categoryId, String categoryName, List<Story> stories) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.stories = stories;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Story> getStories() {
		return stories;
	}

	public void setStories(List<Story> stories) {
		this.stories = stories;
	}

	
	
}
