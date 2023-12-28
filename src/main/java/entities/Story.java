package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "stories")
public class Story implements Serializable {
	@Id
	private String storyId;

	private String storyName;

	private String image;

	private String authorName;

	private String description;

	private int status;

	private String categoryId;

	@OneToMany(mappedBy = "story", fetch = FetchType.EAGER, cascade = CascadeType.ALL)

	private List<Chapter> chapters;

	@ManyToOne(fetch = FetchType.EAGER) //

	@JoinColumn(name = "categoryId", insertable = false, updatable = false)

	private Category category;

	public Story() {
		super();
	}

	public Story(String storyId, String storyName, String image, String authorName, String description, int status,
			String categoryId, List<Chapter> chapters, Category category) {
		super();
		this.storyId = storyId;
		this.storyName = storyName;
		this.image = image;
		this.authorName = authorName;
		this.description = description;
		this.status = status;
		this.categoryId = categoryId;
		this.chapters = chapters;
		this.category = category;
	}

	public String getStoryId() {
		return storyId;
	}

	public void setStoryId(String storyId) {
		this.storyId = storyId;
	}

	public String getStoryName() {
		return storyName;
	}

	public void setStoryName(String storyName) {
		this.storyName = storyName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public List<Chapter> getChapters() {
		return chapters;
	}

	public void setChapters(List<Chapter> chapters) {
		this.chapters = chapters;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
