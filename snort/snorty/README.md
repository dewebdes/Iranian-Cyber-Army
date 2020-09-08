<h1>گیت هاب ارتش سایبری ایران</h1>
<h2>تقدیم به فرزندان باهوش ایران زمین</h2>
<img src="https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/1024b.jpg" />
<h1>چگونه یک سرویس فایروال بنویسیم</h1>

<p>
منظور از سرویس، برنامه ای است که علاوه بر سرور خود بتواند سرورهای مشتریان را ایمن کند، نوع جدیدی از آنتی ویروس ها و فایروال ها 
 که خدمات و رصد آنلاین و در لحظه ارائه می کنند، مانند برخی از برندهای کلودینگ
</p>  
<h3>مراحل عملیات</h3>
<p>
001. انتخاب سیستم عامل سرور
<br>
002. نصب و تنظیم سرور پراکسی
<br>
003. نصب و تنظیم سرویس آی دی اس
<br>
004. سفارشی سازی سرویس آی دی اس
<br>
005. نصب و تنظیمات دیتابیس
<br>
006. کد نویسی لایه محافظتی فایروال
<br>
007. کد نویسی لایه پدافند فایروال
<br>
008. تست فایروال
<br>
009.<a href='http://zedalert.com'> 
	کد نویسی لایه خدمات مشتری
	</a>
<p>
 
<h2>
001. انتخاب سیستم عامل سرور
</h2>
<p>
در این مقاله از سورس ها و نرم افزارهایی استفاده شده که هم  در ویندوز و هم لینوکس کار می کنند اما انتخاب 
مقاله سیتم عامل دبین در حالت مینیمال است
UBUNTU Server Minimal
 <br>
<img src='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/ubuntu.PNG' />
 
<p>
پسورد کاربر رووت رو عوض می کنیم
<br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/002.PNG' />
</p>

<p>
سیستم عامل را آپدیت می کنیم
<br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/004.PNG' />
</p>

<h2>
002. نصب و تنظیم سرور پراکسی
</h2>

<p>
نرم افزار اسکویید را نصب می کنیم
<br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/005.PNG' />
</p>

<p>
فایل کانفیگ اسکویید را ویرایش می کنیم و یک آی پی به عنوان اولین مشتری را تراستد می کنیم
<br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/006.PNG' />
 <br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/007.PNG' />
</p>

<p>
سرویس اسکویید رو ریست می کنیم و از سیستم مشتری به پراکسی متصل می شویم
<br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/008.PNG' />
 <br>
<img src='https://github.com/dewebdes/fereng/blob/master/hub/009.PNG' />
</p>

<h2>
003. نصب و تنظیم سرویس آی دی اس
</h2>
<p>
نصب نرم افزار اسنورت از طریق سورس کد
<br>
<img src='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/install.png' />
</p>

<h2>
004. سفارشی سازی سرویس آی دی اس
</h2>
<img src='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/logserver2.jpg' />
<p>
فایل 
<a href='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/sf_textlog.c'><b>sf_textlog.c</b></a>
 در مسیر
 <b>path-to-snort-2.9.16/src/sfutil</b>
 کپی و جایگزین کنید
<br>
فایل 
<a href='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/snort.conf'><b>snort.conf</b></a>
  دانلود و آی پی
 116.202.159.139
  را با آی پی سرور خود جایگزین کنید و  فایل ویرایش شده را
 
 در مسیر
 <b>path-to-snort-2.9.16/etc</b>
 کپی و جایگزین کنید
<br>
فایل 
<a href='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/rules.zip'><b>rules.zip</b></a>
  را دانلود و از حالت فشرده خارج کنید و پوشه 
  rules
  را با تمام محتویات در 
 در مسیر
 <b>path-to-snort-2.9.16/</b>
 کپی و جایگزین کنید
<br>

فایل 
<a href='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/rules.zip'><b>rules.zip</b></a>
  را دانلود و از حالت فشرده خارج کنید و پوشه 
  rules
  را با تمام محتویات در 
 در مسیر
 <b>path-to-snort-2.9.16/</b>
 کپی و جایگزین کنید
<br>

کد تابع زیر در فایل 
 sf_textlog.c 
 سفارشی شده و رشته لاگ ها به یک اسکریپت 
 <a href='https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/snort/snorty/db.py'>پایتون</a>
  که آنها را در یک دیتابیس مای اسکیو ال ذخیره میکند ارسال می شود

<code>
bool TextLog_Write (TextLog* this, const char* str, int len)
{
  	
  	

    int avail = TextLog_Avail(this);

    if ( len >= avail )
    {
    	printf("\nLIsten66:::%s\n",str);
	  	char* strx = unconstchar(str);
	  	char* cmd0 = "python3 /root/firewall/db.py addlog ";
	  	char* cmd2 = "TextLog_Write";
	  	
	  	char* repx = " ";
	  	char* withx = "---";
	  	char* strx2 = str_replace(strx, repx, withx);
	  	
	  	char* cmd1;
		cmd1 = malloc(strlen(cmd0)+1+strlen(strx2)); /* make space for the new string (should check the return value ...) */
		strcpy(cmd1, cmd0); /* copy name into the new var */
		strcat(cmd1, strx2); /* add the extension */
			
		char* cmd3;
		cmd3 = malloc(strlen(cmd1)+1+strlen(cmd2)); /* make space for the new string (should check the return value ...) */
		strcpy(cmd3, cmd1); /* copy name into the new var */
		strcat(cmd3, cmd2); /* add the extension */	
	    	
	  	system(cmd3);
	  	
	  	free(cmd0);
	  	free(strx);
	  	free(cmd1);
	  	free(cmd2);
	  	free(cmd3);
	  	free(repx);
	  	free(withx);
	  	free(strx2);
  	
        TextLog_Flush(this);
        avail = TextLog_Avail(this);
    }
    len = snprintf(this->buf+this->pos, avail, "%s", str);

    if ( len >= avail )
    {
        this->pos = this->maxBuf - 1;
        this->buf[this->pos] = '\0';
        return FALSE;
    }
    else if ( len < 0 )
    {
        return FALSE;
    }
    this->pos += len;
    return TRUE;
}

</code>

</p>
<p>
مجدد سورس را بیلد کنید
<code>
./configure --enable-sourcefire && make && sudo make install
</code>
	<br>
یک یوزر با نام 
snort 
بسازید و 
<br>
وارد  پوشه 
src 
می شویم و برنامه را اجرا می کنیم

<code>
cd path-to-snort-2.9.16/src
</code>
<code>
./snort -A console -i eth0 -u snort -g snort -c path-to-snort-2.9.16/etc/snort.conf
</code>  
</p>

<hr>
<a href='https://github.com/dewebdes/fereng/tree/master/hub'>
برای بخش های اضافه نشده  به این ریپوزیتوری مراجعه کنید
</a>
