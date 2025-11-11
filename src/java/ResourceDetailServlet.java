import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResourceDetailServlet")
public class ResourceDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String title = "";
        String date = "";
        String readTime = "";
        String image = "";
        String content = "";


if ("11".equals(id)) {
    title = "Karnataka: Domestic Workers Bill a Good Step, But Some Concerns Persist";
    date = "Nov 8, 2025";
    readTime = "4 Min Read";
    image = "images/i1.jpg";
    content = """
<p>While the Bill represents a crucial step towards recognizing domestic work as real work deserving of protection, its success hinges on sound financial planning and legislative coherence.</p>
<p>The bill seeks to ensure fair wages, working hours, and social security for domestic workers, but some concerns remain about enforcement and clarity on employer obligations. Stakeholders suggest continuous monitoring and amendments as necessary.</p>
<p>Overall, this legislation is a significant move toward formalizing domestic work, and its effectiveness will largely depend on robust regulatory mechanisms and awareness campaigns.</p>
""";
} else if ("1".equals(id)) {
    title = "India’s Crony Corporate State and the Anatomy of the Economy";
    date = "Sep 15, 2025";
    readTime = "3 Min Read";
    image = "images/r2.jpeg";
    content = """
<p>India’s crony economy thrives on the interdependence of politics and business interests. Major corporations benefit from regulatory advantages, subsidies, and preferential policies while smaller competitors struggle to compete.</p>
<p>This relationship impacts policy-making, market competition, and economic equality, ultimately shaping the nation’s economic landscape. Awareness and reforms are crucial to ensuring a fair and transparent system.</p>
""";
} else if ("2".equals(id)) {
    title = "US: People go Hungry as Trump Pours Millions into Politics";
    date = "May 27, 2025";
    readTime = "4 Min Read";
    image = "images/i2.jpeg";
    content = """
<p>The Trump administration continues to escalate its threats to social welfare while allocating vast sums of money for political campaigns and personal interests.</p>
<p>Many Americans face food insecurity and rising living costs. Analysts argue that policy focus should shift toward healthcare, nutrition, and community support rather than political spending.</p>
<p>Experts emphasize the need for balanced budget allocations and prioritizing the welfare of citizens over political maneuvers.</p>
""";
} else if ("3".equals(id)) {
    title = "South Korea: Trump Faces Protests Over Tariff War";
    date = "Sep 22, 2025";
    readTime = "5 Min Read";
    image = "images/i3.jpeg";
    content = """
<p>Trump, who is visiting South Korea to attend the APEC summit, faces widespread protests over trade tariffs and economic policies.</p>
<p>Citizens express concerns about the impact of trade conflicts on local businesses, employment, and the cost of living. Negotiations continue with global implications.</p>
<p>Observers note that peaceful protests are crucial for citizens to voice opinions and for governments to adjust policies that affect international trade and domestic stability.</p>
""";
} else if ("4".equals(id)) {
    title = "Bihar Elections: The Close Connection of Crime and Politics";
    date = "Jun 9, 2025";
    readTime = "3 Min Read";
    image = "images/i4.jpg";
    content = """
<p>Hundreds of candidates in the fray face criminal cases, raising questions about electoral transparency and governance.</p>
<p>The intersection of crime and politics affects voter confidence and challenges the legal system to ensure fair elections.</p>
<p>Civil society organizations urge for reforms, stricter candidate vetting, and public awareness campaigns to strengthen democracy and accountability.</p>
""";
}


