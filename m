Return-Path: <SRS0=sWnU=QP=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1C7C433F5
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54DE4C53FCB; Sun, 28 Nov 2021 20:54:42 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA489C004E1;
	Sun, 28 Nov 2021 20:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA489C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id j1so9612170vkr.1;
        Sun, 28 Nov 2021 12:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hD8X8qVZq4QKTN1ZTeopdiOIlClAYJmnZKU9CVsO/cs=;
        b=aQg3vtt+4H1lt0RbLFuPBMh8bth02t7Ut92OWIKW2emBz2XXNHbzvFxf+/P5VUrr97
         GDXNJQ6yUURYSpyi0lKuaoq8r5ivaD0nM+3Up/L2fbRBSOiWy1twBwURPjdOr6yRidvo
         YI909txyLgz3vvYfi9//m1Z7wiZfjoAM88zGAW4HxfCP6zqpeb9X07Su2xS37uBk4+wr
         D6DA0omN63xrdYEOOYofEOEkga/4xhoowr3EMRYWQwY+QZroTYK0HWiaIHmg++hoosCS
         zhfS/G+gBRNSUIqzXMa3D7ZXDQFpcrBElurXwgLguCI937gUXEoIul2GU9NV3GXydVBU
         bCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hD8X8qVZq4QKTN1ZTeopdiOIlClAYJmnZKU9CVsO/cs=;
        b=LpdG8Q+v0iGScCazp7HTbgGieHFEGVyPZytgwaeM8RU5nyiJJXk89y0Xyy/5YguMzx
         sC5lIUN6Cyf0RanT/J28hZRkaVjp4k5KUyOhgHCrIPHf0bUbHkkAEoCjgbiV5G3y/eQ2
         ogORTWwQvp4FXOn9iFpEFo77panoj4rRIj2aMLuWVRe36dvSzQhml5UknlwwaP5Eiue3
         d08Fxv6yWoIxr9geoHDN4PB/HtoOoXaFKrrj8sw03NT8RRP2z0483K5VE/DCUttwMvnw
         K6ElD8wVeieql7RFBtuYSiB08f//VJqVgq3qfpERA0lEoslodgLEDfr7D/3cV9B0BTO2
         eRJg==
X-Gm-Message-State: AOAM530QN9pbXLAh1kEE2Q5fnSkdT9S+TkAi3f8c+rup8Hke6bVA37Ik
	QeaisXTNVFsPCg0eZqw5z7ViOBMvsudvzQyS0no=
X-Google-Smtp-Source: ABdhPJy4IAicZ4T3I0QqmFkKXJz64V93a9r3U1yEXvPSJUIQruJd7WrzOa8FDTdmvw9a/2V3TdwZq25nTnF467frhZs=
X-Received: by 2002:a1f:2b4a:: with SMTP id r71mr27341358vkr.37.1638132880735;
 Sun, 28 Nov 2021 12:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-8-Mr.Bossman075@gmail.com> <CAOMZO5Dqo6c=4nGCOakMKG8fn=V1HA7-O26t3GmwWtD-FbZiPg@mail.gmail.com>
 <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
In-Reply-To: <dae68360-456e-3db8-57ed-2287dc7cfd57@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Nov 2021 17:54:30 -0300
Message-ID: <CAOMZO5Ca7j6_KOBJ1XVpx0yRvCaAH3i2Wac0jwL8HT8pxso2eA@mail.gmail.com>
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

On Sun, Nov 28, 2021 at 5:52 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> we can have multiple imxrt versions in there like the other IMX clk
> drivers, is this okay?

Yes, in i.MX we use drivers/clk/imx/clk-<soc>.c

The same pattern could be used for i.MXRT as well.
