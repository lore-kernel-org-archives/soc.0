Return-Path: <SRS0=+t2a=3H=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB16BC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Nov 2022 05:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67FA3C43470; Mon,  7 Nov 2022 05:47:35 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AD5DC433C1
	for <soc@kernel.org>; Mon,  7 Nov 2022 05:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AD5DC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id z26so9652763pff.1
        for <soc@kernel.org>; Sun, 06 Nov 2022 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prS9/4s/KH6GPj6BklralGgu+34y9Wj2d+z0KXjiYNg=;
        b=SzjsIrzw1v55jU2Oh27QGJAFaSHzkaGfmUJje8fRkYwecxzETDSO8s/eE9nE2Ry+W5
         u3fXvOFSpd2PeKPfgvClreIVwft/lL9lFC29K5zkx4yLV1u4tn0vGmC7c8BDRh6cpms4
         p3sbTzW60pns4FnNb/5cB3cLOstJgTtH0RpDLbXmM+JupRX2hzjp47ZBQXKrrSVq+DV1
         59DdyBpi+lOE4DuXz+5O1NCeBonLXVrNfKtzTJ1p7YSj841kh50kmS+0u2l8g7yQnALE
         PLqPPfIdRBCOICNtvJHRTkynotSGNRmvYgLttIf+0m/LEztpAXjdwSSVE+2+qeY2p7EJ
         E6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prS9/4s/KH6GPj6BklralGgu+34y9Wj2d+z0KXjiYNg=;
        b=Ee7d1/o1So5e+70SCWag/fWkvxlrXmfqnBtjmIojtBN+28nrqaqHolOCQCHH9Bt8oF
         2WwzmdEJ/Oq/DtQTAgOXeHopwri8+y1AVBzXpF6+Jg1Gqj7n4Rfkq11bVw6aU9CDtZn0
         4K3P8aIUo0ACxUYE4cIZqrsraNGWBfRvfuOdAWqrJLsgiSynbiK2oB1rBvsFAjPNRQ1f
         4CVwwH4gfwJfSJ74Ej/k+dbguAwKzAIzeuVI1HpO7Nz/m8B3FDlPrvoSZZjqqsFstbwR
         dyiDOFGeEwP1R1edpH3XsnUI5EWKFk4byn0DR7E8I/k9ufoE98e+mYYdSbdkRS3RfJdj
         3w2w==
X-Gm-Message-State: ACrzQf0GXNjfF2gUdvfkqSxDNU4xK/xIEaXvzoISCH+EsiRz7HhzT8KQ
	8c/qOj6wK8/XKuvBYQzmOJlLpg==
X-Google-Smtp-Source: AMsMyM5iAjeBgfM0MTSjxIuXe3Y826zQ6iSKU6Vp04/YG3qFNpDgYyXt4Uj+7lL0T4Y3xhF++hsM5Q==
X-Received: by 2002:a63:4753:0:b0:462:b3f0:a984 with SMTP id w19-20020a634753000000b00462b3f0a984mr40732583pgk.501.1667800052857;
        Sun, 06 Nov 2022 21:47:32 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id e13-20020a170902d38d00b00186a437f4d7sm4025891pld.147.2022.11.06.21.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 21:47:32 -0800 (PST)
Date: Mon, 7 Nov 2022 11:17:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Russell King <linux@armlinux.org.uk>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5a 1/5] ARM: spear: Do not use timer namespace for
 timer_shutdown() function
Message-ID: <20221107054730.jngxacbdtzwhn77l@vireshk-i7>
References: <20221106054535.709068702@goodmis.org>
 <20221106054648.367234222@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106054648.367234222@goodmis.org>

On 06-11-22, 01:45, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> A new "shutdown" timer state is being added to the generic timer code. One
> of the functions to change the timer into the state is called
> "timer_shutdown()". This means that there can not be other functions
> called "timer_shutdown()" as the timer code owns the "timer_*" name space.
> 
> Rename timer_shutdown() to spear_timer_shutdown() to avoid this conflict.
> 
> Link: https://lore.kernel.org/all/20221105060155.228348078@goodmis.org/
> 
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: soc@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

I just replied to the previous version, ignore that now :)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks.

-- 
viresh