else if ("101".equals(id)) { // Event 1: Convene Florida 2026
    title = "Convene: Florida 2026";
    date = "Mar 3 - 4, 2026";
    readTime = "Onsite Event";
    image = "images/u1.jpg";
    content = """
<h3>Onsite Event</h3>
<p><strong>Event date:</strong> Mar 3, 2026 | <span style='color:#008000;'>4 months FROM NOW</span></p>

<h2>Convene: Florida 2026</h2>
<p>At the Intersection of People and Security. March 3 - 4, 2026.</p>

<p><strong>Time left to Convene: Florida 2026</strong><br>
4 months<br>
9 days</p>

<p>Built by and for the community of professionals who care about people, culture and the real-world impact of security, Convene is your conference.</p>
<p>Learn from experts about the latest in security awareness, phishing campaigns, social engineering, behavioral science, managing human risk and more exciting topics!</p>

<p>The National Cybersecurity Alliance welcomes you to join peers who are tackling human risk from every angle – in the workplace, at home and in the community. Join us and connect, share and Convene.</p>

<p>Across two days, you’ll hear fresh perspectives that move beyond the basics, from preventing sextortion to the ins and outs of simulated phishing...</p>

<p><strong>The Venue & Hotel</strong><br>
Sheraton Sand Key<br>
1160 Gulf Blvd, Clearwater Beach, FL 33767<br>
Book your room by February 13th to receive a special discounted rate of $199/night plus applicable fees here.
</p>
<table style="border-collapse: collapse; width: 100%; margin-bottom: 16px; border: 1px solid #ccc; font-family: Arial, sans-serif;">
  <thead>
    <tr style="background-color: #f8f8f8;">
      <th style="padding: 12px 16px; text-align: left; font-size: 16px;">Dates</th>
      <th style="padding: 12px 16px; text-align: left; font-size: 16px;">Cost</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 12px 16px; line-height: 1.6;">
        Super Early Bird Tickets<br>October 6 - 31, 2025
      </td>
      <td style="padding: 12px 16px; line-height: 1.6;">$399</td>
    </tr>
    <tr style="background-color: #fafafa;">
      <td style="padding: 12px 16px; line-height: 1.6;">
        Early Bird Tickets<br>November 1 - December 15, 2025
      </td>
      <td style="padding: 12px 16px; line-height: 1.6;">$449</td>
    </tr>
    <tr>
      <td style="padding: 12px 16px; line-height: 1.6;">
        Standard Tickets<br>December 16, 2025 - February 15, 2026
      </td>
      <td style="padding: 12px 16px; line-height: 1.6;">$499</td>
    </tr>
    <tr style="background-color: #fafafa;">
      <td style="padding: 12px 16px; line-height: 1.6;">
        Last-Minute Tickets<br>February 16 - March 2, 2026
      </td>
      <td style="padding: 12px 16px; line-height: 1.6;">$520</td>
    </tr>
  </tbody>
</table>
<p>For group, nonprofit, or government discounts — contact <a href="mailto:allie@staysafeonline.org">allie@staysafeonline.org</a></p>

<p><a href="https://www.eventbrite.com/" target="_blank" style="color:red;font-weight:bold;text-decoration:none;">🎟 Get your ticket to Convene!</a></p>
""";

    
    
    
    
} else if ("102".equals(id)) { // Event 2: Cybersecurity Awareness Month
    title = "Cybersecurity Awareness Month Virtual Kick-off";
    date = "Oct 1, 2025";
    readTime = "Virtual Event";
    image = "images/u2.jpg";
    content = """
<h3>Virtual Event</h3>
<p><strong>Event date:</strong> Oct 1, 2025 | <span style='color:#c00;'>3 weeks AGO</span></p>

<h2>Cybersecurity Awareness Month Virtual Kick-off</h2>
<p>In honor of Cybersecurity Awareness Month.</p>

<p><strong>Webinar Available On-Demand</strong><br>Event Concluded</p>

<p>For more than two decades, Cybersecurity Awareness Month has been dedicated to teaching everyone how to stay safe and secure online...</p>

<p>Join the National Cybersecurity Alliance as we kick off Cybersecurity Awareness Month 2025 with government and industry leadership to explore recent and emerging federal initiatives, AI, and national security challenges.</p>

<p><strong>Sponsorships</strong><br>
Contact <a href="mailto:Max@staysafeonline.org">Max@staysafeonline.org</a> to learn more.
</p>

<p><a href="https://www.eventbrite.com/" target="_blank" style="color:red;font-weight:bold;text-decoration:none;">🎟 Book Your Event Ticket</a></p>
""";
}
        
        
        
        
else if ("201".equals(id)) {
            title = "Cybersecurity Tips for College Students";
            date = "Aug 18, 2025";
            readTime = "7 Min Read";
            image = "images/seca1.jpg";
            content = """
<h3>Cybersecurity Tips for College Students</h3>
<p>Between classes, clubs, jobs, homework, and the occasional nap, today's college students juggle a lot...</p>
<p><strong>1. Don’t sleep on your school email</strong><br>
Your .edu email address serves as a gateway to your accounts and data...</p>
<p><strong>2. Use strong, unique passwords</strong><br>
Never reuse the same password for multiple accounts...</p>
<p><strong>3. Turn on MFA</strong><br>
Adds an extra layer of security like a door bolt...</p>
<p><strong>4. Watch for scams</strong><br>
Phishing and fake DMs can happen anywhere...</p>
<p><strong>5. Keep devices updated</strong><br>
Updates fix critical security flaws...</p>
<p><strong>6. Backup your stuff</strong><br>
Use Google Drive or external hard drives...</p>
<p><strong>7. Lock your devices</strong><br>
Always secure your laptop and phone...</p>
<p><strong>8. Clean up your digital footprint</strong><br>
Review your privacy settings and delete old accounts...</p>
<p><strong>9. Know where to get help</strong><br>
Your school IT team is there for support...</p>
<p><strong>10. Be smart with AI</strong><br>
Use AI wisely — not for cheating!</p>
""";
        }

        else if ("202".equals(id)) {
            title = "The Evolution of Ethical Hacking: From Curiosity to Cybersecurity";
            date = "Aug 15, 2024";
            readTime = "4 Min Read";
            image = "images/seca3.jpg";
            content = """
<h3>The Evolution of Ethical Hacking</h3>
<p>The term 'ethical hacking' was coined in 1995 by IBM VP John Patrick, but its history goes much deeper...</p>
<p><strong>The Birth of the Hacker:</strong> In the 1960s, hacking meant optimizing systems creatively at MIT...</p>
<p><strong>Phreakers and Tiger Teams (1970s):</strong> Phone hackers explored telecom networks...</p>
<p><strong>The Rise of Black Hat Hackers:</strong> In the 1980s–90s, hacking became linked to cybercrime...</p>
<p><strong>Cybercrime Today:</strong> In 2023, global losses exceeded $12.5 billion...</p>
<p><strong>The Renaissance of Ethical Hackers:</strong> Professionals now protect systems legally...</p>
<p><strong>How Ethical Hackers Safeguard Businesses:</strong> Penetration testing and vulnerability scanning are key...</p>
<p><strong>Conclusion:</strong> Ethical hackers play a vital role in keeping the digital world safe.</p>
""";
        }
 
 else if ("203".equals(id)) {
    title = "How to Be an Awesome Cyber Mentor";
    date = "Jul 30, 2024";
    readTime = "6 Min Read";
    image = "images/seca4.jpg";
    content = """
<h3>How to Be an Awesome Cyber Mentor</h3>
<p><strong>Careers and Education</strong></p>
<p>Help close the cyber workforce gap by mentoring the next generation.</p>

<p>There is an extreme need for more workers in cyber, privacy, risk, and related fields. You might be aware of this – maybe a position at your organization has gone unfilled for a long time. Did you know you can do something about this (and it doesn't involve taking on two full-time jobs)?</p>

<p><strong>Become a mentor.</strong> With a few hours of time per year, you can help shape, educate, and prepare the next generation of cyber workers. You can help close the gap, and you might even help launch the career of someone who never pictured themselves in this industry.</p>

<p>Here's what the average mentee will expect of you:</p>
<ul>
<li>1–2 hours of your time per month</li>
<li>Some communication every so often</li>
<li>A willing attitude</li>
</ul>

<p>Not very demanding, is it? We'll break down some more details of mentorship and help you get started today.</p>

<h4>You can empower the next generation</h4>
<p>The internet is deeply integrated into our lives, yet poor security and privacy habits persist across age groups. You can have a hand in how the industry evolves by mentoring others.</p>

<p>The industry needs more pathways to welcome new talent. Mentorship widens that road. The field needs not only computer scientists but also communicators, marketers, designers, and writers. By becoming a mentor, you can help guide those with unique skills into cyber—even if they never imagined being here.</p>

<h4>What makes for a good mentor</h4>
<ol>
<li><strong>At least 3 years of professional experience.</strong> Mentees expect practical insight from your work experience. If you’re new, consider finding your own mentor first.</li>
<li><strong>1–2 hours per month.</strong> Schedule regular meetings—monthly works great. Respect your time and theirs. Mentorship doesn’t have to be formal, but it should be consistent.</li>
<li><strong>Passion for the industry.</strong> Be positive, kind, and encouraging. Your enthusiasm will inspire your mentee more than you think.</li>
</ol>

<h4>The mentor experience</h4>
<p>Every mentorship is unique. You might mentor a student or someone switching careers. Your goal: help them define career goals and take clear steps toward them. It’s not about giving them a job—it’s about helping them grow.</p>

<h4>You could get a mentor!</h4>
<p>Even seasoned professionals have mentors. If you’re early in your career, find someone to guide you. Mentorship helps at every level, from entry-level to CEO.</p>

<h4>Where to find someone to mentor</h4>
<p>You can find mentees on LinkedIn, through your network, or via mentorship programs. The National Cybersecurity Alliance also has an HBCU mentorship program connecting experienced mentors with aspiring professionals.</p>

<h4>Get involved right now</h4>
<p>Mentorship only takes a few hours but can shape someone’s entire career. Your advice can ripple through generations of cybersecurity professionals.</p>
""";
}

