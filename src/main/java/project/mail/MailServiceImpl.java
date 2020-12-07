package project.mail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Async
	@Override
	public boolean send(String subject, String text, String to) {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom("IMFARMERS");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setTo(to);
			
			javaMailSender.send(message);
			return true;
		} catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;			
	}
}
