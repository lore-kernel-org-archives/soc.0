Return-Path: <SRS0=U+Wl=RB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4044C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 03:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A796EC36AEA; Thu, 16 Dec 2021 03:19:22 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 488AAC36AE8
	for <soc@kernel.org>; Thu, 16 Dec 2021 03:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 488AAC36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f175.google.com with SMTP id t23so34553471oiw.3
        for <soc@kernel.org>; Wed, 15 Dec 2021 19:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
        b=zRWPUcug9JLw4lLpjR5FRm7N3TahpWbYFQnGkQdY0nnpN0NcMRzW1rPNPX2iUOk+fz
         wqb2Z9a1/S63sZxUor6sGazjkdHQXZfktqexaXyD3BN2xxB3TLdiriHQSLyOSe0gdWtn
         IP+TVnZklGicQ0oM1CwDLRlXFz5vx0Qw+MJ72Ye/aRXa2mhUUMemZO6K/Bk+sFO9qcGe
         TOwf8L9Izfo45NtjGjU+076dqTi7ndUdP3E9jIOqVUAkMS6nRj9BnMFTny39NDTvu0Xm
         yvkv1F4ZMghOB5QWYM0X7vwbuQT6eofb57B8D4yRhQJl+4SFgLfOS6uC/bAaI4RaNfNd
         L5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWM/2Tdo+A39zviPt3A6JldRYsbUDOs2gZmt1TWRfEU=;
        b=mgR2+LTxuqC/KqLpCryYkdfDIHPM6JdoWLbXNpWEvWIuxfh3pUvwSvWCbPvuvuXJDK
         H4bSArXYmHGXLoFxWc0QVdEDsVhGc2vuAykRyCQXKgJTT+RLqocfiF6BZXJtg/ciTTGH
         4b+OE6jPZV5iq7BQFmJ4xqmX9YInfWzO/SZFkovy7mX9ySPu6iRqPaw/F39f0GMsxqVc
         Fb8T2OwPnIHNy+jZSQMOplri/cJ3JcTGVyR311IPRXDuPMUgO7bgWBc4WLUkO16VsrJI
         hUNZrsamRBZ59N2Hi9s6mGdyGfR8TVWlLs0DiP8FNck3d41MY4J1tYu0phS17Z1+oA2L
         XsPg==
X-Gm-Message-State: AOAM531QoBNOvJe4wkknjwghk6YaF0c88Z1epj0ehPHGw6LNYDJfDmZE
	9TulCtGpjoxwz4EowjsbRAL+td6CtXJuBBwRAtjk9A==
X-Google-Smtp-Source: ABdhPJxMt8LsH5solEGiTCgX6vrLS/Lejlh/uyv5vtoK/cjjDQdtu3LiiiFa8vkEePPWEVkSf5rT4Xe4hzEx6EQxyiM=
X-Received: by 2002:a54:4791:: with SMTP id o17mr2719065oic.114.1639624760385;
 Wed, 15 Dec 2021 19:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211214125855.33207-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:19:08 +0100
Message-ID: <CACRpkdZxfOZtibKgywx_XL_ayp5NEQiCK-NRrEtbvCUGYSojVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Get rid of duplicate of_node assignment
 in the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Sam Shih <sam.shih@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, 
	Colin Foster <colin.foster@in-advantage.com>, Douglas Anderson <dianders@chromium.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 1:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: no changes

Applied this patch 1/2 of the v2 patch set!

Yours,
Linus Walleij
