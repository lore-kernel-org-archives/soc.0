Return-Path: <SRS0=0poK=LF=gmail.com=olteanv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E43C48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 20:24:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7397613C6; Fri, 11 Jun 2021 20:24:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A9CD610F8;
	Fri, 11 Jun 2021 20:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A9CD610F8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=olteanv@gmail.com
Received: by mail-ej1-f45.google.com with SMTP id h24so6338222ejy.2;
        Fri, 11 Jun 2021 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+dQpQl+uCaHWxj358F0QEZFc7ikOW5DB/iODbuCA6Bo=;
        b=MOUo8P7M9qdEIG8LWpwG8oLhvsWO07zAGYwJ8BdYnmZ9pjT0vrIIM/ihQbyHWpVkBK
         i+vgTfrewH5QgNISDGetGS6E0ygfJrYnfnYeR+NHynZDTu6h96fRVoc9ovey2UKcHL7l
         QYAKB3ui4M8fPSv287ODj2K3kuYIVmH/9IV3vAoCuDhGM09j2UxevJx7Onfrdd+45dpd
         fGt4rGNrMwu2powuZ+XQxbmOHZYQVNB9RKouMTTJCZKdHzc2DUkKx66fVLkWJJEZQVoO
         3eF/fzMJC+O2j0spwrZ0S25mS5cmapTPqgNRNnzItarcnJfe78DQGz7i0EzwN2rOWukH
         Gu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+dQpQl+uCaHWxj358F0QEZFc7ikOW5DB/iODbuCA6Bo=;
        b=opG6TXZI4EWUEY9+4MBgBDDPvykL7Z1VKeeAvBAumiHymDvNOOBvPL5wCr8YKEBFRp
         Yb8WCAw1e6Aq74xU6XErAvqWkQI6x+SkB2PSK57d+wvYWKyM29JpO7F8t+oWDKD5bF+K
         PenU85i16qT+sH8kPMSp04aQrqBIbvNPqM+8RL0tSAKeJ7LWoFBAD2OXK/lt71OFIHHO
         l/ELXSEZVGaZInkUy6pc+joHktRNN4AG8idas3bxxd78Psnp/XpbsI6egHuTcsnknKuR
         1jK9B/5eUMgoRLtBGdcZw9r/XbdpiCL5mvaBKg+PHYeqJD2pWcb4W26DzhgUTlNzK190
         1Xdg==
X-Gm-Message-State: AOAM532q801sMz7sC1zjO8Ygjitr9rAY9/adaNnSkwPO9wSevQQ/cHZm
	ScQwn+yrB4o+ZWjhILEHom4=
X-Google-Smtp-Source: ABdhPJwn0zaoJnSvp7caqYDvwC27ySoMhITMCdGC7cD6Vb9O61GJvtDJHbVtst6yea7wXmuT39FPXw==
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr5160780ejk.30.1623443077111;
        Fri, 11 Jun 2021 13:24:37 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
        by smtp.gmail.com with ESMTPSA id b24sm2951033edw.4.2021.06.11.13.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 13:24:35 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:24:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
Message-ID: <20210611202434.flnqrzbbxicw5c3t@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-3-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-3-mnhagan88@gmail.com>

On Fri, Jun 11, 2021 at 12:27:14AM +0100, Matthew Hagan wrote:
> Add Makefile entries for the Meraki MX64/MX65 series devices.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..033d9604db60 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
>  	bcm958525xmc.dtb \
>  	bcm958622hr.dtb \
>  	bcm958623hr.dtb \
> +	bcm958625-meraki-mx64.dtb \
> +	bcm958625-meraki-mx64-a0.dtb \
> +	bcm958625-meraki-mx64w.dtb \
> +	bcm958625-meraki-mx64w-a0.dtb \
> +	bcm958625-meraki-mx65.dtb \
> +	bcm958625-meraki-mx65w.dtb \
>  	bcm958625hr.dtb \
>  	bcm988312hr.dtb \
>  	bcm958625k.dtb
> -- 
> 2.26.3
> 

It is odd to add the device trees to the Makefile in a separate patch
compared to their actual introduction. Does the tree even compile at
this stage?
