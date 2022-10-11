Return-Path: <SRS0=P3QM=2M=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C31C433F5
	for <soc@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96A5EC4314F; Tue, 11 Oct 2022 08:06:22 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 738E9C433C1;
	Tue, 11 Oct 2022 08:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 738E9C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id mg6so8492582qvb.10;
        Tue, 11 Oct 2022 01:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jGyomjq7ozY4Q7akXL/Pfyv8X5Aj6pujM8b1a5l18ro=;
        b=KOtVn1MyCyveoDiOyhPS4b+kccEhBn5uycP8wq1nxcQaoVO7ujP/OY5Ywr26ZnhCam
         JtV49vXZAkHxc9fQhnFZ0yR5qa3H1k6BdicVcmNeApeNekWkjySS1eI7a345vma1iB5u
         m0hpdgw4rj+ZcUPoYHTwGBEZDDkn60NhzkSfKSFxnPmncP0SZs0DSM0BTPcBCa0Y7kT+
         OJDRY26vA+5llcDmHVjT/wbShwFCBj2+8IX1jMumA781Wi5bVtrpUwScLhBWATEJPXxO
         rA3UjsbwHJCPXoxP8zsPzOmD/iX/cV77mwqa0OtltmMedasLu6ChGyGJ30OpeSGXY/hO
         eF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGyomjq7ozY4Q7akXL/Pfyv8X5Aj6pujM8b1a5l18ro=;
        b=AV2ytyPXfIEMundZrXex7xZxTIF7jYXOdjDA2snXf33b0GAgztfsWNSnHtzkOJGXZO
         K6sxgaTlqi0e1ODIz58ofu5WGbc6SCJgadCX3Dl5nVjTygaZqzm1fGOt+xdwfhJB0209
         h+iS2iwNfWneH6vjZ0CARIThbDQ/G3xY4Wj/KN2mRbXjuMOBUw/0Z7oZe5s9Z8Ojm4jo
         25PixxS/YqssPcpmRIw/AuYwbmNPnsBw/aap6W2769CiFtfZua1nai/wVu7bqA2Vw+Kf
         6Pwzfa1uEKpUBDoVz2jxY5NsBifyIrcQ1c0oAQIAjc0dIh7EUuDEGnv7kLDdGWmuenU5
         C8Dg==
X-Gm-Message-State: ACrzQf00IYuv24qfcnnxFMlB6UgCXKiLC5U81y2moDKUg60ESnBn5Yoy
	bFpqui+B6Hex2+0voXkz1AuXnqy5suV5KSgzVTw=
X-Google-Smtp-Source: AMsMyM6bBfvn1Kn2m3jyePvTWTQZr99mPqgEF96ov5+b6DzzOQAB1TTkjSwFdYjW5mK99JzXiScvlDmHriUb73Md/f4=
X-Received: by 2002:a05:6214:29ee:b0:4b1:c1d2:6635 with SMTP id
 jv14-20020a05621429ee00b004b1c1d26635mr18081815qvb.82.1665475580262; Tue, 11
 Oct 2022 01:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com> <Y0SyVwjDl7NGfTPn@sol>
In-Reply-To: <Y0SyVwjDl7NGfTPn@sol>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Oct 2022 11:05:42 +0300
Message-ID: <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
To: Kent Gibson <warthog618@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > -#include <linux/gpio.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>
> > +#include <linux/hte.h>
>
> Ok with the hte re-order.
>
> But moving the gpio subsystem header after the gpio/driver is not
> alphabetical ('.' precedes '/') and it read better and made more sense
> to me the way it was.

I see, I guess this is vim sort vs shell sort. Strange, they should
follow the locale settings...

...

> > +#include <linux/seq_file.h>
>
> I wasn't aware that we use anything from seq_file.
> What am I missing?

I will recheck, because in v6.0 I don't see anything, but LKP was not
okay with something IIRC.




--
With Best Regards,
Andy Shevchenko
