package com.hexincad.entity;

// default package
// Generated 2016-11-13 19:55:19 by Hibernate Tools 4.0.0.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * AcctRole generated by hbm2java
 */
@Entity
@Table(name = "acct_role", catalog = "work")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","acctUsers","acctAuthorities"})
public class AcctRole implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3133442994053431775L;
	private String id;
	private String name;
	private Set<AcctUser> acctUsers = new HashSet<AcctUser>(0);
	private Set<AcctAuthority> acctAuthorities = new HashSet<AcctAuthority>(0);

	public AcctRole() {
	}

	public AcctRole(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public AcctRole(String id, String name, Set<AcctUser> acctUsers, Set<AcctAuthority> acctAuthorities) {
		this.id = id;
		this.name = name;
		this.acctUsers = acctUsers;
		this.acctAuthorities = acctAuthorities;
	}

	@Id

	@Column(name = "id", unique = true, nullable = false, length = 36)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "acct_user_role", catalog = "work", joinColumns = {
			@JoinColumn(name = "role_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "user_id", nullable = false, updatable = false) })
	public Set<AcctUser> getAcctUsers() {
		return this.acctUsers;
	}

	public void setAcctUsers(Set<AcctUser> acctUsers) {
		this.acctUsers = acctUsers;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "acct_role_authority", catalog = "work", joinColumns = {
			@JoinColumn(name = "role_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "authority_id", nullable = false, updatable = false) })
	public Set<AcctAuthority> getAcctAuthorities() {
		return this.acctAuthorities;
	}

	public void setAcctAuthorities(Set<AcctAuthority> acctAuthorities) {
		this.acctAuthorities = acctAuthorities;
	}

}
