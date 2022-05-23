Return-Path: <SRS0=4JMP=V7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F1EC433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 07:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 335F6C385A9; Mon, 23 May 2022 07:56:53 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88E6EC385AA;
	Mon, 23 May 2022 07:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88E6EC385AA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f182.google.com ([209.85.128.182]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M42fA-1nt2vp0y0G-0006P3; Mon, 23 May 2022 09:56:49 +0200
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2f83983782fso138548157b3.6;
        Mon, 23 May 2022 00:56:48 -0700 (PDT)
X-Gm-Message-State: AOAM532sP750LuSfqjcEzriPjKUO64N0tPbQiSrX7RXXZaRDNCqkrGjv
	ohh1g5qykMqpgWQchrFMZBS0x2itmngrH3v7Ot0=
X-Google-Smtp-Source: ABdhPJw2LHiHqq0/Y/VzFvweK5WuNCUQUczMcSAr5ygjJFwwWwAtTaZ+A1Uu9aWWOiGiwQN+ltRnCtbf6WnrGsZfDuY=
X-Received: by 2002:a0d:e64b:0:b0:2ff:8745:8a75 with SMTP id
 p72-20020a0de64b000000b002ff87458a75mr14867694ywe.495.1653292607699; Mon, 23
 May 2022 00:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032710.451537-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032710.451537-1-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 23 May 2022 09:56:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0OKQYq-LPxjtRCNoD+coEcEcJD0eL_SV3aQ01BpyQVKA@mail.gmail.com>
Message-ID: <CAK8P3a0OKQYq-LPxjtRCNoD+coEcEcJD0eL_SV3aQ01BpyQVKA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] Add support for the i.MXRT1170-evk
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	dev@lynxeye.de, Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	Tim Harvey <tharvey@gateworks.com>, Leo Li <leoyang.li@nxp.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, clin@suse.com, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:s3HRfvwSLs+8Q6+og09BGj2F1TgqywNfGSS2rbOPDhv5qawUBG4
 1y/gI21JerMcuw8cTOAvqTt/KmrTBTGW/um2tUf2QA1jMNNTjZRHStQd9sVOjnyDprGDInl
 mfDd6tZIU60YFhtEPkcQMpB+b2JUaAdbuyVrXRBhMFhq6uZI98l7S6ydeeW55kZANabcNmn
 EwlXqQMreffZKJFGftpSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ARhYVZw33WE=:Y23QLqNMUrPB8Xk43odJQD
 i4YaRz8MTCv0uu+YOPAh613nSsSCAJEPW7vJcAJcHssZU7AfB2MJ1IaEYUGhv2Mjqu8HuBHwl
 0zccS9ar3OdkffoU/24h8MppUPjzOrDG6go4FVwMsAKo4GAqwBR8Qc3aM1b/y2hhU/p+5hyKi
 RVV4xA1JZXdIMd+EY7SLrMY6+Itk9/GoTud3aQwsVV8lHaC5W5TBDqHHl9KHyhZiMtmlX24pv
 UC/nRNUXPzaBgCyTS+DvA5MtFmjxiGINshftXQUEEkOiZAmzbaFewFlHTMxRiVbxA+lAyZNjW
 HilpIlgUBmlH/m6+8PMf/6LT9SMo8GzmSRTczWrusI1a/DA4XFtAwGmBGJlXcXMNcKOq+C0O/
 GaWwjuN2Zlb92IalzRMzl/nRFEK/gA/r3LbPm3S7n/gMo43h30ZZPJkOxyBe8ceiS/dOcPcXM
 o+DNbGHfFwn8mWXK5JDy0UJ74F0rP6LJ0gqTIdJ05u9yX9IOATT0j9wFr+f+SpA24NET3argM
 7s9RuRRIj6uZdVz0nB8IFfrEKOLMQe7wXVVZq4VUX7d5eyC5nHZUmP2bN/RD9ezW9UPwzUb5i
 WnnE9pz08RISVPEpaP4PN26Ss2vKWMr2TflsrYhJTVnteDqQThd9/+GO1YwpFLSGvWAg8PNzZ
 tvL5IzUTsxO4Uzruf7RrPIz615X0mdHeNPlzqI9ri1tkvM+UV3dJPQH6b7GTXx+X9cAYiQ3kN
 cSi9wbAdsMMWfeGrz1YFEf/BURqWNAhvKnyu3g==

On Tue, May 17, 2022 at 5:26 AM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> This patch continues support for the imxrt series now with the imxrt1170
>
> This patch contains:
> - Update to imxrt_defconfig
> - Devicetree
> - Clock driver
> - Pinctrl driver
> - New pll
>
> This patch also updates some documentation for both imxrt1170 an 1050.
>
> The i.MXRT1170 has a vast array of features including two cores. 2 Ethernet, 2 USB phy, and a 2d gpu.
>
> It also is featured in a new google coral board
> https://coral.ai/products/dev-board-micro
> Not affiliated unfortunately.

Hi Jesse,

As you have added soc@kernel.org to Cc in this series, it made it into our
patchwork instance at https://patchwork.kernel.org/project/linux-soc/list/
and I'll at least reply.

I expect the i.MX maintainers to pick up the patches into the individual
branches in the future, and not keep them as a single branch for your
platform, with the pinctrl and clock patches going through the respective
subsystem trees.

I have marked the patches as "Not applicable" in patchwork because
I don't plan to apply them, but they otherwise seem fine. Please drop
the Cc:soc@kernel.org in the future.

      Arnd
