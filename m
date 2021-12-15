Return-Path: <SRS0=7IKC=RA=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318EC433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 10:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7EB7C34606; Wed, 15 Dec 2021 10:28:48 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24421C34600;
	Wed, 15 Dec 2021 10:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24421C34600
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id e27so14342258vkd.4;
        Wed, 15 Dec 2021 02:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6KatagByVh+i+7U2cQTugmti3xcd82C2QfCSX1Fy8Jo=;
        b=Lw7g2cPJtY30uvUebrkKpkIJWQR0Y/BHRyS+FEzPaWPozsYFVqFcQtwVQOWp8v70y1
         jlbzVagHTKN3IYbfevzWLSBc0VQHIdZp8YHhzNmktuSNrZe9ph8Y6eTyC9lXn9pkDGgj
         XRHiYA8Y0+roZeSfBgu2dptAbESC01e92cSXI9gksqitw58xLRFanmACHk3Z0CYFu47U
         54H9GUQ0n5uYAVObjrptKw/wkWVqV6Y9aK7ZgG6gokIvEN4udFccj427y7yNqyZGD9yk
         8RfltUOt51uY8jR73Vd/xlgvzKgyLtlVp1yQzqqj4ugN5BvtAiu/CNC8sJguwxdc3msZ
         Rp5Q==
X-Gm-Message-State: AOAM533algkJRa/XwJPmh8sordvNYnjK9Odvycdwkexx71rDtfQhO3+s
	H8YyIaE7ahCralQN3Pkt6L0fOKwvQ0dEOQ==
X-Google-Smtp-Source: ABdhPJw4pmCw+zOcQLQf3Jp4chTkh1qAKt3AMlR9MGBiJ41qdqPe7X15lu5ToiMcyYzcbLsMQPyRvg==
X-Received: by 2002:ac5:cdad:: with SMTP id l13mr2754452vka.39.1639564127098;
        Wed, 15 Dec 2021 02:28:47 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id b129sm312866vsc.5.2021.12.15.02.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 02:28:46 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id e27so14342218vkd.4;
        Wed, 15 Dec 2021 02:28:45 -0800 (PST)
X-Received: by 2002:a05:6122:920:: with SMTP id j32mr2889520vka.20.1639564125403;
 Wed, 15 Dec 2021 02:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:28:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Get rid of duplicate of_node assignment
 in the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, 
	Colin Foster <colin.foster@in-advantage.com>, Douglas Anderson <dianders@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Herve Codina <herve.codina@bootlin.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-actions@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, - <patches@opensource.cirrus.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-mediatek@lists.infradead.org, 
	linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Sean Wang <sean.wang@kernel.org>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Neil Armstrong <narmstrong@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Gross <agross@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 13, 2021 at 5:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/pinctrl/renesas/pinctrl-rza2.c     | 1 -

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
