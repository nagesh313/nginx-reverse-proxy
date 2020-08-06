package com.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

class TestObject {
	String applicationName;
	Date date;

	TestObject(String applicationName) {
		this.applicationName = "Hello from " + applicationName + " : " + UUID.randomUUID();
		this.date = new Date();
	}

	public String getApplicationName() {
		return applicationName;
	}

	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}

@RestController
public class ServiceController {
	@Value("${spring.application.name}")
	String applicationName;

	@RequestMapping("/api")
	public TestObject api() {
		return new TestObject(applicationName);
	}
}