Return-Path: <SRS0=zIQU=UA=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15407C433EF
	for <soc@archiver.kernel.org>; Mon, 21 Mar 2022 05:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6D1EC340F0; Mon, 21 Mar 2022 05:11:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E084FC340E8
	for <soc@kernel.org>; Mon, 21 Mar 2022 05:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E084FC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id w4so11708350ply.13
        for <soc@kernel.org>; Sun, 20 Mar 2022 22:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ljtCtXdVDHvboQzqZn2Q/lABoXg83zrD6bjOe7HHLFQ=;
        b=zfrmFyu/ZYdoUki2x8lfXqzA+xFOfDNne30+A0kuctzZXnrUfD659CDieFanTrv3ym
         h7/+Mi9WRZ8kPZXyA2Y27+TEoVcM3QsxC8yjssKaQgYIvuKCwEYlB3Wnyfr4cFQyTaK1
         nZ4s7AJMu7uVqv4/UnjgC8rv6vmx1l4/ycjLOnkiVxihvPOarlJvT1pnSRLkSeyqMRO5
         1qJl9DJK93bcaINaFdqtb9UQo84Y4IuUmTxZHvmmDep2CP0z9r9lEE6bISsIM8eCBXvo
         uPppjNLRkdm1iCvcgOQmohE4QG+QzsF8ONc1U9VYeQaBcQPx+aaTA/Fd7WgnHb+z0bVV
         Dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ljtCtXdVDHvboQzqZn2Q/lABoXg83zrD6bjOe7HHLFQ=;
        b=qZMMgxw7YYsAbFxDJZ5uOgwEViKf0jd8BkLvUE3k4172r0ZYoIGkYnz6u+JXqqaomX
         peM6DSC1FyiF0E6EcB2kABlw5JVWIA8YfraWcM3jNAiGDH80TKq4gCnB1E8XNqADRmY5
         FQrlbHn/4belx81K913qszGUSPZZAVTHSRKzWLyIvM8ok1XUtBHgZrWjxSqpeltwul9K
         TgKAIoOWnyb9FQKUeP3jcRwd84G9+fW+LHCgpwkAhVNZMmptDXwOLcRCwC+RvehUmsFX
         FQfbP8KfKzoYs5BTFXju0ut1mNPo9gsTr5GBlRoay1wyr2668ST85rz7Q2cc5Vl88Rwo
         Gp0g==
X-Gm-Message-State: AOAM5314bcpqfD8JNihhVV5L93faVXupVINzicKTjuB+bKqLSOL/tzi4
	YCPiCAK1jCzZFUzbZqA0An9d8Q==
X-Google-Smtp-Source: ABdhPJxpP7IH2vtw0+4J1t9nHjBU4tJNb2wQP+R8AXexRkuTkU6j6fBJND4g9OSGcNQaJ2MyM1HtBQ==
X-Received: by 2002:a17:902:700b:b0:148:ee33:70fe with SMTP id y11-20020a170902700b00b00148ee3370femr11279112plk.38.1647839505294;
        Sun, 20 Mar 2022 22:11:45 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id o5-20020a655bc5000000b00372f7ecfcecsm13170925pgr.37.2022.03.20.22.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 22:11:44 -0700 (PDT)
Date: Mon, 21 Mar 2022 10:41:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, kernel-janitors@vger.kernel.org,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: spear: fix typos in comments
Message-ID: <20220321051142.pkihlm6bnclmtdrq@vireshk-i7>
References: <20220318103729.157574-21-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318103729.157574-21-Julia.Lawall@inria.fr>
User-Agent: NeoMutt/20180716-391-311a52

On 18-03-22, 11:37, Julia Lawall wrote:
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  arch/arm/mach-spear/spear13xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-spear/spear13xx.c b/arch/arm/mach-spear/spear13xx.c
> index 74d1ca2a529a..b38391e9d8bf 100644
> --- a/arch/arm/mach-spear/spear13xx.c
> +++ b/arch/arm/mach-spear/spear13xx.c
> @@ -29,7 +29,7 @@ void __init spear13xx_l2x0_init(void)
>  	/*
>  	 * 512KB (64KB/way), 8-way associativity, parity supported
>  	 *
> -	 * FIXME: 9th bit, of Auxillary Controller register must be set
> +	 * FIXME: 9th bit, of Auxiliary Controller register must be set
>  	 * for some spear13xx devices for stable L2 operation.
>  	 *
>  	 * Enable Early BRESP, L2 prefetch for Instruction and Data,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
