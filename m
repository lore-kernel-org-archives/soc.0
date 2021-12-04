Return-Path: <SRS0=nY14=QV=gmail.com=festevam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B745C433F5
	for <soc@archiver.kernel.org>; Sat,  4 Dec 2021 10:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25DCEC341C9; Sat,  4 Dec 2021 10:47:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89C8DC341C2;
	Sat,  4 Dec 2021 10:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 89C8DC341C2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id w1so21911148edc.6;
        Sat, 04 Dec 2021 02:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d77EM0tE3JUwSxHiDu+PhK1bKg9re3Pgc3NQ6IiDdU0=;
        b=QREKril2aVYAeeErWGoUn7QGA7lzEfM8Bnfjg66RWZUwJmgfoNOH3BG8L9AxQPF6pJ
         AvGgyjTeu8vqYR6+vSr3AwNS+BmJOjGSfLEf/EUDWeIKUQ7erkhAavWUsQJ3ZWn7mGys
         mh7cNCCvpWRMx5iloQoly5kzF2tFucLZ7tiQyq3EUDIz4R1LFIynn2G3YFR9NiAUa8fb
         iIdiX3mEsvJUXmWlt5RNrVvaHlM6yBG5Ej6fVjyU8OoqWTkaU94YMCe3yX3iVjtVIorW
         pm8esUmh7dKNsphuRyVrmuozykq2O3iJyIL5YQ2CHLpY4Vdg3Nc/50LS+bRVVvYnVsci
         XwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d77EM0tE3JUwSxHiDu+PhK1bKg9re3Pgc3NQ6IiDdU0=;
        b=D2uLfAGyKBrmssT0IYU5DuQq9u4BtqhvXIF5pmB/ufIq3kEvNvP233KVl0B3peG0VR
         jFY4XbXzzZgv9RqkvqtSDOdcIpnbQf/zf+HERDAzvmAWdoH7x6Zr32KAkb23xe1Gos6i
         g3hgdmU549WaTdro6LwQ347miGbjBm3LH7FDbyKTPVcmmTH8IfTD8hrDNEpoc8mo0S6b
         DRJcQ5Y5+2l0IRSxO01fXh7gcqEqI+wc2XeFmswGH55xXyOGwKSNJGWiHzD8aex2kM5g
         iEJ/ZGNJH3meocg0C96zMbVPuNhrYL88iZLNGw/ch2z5eptFgbsJjm4dp6R6n6jYUAX5
         mTzQ==
X-Gm-Message-State: AOAM533e2FJXiIbvE7mpThsNvSvRwkVOS1dG+/AOZMwpQlyERtVKT/ic
	9MtfrKKDpDWeI1Tuob626onc+Ru+lg1010Idrf4=
X-Google-Smtp-Source: ABdhPJzjNMGKt1kskPkry21udVYUmkbii2mprzGh/hM7XWBm/ujHf1wyM5vRF8TshW0guQMFwG8dkpaCrs1muwTCrMk=
X-Received: by 2002:a17:907:1689:: with SMTP id hc9mr29466609ejc.445.1638614833775;
 Sat, 04 Dec 2021 02:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211204061042.1248028-1-Mr.Bossman075@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 4 Dec 2021 07:47:02 -0300
Message-ID: <CAOMZO5B15PqGZcGi6zneiqAmaA7y9-tELpeV7xRFYJm0SPLYqA@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Add initial support for the i.MXRTxxxx SoC
 family starting from i.IMXRT1050 SoC.
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

Hi Jesse,

On Sat, Dec 4, 2021 at 3:10 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Giulio Benetti (5):
>   ARM: imx: add initial support for i.MXRT10xx family
>   pinctrl: freescale: Add i.MXRT1050 pinctrl driver support
>   dt-bindings: imx: Add clock binding for i.MXRT1050
>   ARM: dts: imx: add i.MXRT1050-EVK support
>   ARM: imxrt1050_defconfig: add i.MXRT1050 defconfig
>
> Jesse Taube (8):
>   dt-bindings: pinctrl: add i.MXRT1050 pinctrl binding doc
>   ARM: dts: imxrt1050-pinfunc: Add pinctrl binding header
>   dt-bindings: clock: imx: Add documentation for i.MXRT clock
>   clk: imx: Add initial support for i.MXRT clock driver
>   dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
>   tty: serial: fsl_lpuart: add i.MXRT support
>   dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT compatible string
>   mmc: sdhci-esdhc-imx: Add sdhc support for i.MXRT series

The emmc and pinctrl patches have already been applied and they are available
in linux-next. No need to resend them.