else if ("204".equals(id)) {
    title = "6 Cybersecurity Certifications Worth Exploring";
    date = "Sep 22, 2025";
    readTime = "5 Min Read";
    image = "images/seca5.jpg";
    content = """
<h3>6 Cybersecurity Certifications Worth Exploring</h3>
<p><strong>Careers and Education</strong></p>
<p>Cybersecurity certifications can take time and cost money – use this guide to level up your career smartly!</p>

<p>Whether you’re just starting out or already a pro, certifications can help you get the job and salary you deserve. Let’s explore some of the top certifications, who they’re for, and why they matter.</p>

<h4>1. CompTIA Security+</h4>
<p><strong>What it is:</strong> Entry-level certification covering basics of network security, compliance, threats, and risk management.</p>
<p><strong>Who it’s for:</strong> Beginners or IT professionals transitioning into security.</p>
<p><strong>Why it’s valuable:</strong> Globally recognized, no formal prerequisites, great first step for newcomers.</p>

<h4>2. (ISC)² CISSP</h4>
<p><strong>What it is:</strong> One of the most prestigious certifications for cybersecurity leaders and managers.</p>
<p><strong>Who it’s for:</strong> Experienced professionals aiming for roles like CISO or security manager.</p>
<p><strong>Why it’s valuable:</strong> Gold-standard credential requiring 5 years of experience. Globally respected for deep expertise.</p>

<h4>3. GIAC GSEC</h4>
<p><strong>What it is:</strong> Proves understanding of information security concepts like cryptography, defense in depth, and authentication.</p>
<p><strong>Who it’s for:</strong> IT professionals moving toward security roles.</p>
<p><strong>Why it’s valuable:</strong> Vendor-neutral, mid-level credential that adds credibility and skill recognition.</p>

<h4>4. Offensive Security OSCP</h4>
<p><strong>What it is:</strong> A hands-on certification focused on penetration testing. Known for its 24-hour practical exam.</p>
<p><strong>Who it’s for:</strong> Penetration testers, red team members, or ethical hackers.</p>
<p><strong>Why it’s valuable:</strong> Real-world hacking skills, globally respected, demonstrates deep technical expertise.</p>

<h4>5. ISACA CISA</h4>
<p><strong>What it is:</strong> Focuses on IT auditing, control, and assurance. Ideal for professionals in governance, compliance, or risk.</p>
<p><strong>Who it’s for:</strong> IT auditors, compliance officers, risk managers.</p>
<p><strong>Why it’s valuable:</strong> Recognized worldwide, especially in finance, healthcare, and government.</p>

<h4>6. GIAC GCIH</h4>
<p><strong>What it is:</strong> Focuses on detecting, responding to, and handling cyber incidents.</p>
<p><strong>Who it’s for:</strong> Security professionals in incident response or SOC environments.</p>
<p><strong>Why it’s valuable:</strong> Proves you can handle real cyberattacks and coordinate responses effectively.</p>

<h4>Bottom line: Which certification is right for you?</h4>
<ul>
<li>Beginners: <strong>CompTIA Security+</strong></li>
<li>IT professionals entering security: <strong>GSEC</strong></li>
<li>Leaders: <strong>CISSP</strong></li>
<li>Auditors: <strong>CISA</strong></li>
<li>Incident responders: <strong>GCIH</strong></li>
<li>Pen testers: <strong>OSCP</strong></li>
</ul>

<p>Remember: certifications aren’t just badges — they represent your skills, dedication, and growth in cybersecurity.</p>
""";
}

