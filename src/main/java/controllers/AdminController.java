package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.impl.CategoryDAOImpl;
import dao.impl.ChapterDAOImpl;
import dao.impl.StoryDAOImpl;
import entities.AccountDetails;
import entities.Category;
import entities.Chapter;
import entities.Story;

@Controller
@RequestMapping(value = "/quan-tri")
public class AdminController {
	@Autowired
	CategoryDAOImpl categoryDAO;
	@Autowired
	StoryDAOImpl storyDAO;
	@Autowired
	ChapterDAOImpl chapterDAO;

	@RequestMapping(value = { "", "/", "/trang-chu" }, method = RequestMethod.GET)
	public String index(Model model) {
		return "admin.dashboard";
	}

	@RequestMapping(value = { "/danh-muc-truyen" }, method = RequestMethod.GET)
	public String listCategory(Model model) {
		model.addAttribute("categories", categoryDAO.getAll());
		return "admin.category.list";
	}

	@RequestMapping(value = { "/danh-muc-truyen/them-moi" }, method = RequestMethod.GET)
	public String addCategory(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		return "admin.category.add";
	}

	@RequestMapping(value = { "/danh-muc-truyen/them-moi" }, method = RequestMethod.POST)
	public String insertCategory(Model model, @ModelAttribute("category") Category category) {
		try {
			categoryDAO.insert(category);
		} catch (Exception ex) {
			model.addAttribute("error", ex.getMessage());
			model.addAttribute("category", category);
			return "admin.category.add";
		}

		return "redirect:/quan-tri/danh-muc-truyen";
	}

	@RequestMapping(value = { "/danh-muc-truyen/chinh-sua" }, method = RequestMethod.GET)
	public String editCategory(Model model, @RequestParam("id") String id) {
		Category category = categoryDAO.getByID(id);
		model.addAttribute("category", category);
		return "admin.category.edit";
	}

	@RequestMapping(value = { "/danh-muc-truyen/chinh-sua" }, method = RequestMethod.POST)
	public String updateCategory(Model model, @ModelAttribute("category") Category category) {
		try {
			categoryDAO.update(category);
		} catch (Exception ex) {
			model.addAttribute("error", ex.getMessage());
			model.addAttribute("category", category);
			return "admin.category.edit";
		}

		return "redirect:/quan-tri/danh-muc-truyen";
	}

	@RequestMapping(value = "/danh-muc-truyen/xoa", method = RequestMethod.GET)

	public String deleteCategory(Model model, @RequestParam("id") String id) {
		categoryDAO.delete(id);
		return "redirect:/quan-tri/danh-muc-truyen";
	}

	@RequestMapping(value = { "/danh-sach-truyen" }, method = RequestMethod.GET)
	public String listStory(Model model, @RequestParam(name = "page", required = false) String page, @RequestParam(name = "keyword", required = false) String keyword) {
		if (keyword == null) {
			int pageNum = 1;
			int size = 3;
			int count = storyDAO.count();
			int maxPage = 0;
			if (count % size == 0)
				maxPage = count / size;
			else
				maxPage = count / size + 1;
			if (page != null)
				pageNum = Integer.parseInt(page);
			else
				pageNum = 1;

			model.addAttribute("stories", storyDAO.paging((pageNum - 1) * 3, size));
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("currentPage", pageNum);
			return "admin.story.list";
		}
		int pageNum = 1;
		int size = 3;
		int count = storyDAO.countSearch(keyword);
		int maxPage = 0;
		if (count % size == 0)
			maxPage = count / size;
		else
			maxPage = count / size + 1;
		if (page != null)
			pageNum = Integer.parseInt(page);
		else
			pageNum = 1;

		model.addAttribute("stories", storyDAO.pagingSearch(keyword,(pageNum - 1) * 3, size));
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("currentPage", pageNum);
		return "admin.story.list";
	}

