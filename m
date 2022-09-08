Return-Path: <SRS0=0O52=ZL=linaro.org=anders.roxell@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABECC54EE9
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 18:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E8E5C433C1; Thu,  8 Sep 2022 18:17:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F8F9C433B5
	for <soc@kernel.org>; Thu,  8 Sep 2022 18:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F8F9C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id l12so12497185ljg.9
        for <soc@kernel.org>; Thu, 08 Sep 2022 11:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vHTTeB+5l7uNHvfzSP9bEhvHS2VR7qKzMkrLhrmym2o=;
        b=ebynjaknAItswLH0ca5KRpPDT+8Gmin2NRF8pHEmYJFJxSzxHDiMnF5hSFF1pqI+6H
         AAwclXdZ9kym+xAvf+qmLMuEGSrXoW5UuTnJ7SYtZfOaGxKebmjTMtJ3Fn+lYDPxnqDC
         TSjwYv9svQ+8g+BOqsvEDSO61O7COW2LHZg5UnX61jHk/8euroaqfm1H88FnezHFO0K7
         HiVGjNGdEzPAC6ihr89/IDmmSJh101c58bJNWtFSVZ0Xrwl4zB+64BfQKpppZRma3B6F
         egqFZx628xRUNXM04yL9CU68VT9T//twTXxwPjDyeGKnsC9SZi6sW/Ar+LWK8A6/ub1G
         untA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vHTTeB+5l7uNHvfzSP9bEhvHS2VR7qKzMkrLhrmym2o=;
        b=aHSRFkgVp0KsE0WlawnrPc3CBCekkPLiscESGdWtBoDbDZCE55byXFwxMHEYsHPNMy
         1yzvcG/p8y0d3hyLw0FJyUhnsEcSLOYFyiHU1h6KvFe12/cwaG3cckwR5kxiDvvsd5iX
         lHvTRYNHTey7qnlL1TaDDBHEjc2lor3jXTNvndgq0hvGI2L1qssHyhf+JMIT7YRETVmz
         eC8dWbf3cd2TpKQYjFwLtKmYN6Zw4D5xzCf5I8ing/mc+3o33U++AQ+L5+kfpWbZiVIh
         OOajpupRlFW3m5FMT6p75HXQzo8Hp/bpO7Bfk1jYx9FfbM5a+zE1BeVfcbmTLiI9Q1nz
         r0aw==
X-Gm-Message-State: ACgBeo2axsl6VE7mSRypyrR2N78H9raEkV+IOF4PLq/ifgBjW9qh891b
	mOicYvwQoUPo4r8n7ijTi+6vrg==
X-Google-Smtp-Source: AA6agR6Ex7n8iF7H0X4UPk5I9N9WPNpWVDGhFyrsVCfzPjIYINq5UWayVSWQXlINNonGWply1KJtWA==
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id h9-20020a2e3a09000000b0025e42125628mr2712563lja.68.1662661065170;
        Thu, 08 Sep 2022 11:17:45 -0700 (PDT)
Received: from mutt (c-e429e555.07-21-73746f28.bbcust.telenor.se. [85.229.41.228])
        by smtp.gmail.com with ESMTPSA id b3-20020a056512070300b00492e3c8a986sm3121418lfs.264.2022.09.08.11.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:17:44 -0700 (PDT)
Date: Thu, 8 Sep 2022 20:17:42 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org, michael@walle.cc,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: enable ARCH_BCM
Message-ID: <20220908181742.GA69385@mutt>
References: <20220906033957.4377-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220906033957.4377-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-09-05 20:39, Florian Fainelli wrote:
> Commit 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom
> menu") introduced a new symbol ARCH_BCM and made all of the Broadcom
> SoCs Kconfig depend on it, but did not enable it in the defconfig.
> Thus, now the defconfig doesn't include support for any Broadcom
> architectures anymore. Fix it.
> 
> Fixes: 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom menu")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 91e58cf59c99..4c8b09c6b49f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -33,6 +33,7 @@ CONFIG_ARCH_ACTIONS=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
>  CONFIG_ARCH_APPLE=y
> +CONFIG_ARCH_BCM=y
>  CONFIG_ARCH_BCM2835=y
>  CONFIG_ARCH_BCMBCA=y
>  CONFIG_ARCH_BCM_IPROC=y
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
