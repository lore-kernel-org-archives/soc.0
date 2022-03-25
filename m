Return-Path: <SRS0=TMVL=UE=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F5AC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Mar 2022 01:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79519C340EC; Fri, 25 Mar 2022 01:58:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F9A7C340ED
	for <soc@kernel.org>; Fri, 25 Mar 2022 01:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F9A7C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id b8so6265351pjb.4
        for <soc@kernel.org>; Thu, 24 Mar 2022 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7UqoxnexRZIYgAmaCT2NR/FFNg3pbUIhHD5KY1C8P0o=;
        b=avCYBKKvdypfuoJNrbhAIMEIcgShk1Zj1USbl3poWtUPT8Bet+mLntrgUKSMss/bh6
         92lgLD5ty7Pdq2r9sxykimbuw1qTH9fvdhiAjnHYjB/W8osj/rVq5wbl3n9tcv2BA4ym
         ytk27+4wen2ceHQDcHck6NQ0n4dBzYM7zcNmfIJzgfuHIkChyjz4TZOlLwwnUxNLiUmv
         LWI4lHe13uN83Zd7vyAzK0YSK8nvZ2DiCIdcEkJO6nUUYIz+2md2TtyEYb3Qza6OaiZq
         rokEQhRpK7j/KhCyzhJN7vZgMxaH0wLvz4q0m+9K9qWhvhLxw7JbzOnLYEPw9wcoKEFd
         iRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7UqoxnexRZIYgAmaCT2NR/FFNg3pbUIhHD5KY1C8P0o=;
        b=XKbbMQFgi/Zj2ww/Znde0VnLazV3KuJeBuq4DHV6D08cFrAGctvc2YIaATCHuJvGVv
         BsRAtD+c/BmB0KRcfE4N6M0Ec9aytWOVZwMGS1AciEBa5z++9wD86NbkDEu4+ka+1iwr
         SYFkIusPQ4bbSJLyuRShQCrc4mWnNMuZdoiovtAo1SkxneqOiLnHcYoNp6FoOphwmX/K
         D7s7IJEjG0iJH6crOHHTKs9mL5U4LzG6q1ZJP4sN+/QzHRrTFddAANikXO1Y5wdRuga7
         xq+jVBmwcqhOtkqn0ZPzSFqgviaH6b+omsRPSzu9/+n2UByupcZPhzsGJBZoqqyscBsy
         KdUA==
X-Gm-Message-State: AOAM531pLqR+3OJ3txktolQg71xMVmCgrRNK6Pqggawiq20+FC3Fo7sy
	MdT2JVZ8kAeG0E/hVoI68AoMIw==
X-Google-Smtp-Source: ABdhPJxZJhn3xGpOGCemBqjUHadgwgd6nBeVTCB5L3NUi0Odrw/tF5FzN0TXzKmg1SnC8nj7Jbx6zQ==
X-Received: by 2002:a17:902:e801:b0:154:19ec:53a2 with SMTP id u1-20020a170902e80100b0015419ec53a2mr8886398plg.151.1648173532485;
        Thu, 24 Mar 2022 18:58:52 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id l185-20020a6388c2000000b0038614ed80c0sm3931676pgd.41.2022.03.24.18.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 18:58:51 -0700 (PDT)
Date: Fri, 25 Mar 2022 07:28:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220325015849.sazvlevnvdqj5z42@vireshk-i7>
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
 <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>
 <20220324062547.GA15504@9a2d8922b8f1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324062547.GA15504@9a2d8922b8f1>
User-Agent: NeoMutt/20180716-391-311a52

On 24-03-22, 11:55, Kuldeep Singh wrote:
> Fixed order of values is important in case of properties like
> compatibles etc. In case of dma-names, yes order shouldn't matter here.
> 
> This patch is more of appeasing dtbs_check warning rather than fixing
> something.

Exactly my point. We have seen similar type of issues with other tools, like
coccinelle, earlier and such patches were rejected as the kernel was just fine
and tooling needs to be fixed.

> It's safe to go with this patch.
> I am not sure if there's a provision to exclude dma-names from fix
> ordering checks. Rob can help here in providing better insights.

-- 
viresh