	@RequestMapping(value = { "/danh-sach-truyen/them-moi" }, method = RequestMethod.GET)
	public String addStory(Model model) {
		Story story = new Story();
		model.addAttribute("story", story);
		List<Category> categories = categoryDAO.getAll();
		model.addAttribute("categories", categories);
		return "admin.story.add";
	}

	@RequestMapping(value = {
			"/danh-sach-truyen/them-moi" }, method = RequestMethod.POST, consumes = "multipart/form-data")
	public String insertStory(Model model, @ModelAttribute("story") Story story,
			@RequestParam(value = "files") MultipartFile[] files, HttpServletRequest req) {
		if (files.length > 0) {
			String uploadRootPath = req.getSession().getServletContext().getRealPath("images");
			File destination = new File(uploadRootPath + "/" + files[0].getOriginalFilename());
			try {
				files[0].transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			story.setImage("images/" + files[0].getOriginalFilename());
		}
		storyDAO.insert(story);
		return "redirect:/quan-tri/danh-sach-truyen";
	}

	@RequestMapping(value = { "/danh-sach-truyen/chinh-sua" }, method = RequestMethod.GET)
	public String editStory(Model model, @RequestParam("id") String id) {
		Story story = storyDAO.getByID(id);
		model.addAttribute("story", story);
		List<Category> categories = categoryDAO.getAll();
		model.addAttribute("categories", categories);
		return "admin.story.edit";
	}

	@RequestMapping(value = {
			"/danh-sach-truyen/chinh-sua" }, method = RequestMethod.POST, consumes = "multipart/form-data")
	public String updateStory(Model model, @ModelAttribute("story") Story story,
			@RequestParam(value = "files") MultipartFile[] files, HttpServletRequest req) {
		System.out.println(files.length);
		if (files.length > 0) {
			String uploadRootPath = req.getSession().getServletContext().getRealPath("images");
			File destination = new File(uploadRootPath + "/" + files[0].getOriginalFilename());
			try {
				files[0].transferTo(destination);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			if (files[0].getOriginalFilename().length() > 0)
				story.setImage("images/" + files[0].getOriginalFilename());
			else {
				story.setImage(storyDAO.getByID(story.getStoryId()).getImage());
			}
		} else {
			System.out.println("yes");
			story.setImage(storyDAO.getByID(story.getStoryId()).getImage());
		}
		storyDAO.update(story);
		return "redirect:/quan-tri/danh-sach-truyen";
	}

	@RequestMapping(value = "/danh-sach-truyen/xoa", method = RequestMethod.GET)
	public String deleteStory(Model model, @RequestParam("id") String id) {
		storyDAO.delete(id);
		return "redirect:/quan-tri/danh-sach-truyen";
	}

	@RequestMapping(value = "danh-sach-truyen/chi-tiet", method = RequestMethod.GET)
	public String detailsStory(Model model, @RequestParam("id") String id) {
		Story story = storyDAO.getByID(id);
		List<Chapter> chapters = chapterDAO.getByStory(id);
		model.addAttribute("story", story);
		model.addAttribute("chapters", chapters);
		return "admin.story.details";
	}

	@RequestMapping(value = { "danh-sach-truyen/chi-tiet/them-moi-chuong" }, method = RequestMethod.GET)
	public String addChapter(Model model, @RequestParam("storyId") String storyId) {
		Chapter chapter = new Chapter();
		chapter.setStoryId(storyId);
		model.addAttribute("chapter", chapter);
		return "admin.chapter.add";
	}

	@RequestMapping(value = { "danh-sach-truyen/chi-tiet/them-moi-chuong" }, method = RequestMethod.POST)
	public String insertChapter(Model model, @ModelAttribute("chapter") Chapter chapter) {
		chapter.setDateCreated(new Date());
		try {
			chapterDAO.insert(chapter);
		} catch (Exception ex) {
			model.addAttribute("error", ex.getMessage());
			model.addAttribute("chapter", chapter);
			return "admin.chapter.add";
		}
		String relink = "redirect:/quan-tri/danh-sach-truyen/chi-tiet?id=" + chapter.getStoryId();
		return relink;
	}
}
