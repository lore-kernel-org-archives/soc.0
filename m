Return-Path: <SRS0=Q9lI=RH=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669C0C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 11:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28CD1C36AE8; Wed, 22 Dec 2021 11:17:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0238C36AE5;
	Wed, 22 Dec 2021 11:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0238C36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJmCV-1mkNTp2QjB-00K9aL; Wed, 22 Dec 2021 12:17:32 +0100
Received: by mail-wr1-f44.google.com with SMTP id j18so4215771wrd.2;
        Wed, 22 Dec 2021 03:17:32 -0800 (PST)
X-Gm-Message-State: AOAM531EQk9s2xfNhjoOb3E+L2DDOT6luiYji42C1lG4Si7x529655gk
	RjdfwXp/FvZMzBNQUujT5NTcCy6y9GBNOX6AVVc=
X-Google-Smtp-Source: ABdhPJyaaVKk3ij7jkLGVaEFAO4sePbkYDGdbMYrYwErWCECxFNczxoRpepU5YVttAHlwzlBujezG7fVoMI9BRWHIQU=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1764720wru.12.1640171852021;
 Wed, 22 Dec 2021 03:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211222015244.2464671-1-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 12:17:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2TujT7u4Y2hOce0h9SyRWuQP9+8wbXhZEzgNp5FSTwSg@mail.gmail.com>
Message-ID: <CAK8P3a2TujT7u4Y2hOce0h9SyRWuQP9+8wbXhZEzgNp5FSTwSg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] dd initial support for the i.MXRTxxxx SoC family
 starting from i.IMXRT1050 SoC.
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk <linux-clk@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LAxpISnJHqkxiUcWm5BbqRkrDwALRjxwyzOgZAkmM9UNj2E/ScA
 D8xfWTPspln9eUzYaMsCbtqk4VWKU/ehHUZ6mWgu0LloL6+u/8+hdS4CvhHI5YoXt8pmUQS
 2EfF33kn4WfC8CZYKqJsgQnKP1QNuzif4KcQerETs4ihcp5vAxt2YdzyH+fFtACz9sFNdxE
 Mb/9ggKM1zCYTPdEunozg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pgZaONUmvRM=:VA4PPuRYzs1kyDZb8TqVIb
 9ouLNp3+2nseA9+zLO21f0SqYW5oWS5z8RzL2k39mk42j7FqyKbNexi2GXHrsA5FlJzMPaxkP
 tjKyAhrSxRJexZPip16NNgpvaHfSAqbeV7LQOaV4ZkAFjsSPHzgW+9B+YMoToR8+mDy7/7kKq
 ReqvP1MfA2XNcAeT/e+zXOYO6okELFRHWo5Sz3DIXdQnLrGiaMaEdV6Z/yAQPOXKQCkslLbZA
 ozZQRCrTEehXiglHscxnUyUbVfJA7dhjk2O7b+kGZP1l0UbsexqERAE1TmH9bkSfSXW0yJueM
 PtvCKVw4m15Pp57NRsNXyWWakh0/Y+zc7ZARBrip3FkkPRbcqZj5Ktrf02FD3JfJ34T7BjBOW
 ufLrqy8dGYD5hSOTmZstTveB8vPZ+JtwiaoN9rS9+LgBuV42NhoecXYxJ8qUc0fOR/FqC7PSz
 uGzWuAQvuULTa2JCBYClrMg/vfKL6aqpXwf0FZWbRD0O5zdn0qkuq5pUhdPLjLZU1T192xVz7
 cMNVsgL9auM8lAOuluW0JCQut7Fa0XOOLrR1vdc0pFTiZm913ko7E/AaEyxptY6Tv0xKrSvgE
 rnhZkbraBdIg2rM5eMyTThvCrBmFCDma0BSu7w5ufiMoquDKENJSA2n7xu6dUOY1wR6EvLA3r
 kJ3ZNiV++hU/87bxT1DROoOkiDQnYMyxHBfW0mxgGbRi6qWOkoDuKLTGsJhi3Ut49eAI=

On Wed, Dec 22, 2021 at 2:52 AM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support
>
> The i.MXRTxxxx family that could have support by Linux actually spreads
> from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
> 100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
> with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
> 2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
> STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
> less layer PCBs. Seeing that these chips are comparable to the
> STM32F7XXs which have linux ported to them it seems reasonable to add
> support for them.

I'm in the process of finalizing the pull requests for 5.16, this came
up since you
have soc@kernel.org on Cc, but it looks like you don't have an Ack for the
clock driver, and I have not heard from Shawn or Sasha about whether they
want to pick it up in a separate branch or I should pick it up.

I suggest we leave it for this time then, let's plan for 5.18 instead.

          Arnd
