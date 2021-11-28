Return-Path: <SRS0=sWnU=QP=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE0C433EF
	for <soc@archiver.kernel.org>; Sun, 28 Nov 2021 20:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 075FCC53FD1; Sun, 28 Nov 2021 20:47:17 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C3F4C004E1;
	Sun, 28 Nov 2021 20:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C3F4C004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id l24so29811103uak.2;
        Sun, 28 Nov 2021 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Giz1SwY82g/5k3rpig0B1bNAl0T39LLOyvXZ9G7668=;
        b=j9yVpxlkr92H3j8XogkkFArtyWSLj6On2TPoyYzLdK5KrdoxO2eKd6Z0AvY1ELzIlT
         Xw6AUlCFQ0qEnCsOsRq/kJXDfqq3WA7pV3WU1FFnVOyvcaX0q/jfQ2ofjQMziZcBsqYr
         vrzwZmmKmLXRa7zTmsSunVvQkBx+DJbEqHoAnSVqAADrtuCd1t91MP2H0xLFjpSTyPvG
         woIbpoPisS3x8pVGht9PZTEUWwN16zqsV0AQsGaZWUo+klR1vZc/iTAWjK1O7mrsPYTv
         ACRnR/ij6Lk4fHbwC77RAbCD2lUeEOUfXze8idiXLataBzvWB6pQjq2uebXQAc1NgngZ
         /+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Giz1SwY82g/5k3rpig0B1bNAl0T39LLOyvXZ9G7668=;
        b=KTf7718CLQzRam9iY4eLIY/8WnDZXXeWbJpB1+KDWZ/l2ULLt3IQtoAEwoMcNjzgSw
         OhDihnuznoBAE2zSmL2CXcdTUbmRVjdKgXmlgGQb3Grfk99rOhkjs5AXG9ncCC9bmYAj
         yEzQr4+BymqFs0odghGCWkFwro7bkvOLAsLBTcg0IgpffzcrhKay4SCN3PFj+HD0So+Q
         4I+o7EzrVIVK9c5r8VjGdNasONIAJpNy6+1Uqpo0o76DMLNQvpNDkGTrZR3jQf5X+CbN
         GxiE2Msg02IHEDRSjwlz3rHDqQcWMvkltQLzZ/qH4VFI3imwfYxHD4wvfPTEgT62l3Hp
         Ju6A==
X-Gm-Message-State: AOAM530gd9OmTBq1tswjZphkPixO8oXt9/05Ost5nUiGx5cWpyJhcTaw
	IVyWnzl7UCkVCsXYW/e9Km13H0XiF1vfikvUudU=
X-Google-Smtp-Source: ABdhPJzzLRgOtej8nLnlEwtProk4Wve2g/tuNbislmc8PlVWD41K7eAX/FIlr4vGfJ4vq0VXhULX8+hk4y1B7/LqQAE=
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr28456760vsu.7.1638132435141;
 Sun, 28 Nov 2021 12:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com> <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
In-Reply-To: <20211125211443.1150135-10-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 28 Nov 2021 17:47:04 -0300
Message-ID: <CAOMZO5CjpRjBqj_9b17K1q7bw67XqNP5xWh2-MjWq8zMzhJVSg@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] tty: serial: fsl_lpuart: add i.MXRT support
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

On Thu, Nov 25, 2021 at 6:15 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Add support for i.MXRT1050's uart.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
