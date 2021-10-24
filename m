Return-Path: <SRS0=TWVE=PM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743D6C433F5
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 19:33:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2EEA361077; Sun, 24 Oct 2021 19:33:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B51D6103C;
	Sun, 24 Oct 2021 19:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B51D6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfYHQ-1nBa142GE4-00g2fK; Sun, 24 Oct 2021 21:33:06 +0200
Received: by mail-wm1-f50.google.com with SMTP id m42so8530819wms.2;
        Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
X-Gm-Message-State: AOAM5322Oc0+qV4nYqyPp1PaQt+EDSHGl++y1wCFSK+xHtAgY5W9cFIx
	8K/UQB050f3bzCl66p6mlQvOPReoZPpgJgS+XP0=
X-Google-Smtp-Source: ABdhPJw4hH7C/a2zk240txDvHL7tN8+k+dIxhQayqZg6YZyRuMpfgd65spSGiNjZlg56v83/yxP5Ni8w6w2+98dAEhQ=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr15117795wmg.35.1635103986146;
 Sun, 24 Oct 2021 12:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 21:32:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Message-ID: <CAK8P3a3ccWgpQF8-Ej7Di_=eCs+cibDgiY5962iPKsMgzD_qSg@mail.gmail.com>
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
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
	giulio.benetti@benettiengineering.com, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com, 
	Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WMTl1ghuP4kck26bs01rHf5N3QwZDGDibjkfyoM1rwmIwbwa39d
 UzxYOOOuj48Y9Uker876THvGaE5L847M0Q27h6+H5yKwZXTT/KLShoA28qFpxJumIWmWWdH
 /CNyFDoT1jtJls1llOyici6YrUqgwMyzMpEwGZsFxQVPu/ssuYPPSOIp6KREmEFbjyWX+c+
 cngplFziHvUkMkuJOXPbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k8yfeHYzGt8=:sqF1XUBWsGSBn+fy78FBqA
 vRLk+o283tEagtZt0QnRn1VcTogxfeaXdhcbH7W23q2iee4FFaAee43W867YEoVhUcIs6r0Md
 29yixKdrIM+reyXp/XmXxoFKEO4EsAPopaq3q94K/PGyIcGYZR86l8vuF7vnMtA5aPMkDX6/G
 ntBqtWehSPWUzWGt1+7f9fCwUf+vbeiFNJ4Ks4TXDm9SivxpHdV9GGMIgMq72eVsXpGDbTAdI
 4CG17nEbBW/9RwS5tVSxFM0aNMsStLUZ7QXCe0PrZ26BT/ACbB+1/hye/owxAhmM8C8US0siu
 D0qIyT52ThjWvPkPkW3+0HIEEkQt63TsbuD8PB1r/9o3XEIrSx3T7ZTrZ3OdFT7Ugq7OoJ8DL
 rEQbBUFTBfVXLYiwBF4xxmSPyijanlUMQBfo7ECWdyvoB9zKo41oKToo5IBwV86i3SCqCaemI
 o/uosR0CdpIr2OP8biLJCDPZQtENeVyGFoWM1X92MABvEhjy0vGeiC5VsO4MwA0R7QdlZrtYD
 qlm7G1YspUldf83xRfoJ9AorkYoEaRPoRvJ9mf40Nvdyz9QzciVBIa7TZc1po1AfaLn8sG3HX
 SOn3l9RikCKilKlMc3PvG1LPXM957JKqLmS17sJwSZPLqy5qjuYQP7wgb7jslSrhgM+7JA2nn
 HB2miHnOS4lYjonPeuY+0StqpcwUYDfTDcftlpXOa9yJQMVnMcUpR4Lx1n8g4aQEtXs3CItDF
 KNcdcmOYWlcAjUqzeqhCjepvnQ3Gqd3K34aLo9SrisaktxSKmKyA9L999tFwpxeeA+mm0to8p
 qa9kiaOQua+XC9CharpnasYVmYGV0jPr0gARR3OPK3AQ4Q3v+o=

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> Add initial support for the i.MXRT10xx SoC family
> starting with the i.IMXRT1050 SoC.
> This patchset contains:
> - i.MXRT10xx family infrastructure
> - i.MXRT1050 pinctrl driver adaption
> - i.MXRT1050 clock driver adaption
> - i.MXRT1050 sd-card driver adaption
> - i.MXRT1050 uart driver adaption
> - i.MXRT1050-evk basic support

Can you expand the description a bit more so it makes sense as a changelog
text for the merge commit? It's fairly rare these days that we add support for a
MMU-less platform, so it would be good if the introductory text answers
questions like:

- what is this platform used for, and what is the purpose of running Linux on it
  in place of the usual RTOS variants?

- are you doing this just for fun, or are there any commercial use cases?

- what are the minimum and maximum memory configurations this has
  been tested with?

- what user space are you testing with: any particular distro that supports
  this platform, and do you run elf-fdpic or flat binaries.

- are you planning to also support the newer i.MXRT11xx or
  Cortex-R based designs like the S32S?

       Arnd