else if ("205".equals(id)) {
    title = "How To Write a Cyber Resume and LinkedIn That Gets Results";
    date = "Feb 3, 2025";
    readTime = "4 Min Read";
    image = "images/seca6.jpg";
    content = """
<h3>How To Write a Cyber Resume and LinkedIn That Gets Results</h3>
<p><strong>Careers and Education</strong></p>

<p>Looking for a cybersecurity job? Your resume and LinkedIn profile are your first impression. Here’s how to make them stand out.</p>

<h4>Tips for a great cybersecurity resume</h4>
<ol>
<li><strong>Keep it simple and clear:</strong> Use short sections, bullet points, and a clean layout. Avoid long paragraphs.</li>
<li><strong>Focus on relevant skills:</strong> List recent experience, projects, and certifications. Include even small internships.</li>
<li><strong>Tailor it to the job:</strong> Use keywords from the job posting and emphasize tools like SIEM, Python, or ethical hacking.</li>
<li><strong>Use numbers:</strong> Write results like “Reduced phishing attacks by 30%” or “Detected 100+ threats per week.”</li>
<li><strong>Proofread:</strong> No spelling mistakes — recruiters notice.</li>
</ol>

<h4>How to optimize your LinkedIn</h4>
<ol>
<li><strong>Use keywords:</strong> Add cybersecurity terms like “SOC Analyst,” “Penetration Testing,” or “Incident Response.”</li>
<li><strong>Strong headline and summary:</strong> Example – “Cybersecurity Analyst | SIEM | Threat Intelligence.”</li>
<li><strong>Engage with the community:</strong> Like, comment, and share security posts to grow visibility.</li>
<li><strong>Build a network:</strong> Connect with professionals politely. Send personalized messages.</li>
</ol>

<p>Remember: A well-structured resume and LinkedIn profile open doors. Let your skills shine, and let your achievements speak for you!</p>
""";
}

