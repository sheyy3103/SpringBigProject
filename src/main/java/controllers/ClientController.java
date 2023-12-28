package controllers;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.impl.CategoryDAOImpl;
import dao.impl.ChapterDAOImpl;
import dao.impl.StoryDAOImpl;
import entities.Chapter;

@Controller
public class ClientController {
	@Autowired
	CategoryDAOImpl categoryDAO;
	@Autowired
	StoryDAOImpl storyDAO;
	@Autowired
	ChapterDAOImpl chapterDAO;

	@RequestMapping(value = { "", "/" })
	public String index(Model model) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("stories", storyDAO.getAll());
		return "index";
	}

	@RequestMapping(value = { "/the-loai/{id}" })
	public String category(Model model, @PathVariable("id") String id) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("category", categoryDAO.getByID(id));
		model.addAttribute("stories", storyDAO.getByCategory(id));
		return "category";
	}

	@RequestMapping(value = { "/truyen-da-hoan-thanh" })
	public String status1(Model model) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("stories", storyDAO.getByStatus(0));
		model.addAttribute("status", 0);
		return "status";
	}

	@RequestMapping(value = { "/truyen-dang-tien-hanh" })
	public String status2(Model model) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("stories", storyDAO.getByStatus(1));
		model.addAttribute("status", 1);
		return "status";
	}

	@RequestMapping(value = { "/chi-tiet-truyen/{id}" })
	public String story(Model model, @PathVariable("id") String id) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("stories", storyDAO.getByStatus(1));
		model.addAttribute("story", storyDAO.getByID(id));
		model.addAttribute("chapters", chapterDAO.getByStory(id));
		return "story";
	}

	@RequestMapping(value = { "/tim-kiem-truyen" })
	public String search(Model model, @RequestParam("keyword") String keyword) {
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("stories", storyDAO.pagingSearch(keyword, 0, 100));
		return "index";
	}

	@RequestMapping(value = { "/chi-tiet-truyen/{storyId}/{chapterNo}" })
	public String chapter(Model model, @PathVariable("storyId") String storyId,
			@PathVariable("chapterNo") float chapterNo) {
		DecimalFormat df = new DecimalFormat("#,###.#");
		Chapter chapter = chapterDAO.getByChapterNo(storyId, chapterNo);
		model.addAttribute("categories", categoryDAO.getAll());
		model.addAttribute("story", storyDAO.getByID(storyId));
		model.addAttribute("chapter", chapter);
		model.addAttribute("max", chapterDAO.max(storyId));
		model.addAttribute("min", chapterDAO.min(storyId));
		float previous = (float) (chapterNo - 0.1);
		float next = (float) (chapterNo + 0.1);
		model.addAttribute("previous", df.format(previous));
		model.addAttribute("next",df.format(next));
		return "chapter";
	}
}
