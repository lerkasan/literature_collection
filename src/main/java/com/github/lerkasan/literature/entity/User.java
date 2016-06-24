package com.github.lerkasan.literature.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity(name="user")
@NamedQuery(name="User.findAll", query="SELECT u FROM user u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	@Temporal(TemporalType.DATE)
	private Date birthday;

	private String email;

	private String familyName;

	private String givenName;

	private String password;

	private LocalDate registrationDate;

	private String username;

	//bi-directional many-to-one association to Category
	@OneToMany(mappedBy="user", cascade=CascadeType.PERSIST)
	private List<Category> categories;

	//bi-directional many-to-one association to Comment
	@OneToMany(mappedBy="user", cascade=CascadeType.PERSIST)
	private List<Comment> comments;

	//bi-directional many-to-one association to ItemToRead
	@OneToMany(mappedBy="user", cascade=CascadeType.PERSIST)
	private List<ItemToRead> itemsToRead;

	//bi-directional many-to-one association to Resource
	@OneToMany(mappedBy="user", cascade=CascadeType.PERSIST)
	private List<Resource> resources;

	//bi-directional many-to-one association to Country
	@ManyToOne
	@JoinColumn(name="countryId")
	private Country country;

	//bi-directional many-to-one association to UserGroup
	@ManyToOne
	@JoinColumn(name="userGroupId")
	private UserGroup userGroup;

	public User() {
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFamilyName() {
		return this.familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public String getGivenName() {
		return this.givenName;
	}

	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LocalDate getRegistrationDate() {
		return this.registrationDate;
	}

	public void setRegistrationDate(LocalDate registrationDate) {
		this.registrationDate = registrationDate;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Category addCategory(Category category) {
		getCategories().add(category);
		category.setUser(this);

		return category;
	}

	public Category removeCategory(Category category) {
		getCategories().remove(category);
		category.setUser(null);

		return category;
	}

	public List<Comment> getComments() {
		return this.comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public Comment addComment(Comment comment) {
		getComments().add(comment);
		comment.setUser(this);

		return comment;
	}

	public Comment removeComment(Comment comment) {
		getComments().remove(comment);
		comment.setUser(null);

		return comment;
	}

	public List<ItemToRead> getItemToReads() {
		return this.itemsToRead;
	}

	public void setItemToReads(List<ItemToRead> itemToReads) {
		this.itemsToRead = itemToReads;
	}

	public ItemToRead addItemToRead(ItemToRead itemToRead) {
		getItemToReads().add(itemToRead);
		itemToRead.setUser(this);

		return itemToRead;
	}

	public ItemToRead removeItemToRead(ItemToRead itemToRead) {
		getItemToReads().remove(itemToRead);
		itemToRead.setUser(null);

		return itemToRead;
	}

	public List<Resource> getResources() {
		return this.resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public Resource addResource(Resource resource) {
		getResources().add(resource);
		resource.setUser(this);

		return resource;
	}

	public Resource removeResource(Resource resource) {
		getResources().remove(resource);
		resource.setUser(null);

		return resource;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public UserGroup getUserGroup() {
		return this.userGroup;
	}

	public void setUserGroup(UserGroup userGroup) {
		this.userGroup = userGroup;
	}

}