else if ("206".equals(id)) {
    title = "Cyber Groups with Local Chapters You Can Join Today!";
    date = "Jan 28, 2025";
    readTime = "6 Min Read";
    image = "images/seca2.jpg";
    content = """
<h3>Cyber Groups with Local Chapters You Can Join Today!</h3>
<p><strong>Careers and Education</strong></p>
<p>Cybersecurity is a community. Here are 10 great groups to connect, learn, and grow your career.</p>

<h4>1. ISC²</h4>
<p>Known for certifications like CISSP, ISC² chapters offer networking and education opportunities globally.</p>

<h4>2. Convene</h4>
<p>National Cybersecurity Alliance’s own in-person event held twice a year—connecting people and ideas across the country.</p>

<h4>3. ISACA</h4>
<p>Perfect for those in IT governance, risk management, and auditing. Offers workshops and certifications.</p>

<h4>4. OWASP</h4>
<p>Focuses on web application security. Offers free tools, workshops, and open-source projects for learners.</p>

<h4>5. ISSA</h4>
<p>Affordable membership for cybersecurity professionals with great educational events and research access.</p>

<h4>6. WiCyS</h4>
<p>Women in CyberSecurity – a supportive network offering mentorship and professional growth for women in cyber.</p>

<h4>7. CSA</h4>
<p>Cloud Security Alliance – dedicated to cloud computing safety. Perfect for cloud security learners and experts.</p>

<h4>8. InfraGard</h4>
<p>A partnership between the FBI and private sector to protect national infrastructure. Requires U.S. citizenship.</p>

<h4>9. FIRST</h4>
<p>Connects global incident response teams to share strategies and improve collaboration.</p>

<h4>10. SANS Institute</h4>
<p>Offers top-tier cybersecurity training, forums, and community discussions for professionals at all levels.</p>

<h4>Why join a cybersecurity group?</h4>
<ul>
<li>Networking opportunities</li>
<li>Education and training</li>
<li>Career growth</li>
<li>Community support</li>
</ul>

<p>Remember: Cyber is a team sport. Join a professional group today and stay connected in your security journey!</p>
""";
}





