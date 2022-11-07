Return-Path: <SRS0=+t2a=3H=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E8BC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 05:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0823C433D7; Mon,  7 Nov 2022 05:46:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8955C43141
	for <soc@kernel.org>; Mon,  7 Nov 2022 05:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8955C43141
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so13518674pjk.2
        for <soc@kernel.org>; Sun, 06 Nov 2022 21:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3O6nJYiSOnp6ov4FLvbHZ8pnu6HF5fNZ0WPiGV8NazE=;
        b=rAEI4Th/b82vKd0S/pe4KCZglgnjDd+X6p1UpwAvTPx/a0zOa0o9aBWYg2lB8N1Pms
         xW0jCu7lHH83MgADi1yWDiDCaiER6ret1LdyN0v6+8jqSA9DZc4dMU4WC0X3Mu1efXmm
         Cwgk1j9pGpizo1N/JlZa+D683evX6xdgdT2LhEabfIdnZVkRhkzVvuOwJ9uOy+QRVPEc
         oyELYAmIag1pANoSjv3HmsR3ypZsFOaZSOzizG3jCzZ0w61VINom2lnfA0FHnWonavXJ
         6LmFwySf+RAub6SyDP4WXoGetQHRZha6zDc80mlTwEE2llFddT+zC5hVuCzn7nguVPJh
         GJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O6nJYiSOnp6ov4FLvbHZ8pnu6HF5fNZ0WPiGV8NazE=;
        b=1DO9n9sScLDbzcChVbYgZRzgCy2gFhNYzAoPRLGw9NIqFHLR33DDEpvdYhcUcIgatt
         Ddt6V6awueKObr7OCd3toDtXFIHd3xCC+HQ4+ODYxtNyjg6KhPV556AmFXRzrHoFLNvn
         07r+71NPjoX4TUP4cBmWEWHaJXUMkMJMuXNf+OjR3/iMleX8Ks6RfQmR3f5qlAYMr/Py
         LEUhF1uddSeeTbbTPbdQdCfkoGW2rgR/ZO4yRrkUt1amSPDDBPD4JXAKLrUrxgQMYDB5
         jUVt+/VcgqyOAIZgMUJTS632zuu2gbdSdBZANRZ8f+8+v8OXQGmMkzIuxH8wGHagz4qD
         v7PA==
X-Gm-Message-State: ACrzQf0AlQmOqO1X5dOzb2j1KCB0Ycf/eKxdnhTEXNpM4CKjUFkXPiS2
	/5n83nDQ33FznA8/XiNhuedjbQ==
X-Google-Smtp-Source: AMsMyM4xVXSvqK7ym9fQ6l4LKmbvI4cK95YnKXzmptqsS/DTOvTiGJRWo85XBdzTE1u8b5zAv6VlGQ==
X-Received: by 2002:a17:90b:524f:b0:212:c22f:fbd1 with SMTP id sh15-20020a17090b524f00b00212c22ffbd1mr50915748pjb.155.1667799973215;
        Sun, 06 Nov 2022 21:46:13 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902dacf00b00179e1f08634sm4022649plx.222.2022.11.06.21.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 21:46:12 -0800 (PST)
Date: Mon, 7 Nov 2022 11:16:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Russell King <linux@armlinux.org.uk>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4a 02/38] ARM: spear: Do not use timer namespace for
 timer_shutdown() function
Message-ID: <20221107054610.o4h5xh3osy4tggej@vireshk-i7>
References: <20221105060024.598488967@goodmis.org>
 <20221105060155.228348078@goodmis.org>
 <20221105140553.GC1606271@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105140553.GC1606271@roeck-us.net>

On 05-11-22, 07:05, Guenter Roeck wrote:
> On Sat, Nov 05, 2022 at 02:00:26AM -0400, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > A new "shutdown" timer state is being added to the generic timer code. One
> > of the functions to change the timer into the state is called
> > "timer_shutdown()". This means that there can not be other functions
> > called "timer_shutdown()" as the timer code owns the "timer_*" name space.
> > 
> > Rename timer_shutdown() to evt_timer_shutdown() to avoid this conflict.
> > 
> > Cc: Viresh Kumar <vireshk@kernel.org>
> > Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> > Cc: Russell King <linux@armlinux.org.uk>
> > Cc: soc@kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> Nitpick: I would have called it spear_timer_shutdown(). POV, so

+1

Other than that:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
