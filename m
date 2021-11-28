Return-Path: <SRS0=sWnU=QP=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF556C433FE
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 21:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96B40C53FC1; Sun, 28 Nov 2021 21:01:50 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF9B2C004E1;
	Sun, 28 Nov 2021 21:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF9B2C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id w23so29787183uao.5;
        Sun, 28 Nov 2021 13:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/0Be4YdoJWrG3olK/Rdtkxl4HfF+TWIUQ8musiC5+o=;
        b=C9ZM6XWOIPWLRDmLnX8iB5K+Q89OAemIRb7G4mdMUTTTyxMxvQ+o9VJ/HI38gRYa68
         HtjcQXlde0R6vqRDS0Tn++YQiOyrogjVZTN1JRhLECsZGc8bEGgVEWXeaRsR2uc/yTz0
         0LjxJNv7NGZf6pz1DxGpR1qK1OuOBz8mWhVYQFxjCLDUJ2DHAPjt6yPA5qW13OAQ1054
         7Xu/tftqW5CTqxgRIcompK+CsA/IBVyeudJVwhCREI/ZG0ptcwbJHGtkrvWf+oj9p1xr
         lF3l3Becle1LGVz18sjXrPrG0evLCOEZahwMst+jMXqW94aC1Vk6Gid69uXKRfZKRjf+
         jwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/0Be4YdoJWrG3olK/Rdtkxl4HfF+TWIUQ8musiC5+o=;
        b=0pxqT+JovqXACfjIORCDzOmaRu5N5tfkcIStz0jrZk02XkgwvSDm09slvMpLgRkANf
         7ahNG7Ecd4MOQ8EQnDQkLBLgUeFkMDihHD8rPRnPBJ8XgLFpY12flO54bbj5xdU7ksGD
         XK4VW4+xf3r9I5aU22TkXHHIllz8qh8j9Pnw7gtkR2C/rt4NRjrjp5LGM/xZzz10i9TN
         8Ai84q/pEQztm42seopw2s8zRizyQMHZp+juks5UTSsm1bO18FQVWR1BovbCDB3f2ZES
         WWZowjCNsXpLmYj0NgzOU6g+FW/4n+ci9dx20vWdHKI9BXiWkBDaNL2Pq5tgxqUZ2/hQ
         a1Jg==
X-Gm-Message-State: AOAM531L/aOnQEGR46AFbuxXaDgQObML2YQWflJ+wGptIR51HFImUYQB
	pmHY1k0OQAU/3yFlvtlGMshieeELEs6rPtZkzNY=
X-Google-Smtp-Source: ABdhPJzeuwkeOUNKv1l60vODjiUB+kSjTf1MFzRhiHgoVNc8dglgKZZM06QQhFncdAgmwuqbpybhxNs1g8eVL5sYhsc=
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr28485619vsu.7.1638133309000;
 Sun, 28 Nov 2021 13:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com> <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
 <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com> <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
 <fca5e8f8-a442-c9ec-27ed-da9c8a8d8ed4@gmail.com>
In-Reply-To: <fca5e8f8-a442-c9ec-27ed-da9c8a8d8ed4@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Nov 2021 18:01:38 -0300
Message-ID: <CAOMZO5AP338L_Fus7Bwiq+1-2V3jnMoikef+JvaNjTSRjU=kxw@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] clk: imx: Add initial support for i.MXRT clock driver
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 28, 2021 at 5:59 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Uh so i should change it, or can i keep it like 'clk-imx5.c'(how it is now).
> sry for the confusion

Please name it drivers/clk/imx/clk-imxrt1050.c