else if ("207".equals(id)) {
    title = "Trump Threatens War on Nigeria to ‘Save’ ‘Our CHERISHED Christians’";
    date = "Nov 5, 2025";
    readTime = "4 Min Read";
    image = "images/207.jpg";
    content = """
<h3>Trump Threatens War on Nigeria to ‘Save’ ‘Our CHERISHED Christians’</h3>
<p>“We know the heart and intent of Trump is to help us fight insecurity,” analysts say. The statement has sparked controversy both domestically and internationally.</p>
<p>Experts argue that international intervention based on political motives can escalate tensions and lead to unintended consequences.</p>
<p>The situation is developing, and observers continue to monitor statements from both the US and Nigerian governments.</p>
""";
} else if ("208".equals(id)) {
    title = "Paper to Metal? New Currency Trends Challenge Dollar’s Reign";
    date = "Nov 1, 2025";
    readTime = "3 Min Read";
    image = "images/208.jpg";
    content = """
<h3>Paper to Metal? New Currency Trends Challenge Dollar’s Reign</h3>
<p>Long dismissed as an anachronistic store of value, gold is reasserting its primacy amid monetary uncertainty.</p>
<p>Central banks and investors are exploring alternative assets as hedges against inflation and currency instability.</p>
<p>Analysts warn that shifting global confidence in the US dollar could have broad implications for trade and financial markets.</p>
""";
} else if ("209".equals(id)) {
    title = "Grasping SC’s Interim Intervention in the Waqf Amendments, 2025";
    date = "Oct 28, 2025";
    readTime = "5 Min Read";
    image = "images/209.jpg";
    content = """
<h3>Grasping SC’s Interim Intervention in the Waqf Amendments, 2025</h3>
<p>Be it on the issue of the disproportionately stringent control over the Islamic institution of Waqf (as compared to the administration of Hindu muths or temples), the Supreme Court has stepped in with an interim order.</p>
<p>The court emphasized balancing community rights with governance reforms, suggesting more inclusive consultation before any major changes.</p>
<p>Legal scholars suggest this could set a precedent for future interventions in religious institution governance.</p>
""";
} else if ("210".equals(id)) {
    title = "10 Lies US Ambassador Told UN About Cuba Blockade";
    date = "Oct 20, 2025";
    readTime = "6 Min Read";
    image = "images/210.jpg";
    content = """
<h3>10 Lies US Ambassador Told UN About Cuba Blockade</h3>
<p>Ahead of the UN vote on the US-imposed blockade on Cuba, the US once again spread misleading statements about the nature and intent of its coercive policy.</p>
<p>Multiple international reports contradict the ambassador’s statements, highlighting the humanitarian and economic impact on Cuban citizens.</p>
<p>Experts suggest the debate reflects ongoing tensions in international diplomacy and the challenges of holding nations accountable on global platforms.</p>
""";
}







else if ("211".equals(id)) {
    title = "Protecting Your Devices from Malware and Viruses";
    date = "Jul 30, 2025";
    readTime = "4 Min Read";
    image = "images/firsta1.jpg";
    content = """
<h3>Protecting Your Devices from Malware and Viruses</h3>
<p><strong>Online Safety and Privacy</strong></p>
<p>Devices today are constantly at risk from malware and viruses. Follow these strategies to stay safe:</p>

<h4>Install security software</h4>
<p>Use trusted antivirus and anti-malware programs and keep them updated.</p>

<h4>Update regularly</h4>
<p>Apply operating system and software updates to patch security vulnerabilities.</p>

<h4>Avoid suspicious downloads</h4>
<p>Only download apps and files from trusted sources.</p>

<h4>Be careful with email attachments</h4>
<p>Do not open unexpected attachments or click links from unknown senders.</p>

<h4>Use strong passwords and 2FA</h4>
<p>Protect accounts that can install or access your devices.</p>

<p>Consistent security practices help prevent infections and protect your personal data.</p>
""";
}

else if ("212".equals(id)) {
    title = "Safe Practices for Social Media Use";
    date = "Jul 15, 2025";
    readTime = "5 Min Read";
    image = "images/firsta2.jpg";
    content = """
<h3>Safe Practices for Social Media Use</h3>
<p><strong>Online Safety and Privacy</strong></p>
<p>Social media is a great way to connect, but it can also expose you to privacy and security risks. Follow these best practices:</p>

<h4>Check privacy settings</h4>
<p>Adjust settings to control who can see your posts, friend lists, and personal info.</p>

<h4>Think before sharing</h4>
<p>Avoid posting sensitive information like home address, phone number, or financial details.</p>

<h4>Be skeptical of friend requests</h4>
<p>Verify unknown contacts before accepting them.</p>

<h4>Use strong, unique passwords</h4>
<p>Consider a password manager to keep track of different accounts.</p>

<h4>Enable two-factor authentication</h4>
<p>Add an extra layer of protection against unauthorized access.</p>

<h4>Monitor your accounts</h4>
<p>Look out for unusual activity and report suspicious messages immediately.</p>

<p>Safe social media habits protect your privacy, prevent scams, and help you enjoy online connections securely.</p>
""";
}


        request.setAttribute("title", title);
        request.setAttribute("date", date);
        request.setAttribute("readTime", readTime);
        request.setAttribute("image", image);
        request.setAttribute("content", content);

        // Forward to JSP
        request.getRequestDispatcher("resource_details.jsp").forward(request, response);
    }
}
