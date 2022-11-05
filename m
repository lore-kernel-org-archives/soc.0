Return-Path: <SRS0=c/41=3F=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844DEC4332F
	for <soc@archiver.kernel.org>; Sat,  5 Nov 2022 18:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 417A6C433C1; Sat,  5 Nov 2022 18:13:09 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3EF4C433D6;
	Sat,  5 Nov 2022 18:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3EF4C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9B4A85C008B;
	Sat,  5 Nov 2022 14:13:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Sat, 05 Nov 2022 14:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667671985; x=1667758385; bh=f2+D6Fd2MB
	rDAvM5rgGLYxZoJVv4Q2s4lizfG6wX8Rw=; b=aOj/eBmzmEgT3wUa5taBUlh6kT
	//WWPaDdzth9TWS5xirfLo0eH64IBY5KLuSP+iQ/lp+fzRrHcfknpdjugDvJ4QSc
	BUVEq7zkFvgHeXMKYbjOJXmCVm7eTVOOOJTxqWOWYG/EKpiFWO+0pOUaJ1excg0W
	OVAWRnrGOs9djiOGGyPO+ZtL8Mgg6oTHDJdvXnhDZEQpq6e4J2tgkzA/KUSLNTH/
	8jlJeFwZtqNvn7p1cUeZ72uPOmik0dBMwh2dt0hrbm40KVmC4dlMpWqZaSnMadkj
	gDWVtmqpFOrwZcIbKEEzVtWwxuPRe+BZzEr20r4mKorIXFnUodu+G1bP8HwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667671985; x=1667758385; bh=f2+D6Fd2MBrDAvM5rgGLYxZoJVv4
	Q2s4lizfG6wX8Rw=; b=q+ih9u08ckejnpHQ77tVzJORl/TgSlU1NRT5N7DuIFy9
	vmBOBWEPWmdZIYYnCJ55McNnkI/5S1MJNhZ8pm1hrTZo4ClFhhyy37atZJs56PX+
	WmydjB0vLhahDcU13G67elinca1WxstLUzQF9d2N7JRiP7l+vNTTGmp9fRKlgA2d
	CBWv6tIqYXP+1+3xa0USyQ/+0nNqVfrTQB221ObyKEa+44PRfOoeyCbfrKhFSjwc
	cL4bjW/jFypu0SA34+F7OQ4HJIfVbfFpSLL913xqGNSFhbcMgQt/67pdEoAIP203
	xZm7YqRS+FSUD7xGwrCYIuWbCexrI3g/UF8asObuvg==
X-ME-Sender: <xms:sadmY0C0WcosjXL8KeNr79SzEmoaBb_-KVoEj9Hh_N4us_Cgkm1MLw>
    <xme:sadmY2hbGbPh67dbuYRiMCho4Y7UXTVIOcbOXmm47AD7FAsAnWGAD2mXZHQNwOpVI
    pe5RTc4cyHihp2VnUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdefgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:sadmY3mzK3Vf5DvC-BPULmDzU7GHHvqhw9Q7KSZfyjNXg2YPrJQbng>
    <xmx:sadmY6yMSc0EqzYnb4x8hQkVY8v-HHC7s7WmVrAjYM2p6ExXthJLkg>
    <xmx:sadmY5Qxh4_MePxbUiuWx9RY92K0bA5EijUch-tJr8XJlBwuvFy09Q>
    <xmx:sadmY-JQLQcH9EBa8qJIAECfMb78IoHRF_-y-UWUSyxGQj8KDGpqig>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 003F3B603ED; Sat,  5 Nov 2022 14:13:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <b01b7fbf-7296-43e5-b751-4ceb7b4f84bd@app.fastmail.com>
In-Reply-To: <20221105060155.228348078@goodmis.org>
References: <20221105060024.598488967@goodmis.org>
 <20221105060155.228348078@goodmis.org>
Date: Sat, 05 Nov 2022 19:12:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Steven Rostedt" <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Stephen Boyd" <sboyd@kernel.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Viresh Kumar" <vireshk@kernel.org>,
 "Shiraz Hashim" <shiraz.linux.kernel@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4a 02/38] ARM: spear: Do not use timer namespace for
 timer_shutdown() function
Content-Type: text/plain

On Sat, Nov 5, 2022, at 07:00, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> A new "shutdown" timer state is being added to the generic timer code. One
> of the functions to change the timer into the state is called
> "timer_shutdown()". This means that there can not be other functions
> called "timer_shutdown()" as the timer code owns the "timer_*" name space.
>
> Rename timer_shutdown() to evt_timer_shutdown() to avoid this conflict.
>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

For arch/arm/mach-*

Acked-by: Arnd Bergmann <arnd@arndb.de>
