Return-Path: <SRS0=oRQk=2M=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51244C433F5
	for <soc@archiver.kernel.org>; Tue, 11 Oct 2022 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06E47C43147; Tue, 11 Oct 2022 16:08:11 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F7ACC433D6
	for <soc@kernel.org>; Tue, 11 Oct 2022 16:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F7ACC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f173.google.com with SMTP id a24so980850qto.10
        for <soc@kernel.org>; Tue, 11 Oct 2022 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GWYVEJdoqXnCQWtfT0bzkIP+70WLbsk9ZN19JnMQZx0=;
        b=knWzrFxaglSBiHlwLMrZK+zOgKEtnU3K72eEGnOpfBMOKDwTCB1o5DFjMAX/q0UhNY
         QtDdN11oGw+99XS3Ki30jbEV3wnK3M/RZFgBzC756EJj6Qzp7bRwpx0xVlVivFLLMSoT
         OeFfvcAMzeUvMG2gk+zcXMcyojW/wbwfJ302GKQQDum8iO4SLMQHN5VVV6Lek8K2nrim
         ey4zQ7XwZHcjBefqfLYDvCN8aZemyW2QsFCvMONV+AY8yi+43sfWfso0dPvhCbF12v5/
         Zm2LP1ZxvniRrJK8KUjh3/YEL2QeZJReWqzdLohiEOSis5AiXvm/BDGrcU0o48e583KX
         k3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWYVEJdoqXnCQWtfT0bzkIP+70WLbsk9ZN19JnMQZx0=;
        b=YcBDjAGsCyc2TyUKTtNyPEGvHrjq191tQa5s4dRkuB6spp88rrowQ4cJhg0DSE7izJ
         YlWW7keZSqvyfx4S89kJIRFFiTdGkoGSpGCg+2jNPyAPa7rRtUNghxl4LKrLgQKeo6rW
         mxRPS4ZaQSrGlF5NLpgZKjdrlgyKrN3fJ5idCNytOXhRMUsr2zVVf3jYERRHhvGuxgTS
         5RQxXtZhbgchkDqT0XAvpRvSgEPSZZqoZr7s3fWVvE7H4zmkm9AKlqqguzhFja0ZSYEF
         hHv+3KRfAZY9WcEEpYR2d6HnmQeDJ+uHXNByQDL3ymEj8HcYl+1Ygmt1JVUjrbvrSEaa
         hvsw==
X-Gm-Message-State: ACrzQf35c7D89vH8ClTqlpWgakBwrJ9p3t/B2rTFpnlJoqoqe43B4YM7
	0DpZngCdOEGsJejasQtwJ6Xmzw==
X-Google-Smtp-Source: AMsMyM4tb/82A1JDAzYalVciziTjce/S19vvHsKcNbs5jARqscG7vKxacamXR2e1H5XtfAKSXhInbA==
X-Received: by 2002:ac8:7d49:0:b0:399:d201:840b with SMTP id h9-20020ac87d49000000b00399d201840bmr9746570qtb.309.1665504487275;
        Tue, 11 Oct 2022 09:08:07 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id w8-20020ac84d08000000b00399813f4d5bsm5725686qtv.72.2022.10.11.09.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 09:08:06 -0700 (PDT)
Message-ID: <a9e5197d-78aa-4395-23bc-d7c3141f109a@linaro.org>
Date: Tue, 11 Oct 2022 12:05:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 20/36] pinctrl: samsung: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Kent Gibson <warthog618@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner
 <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Prathamesh Shete <pshete@nvidia.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Paul Cercueil <paul@crapouillou.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-21-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010201453.77401-21-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2022 16:14, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 11 ++++++-----


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

