Return-Path: <SRS0=NSjt=3D=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52875C4332F
	for <soc@archiver.kernel.org>; Thu,  3 Nov 2022 02:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1BC92C43470; Thu,  3 Nov 2022 02:51:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EA31C433C1
	for <soc@kernel.org>; Thu,  3 Nov 2022 02:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EA31C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id 130so413519pfu.8
        for <soc@kernel.org>; Wed, 02 Nov 2022 19:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJ8YK3ZkeFa/ubpkLPx4KfooCHAZYFqvy9bY3m0W8OI=;
        b=YJdeZnb7aLAY9WgsUwt1i1CaggwJDIWSctPHkvqDN7BSWyyMvg+dNdvtlDGB5hAr6e
         VsXV7cRxeJhLHj6XHH+OkW4h3TS/Ji3B1JozPRTVnBYMMlZ4C2QAiOz+OtvvR6NoRp1D
         cgXYlXC71rAoX6arAuu2M29RgbsUKN7h6jhVVEvGaRLYCur+dQwVZVoKKDzDJuvseklu
         wodr6vTTDFiJvrrtBcKVZV64vgEm9Hnhba0qkjwRJXAQDCrIlCexyITtXfsKpexOOHHS
         QGxGVYoVfXZXzVJsgKn73wfl/pku8EruCMQTCyuvMHO1zti9dNATB/AQ1NmQm+NulMQd
         sVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ8YK3ZkeFa/ubpkLPx4KfooCHAZYFqvy9bY3m0W8OI=;
        b=0281zfb+9TGpbXSCpBAFGZIhhMQ3go1tOvCRPNixm+ExT9ZgCFM60iBoDUUYrUhnSp
         i0D/37sYMtzWom+/iRGVD2qusxrgjL+nZ/X6GZxYmSQeXMNH8rXm/TQEpzLYOc6h2dsl
         LKenV110cFVATLPplLdEwoIUfxBHLXhH8mrLmIlxdJ8+Alewelk2A5ZVq3Pc/pU0fTh6
         F2lpF/qq/X/d2Co0xqzeUA68ANaXhSE748iz/hRHArLADVSMuWwcogQE8J8ail828+BI
         dLSud+laAp9qhz/cSL+8+AOyHe4VMcbQBKrhcXEOFtnVQLuswWgmT5eHPM8t9GA1dEOl
         dP6g==
X-Gm-Message-State: ACrzQf0qYAXsV00J6YSq/HNhuMsWdZZQgH1hG3YmU+H/iMkVe+x9sOUX
	ASpkgb56fwl+tDxabhAbJsqgWA==
X-Google-Smtp-Source: AMsMyM74YTplVPlwGAc9pABYMGH/T+XcnLy/bQyPOd4IQYtYE+bx8hWqC1ki/b6MZqutZRqy3MZR3g==
X-Received: by 2002:a05:6a00:190a:b0:56c:123e:3e61 with SMTP id y10-20020a056a00190a00b0056c123e3e61mr28079536pfi.47.1667443907690;
        Wed, 02 Nov 2022 19:51:47 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id g16-20020aa79dd0000000b0056cd54ac8a0sm9099583pfq.197.2022.11.02.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 19:51:46 -0700 (PDT)
Date: Thu, 3 Nov 2022 08:21:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Vipul Kumar Samar <vipulkumar.samar@st.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	Bhavna Yadav <bhavna.yadav@st.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Rajeev Kumar <rajeev-dlh.kumar@st.com>
Subject: Re: [PATCH v2 3/6] arm: configs: spear6xx: Enable PL110 display
 controller
Message-ID: <20221103025142.a6ap22uks2gan2bj@vireshk-i7>
References: <20221102171012.49150-1-kory.maincent@bootlin.com>
 <20221102171012.49150-4-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102171012.49150-4-kory.maincent@bootlin.com>

On 02-11-22, 18:10, Köry Maincent wrote:
> From: Kory Maincent <kory.maincent@bootlin.com>
> 
> Enable the PL110 DRM driver, used by the spear600.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Notes:
>     Changes since v1:
>     - Do not drop CONFIG_I2C
> 
>  arch/arm/configs/spear6xx_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
> index 1cf0621d2154..3e2c2abae5ba 100644
> --- a/arch/arm/configs/spear6xx_defconfig
> +++ b/arch/arm/configs/spear6xx_defconfig
> @@ -40,6 +40,8 @@ CONFIG_GPIO_PL061=y
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=y
>  CONFIG_ARM_SP805_WATCHDOG=y
> +CONFIG_DRM=y
> +CONFIG_DRM_PL111=y
>  CONFIG_USB=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_OHCI_HCD=y

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
