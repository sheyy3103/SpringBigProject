package entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "chapters")
public class Chapter implements Serializable {
	
	@Id
	private String chapterId;
	
	private float chapterNo;
	
	private String title;
	
	private String content;
	
	@Temporal(value = TemporalType.DATE)
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	
	private Date dateCreated;
	
	private String storyId;
	
	@ManyToOne(fetch = FetchType.EAGER) //
	
	@JoinColumn(name = "storyId", insertable = false, updatable = false)
	
	private Story story;

	public Chapter() {
		super();
	}

	public Chapter(String chapterId, float chapterNo, String title, String content, Date dateCreated, String storyId,
			Story story) {
		super();
		this.chapterId = chapterId;
		this.chapterNo = chapterNo;
		this.title = title;
		this.content = content;
		this.dateCreated = dateCreated;
		this.storyId = storyId;
		this.story = story;
	}

	public String getChapterId() {
		return chapterId;
	}

	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}

	public float getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(float chapterNo) {
		this.chapterNo = chapterNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getStoryId() {
		return storyId;
	}

	public void setStoryId(String storyId) {
		this.storyId = storyId;
	}

	public Story getStory() {
		return story;
	}

	public void setStory(Story story) {
		this.story = story;
	}

	
}
