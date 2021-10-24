Return-Path: <SRS0=TWVE=PM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0A7C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 18:17:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 097C161050; Sun, 24 Oct 2021 18:17:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526A560EE9;
	Sun, 24 Oct 2021 18:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 526A560EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5wY1-1mco6t2q9j-007YM4; Sun, 24 Oct 2021 20:17:28 +0200
Received: by mail-wr1-f54.google.com with SMTP id z14so7340920wrg.6;
        Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
X-Gm-Message-State: AOAM5337zxR3c25MNtB5r74GCEfEoz+BjHMtnlVxyeE3xq4JO+hJJ2af
	hShgwSZhHHT5onAycqWoPAuxdGZtJhiOEE/ws1c=
X-Google-Smtp-Source: ABdhPJwA4yx55xXPjGdoweMWLIzjsgLLmIyhDfO5RJ81PIjOMOGnfiDjEbR4fO6wCEdBYAYuSOM2cYFl2DdATduylko=
X-Received: by 2002:a05:6000:18c7:: with SMTP id w7mr16559015wrq.411.1635099448118;
 Sun, 24 Oct 2021 11:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-13-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 20:17:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Message-ID: <CAK8P3a1aZ-LMANnvcr4XX=uTbut78yL=48E8iLHr3AFgVqpi+g@mail.gmail.com>
Subject: Re: [PATCH 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
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
X-Provags-ID: V03:K1:nO+NLuIPKmnTgN5pNe6CBUBlzB13v+3ezV8KurZ6V44U9hQ0mJQ
 hc/RVkGl7Wl5RJaRRWECaKwn8TJD7E4Vd+x6Sd98rPSUTO6F8PQFQ94h7bzpgWaX4ZnsPCA
 GqzOxT2AGL9wMimiJrjwdQT68vLxwTqa+nXoZ2iHQZ3cFjdPJLcA8u62ioafXbABNf2iugn
 1YdYBv8eP1COydRca/XnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rO7pSJphU0s=:a50IGdbUXOfoUbPfw0hMQp
 jTKCeI8FAFH4g/7jJR5bCtuTrvsObC6mxZPWn+X99k6E89lG+tmZIrIRX7uJMF9bc8lpmXJBY
 kkFY+DWEN/q+NgsosgBIlb99Hm3x81vvjfIGh88vX+Dq4SE1ZSgdcY943vuHQ7cd+zQKPxUeb
 TDQa8guJXIf/VvQiEWc1TFIMTHBgs0hO3OqTEk1eKnWmZtn8K/h3NsokZ1uuaqDZUWmKGex7n
 V6XIcIMYAfvzDzRdXAboBoEmcDd65ZlySfHia5FISphQXEF0hbrdltwp6bzqSRIFvIY7QOr4W
 scG/El8SxRpyyscM0/ZnZ+rehqnirCdDptmSdwRPXA3nZ1QXQIyxkDQtLRmjzEgP3860h4kRV
 fncvcShcNmGsZbT80yMz6GzLGje2+YgvhYHxLZ6vhba9HjyJqbnYoLaX2D3fmv0pei50AaU8N
 FuRtmZ7uukFa7iHUBepDEhxCzBP3e6/SwlSZkQggZ6PFzWXvNy1+4Xf4nwx7fhftd1KyttPQ5
 q7K4iqc4Dtm37DDJxx+ImECEgSXwjT0akoK70kSGN92SgVqDK2qSWGlC8TEZKlc6ILjbQFIyK
 Jrz2QjXujmG5NjjaQxskNIcyZmHQP1zW5gpqIF33X2Gd/Y90aYM6oZamZsGJXTy0tmy8MQhCT
 CS0ZitxI1rf5cip512Eh8CuuvKfFNaTW4/87wRF6NfCZDtiUPV8gRa4q1TzLEpUO6dmQbvc/7
 ol2D/FLbco/s7NwAgxST3f7SC/XMwOpThFjtg4WdNdMybuLwPxdPh/y49BML4ZA8sICNSZ17w
 TtMKhaQyGs0NYJBJ3z9CoG4c6qJppD+PSbBOBVO8CtwAzJU5dI=

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> +               pinctrl_semc: semcgrp {
> +                       fsl,pins = <

This node doesn't appear to be referenced from anywhere. Is it actually needed?

> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       aliases {
> +               gpio0 = &gpio1;
> +               gpio1 = &gpio2;
> +               gpio2 = &gpio3;
> +               gpio3 = &gpio4;
> +               gpio4 = &gpio5;
> +               mmc0 = &usdhc1;
> +               serial0 = &lpuart1;
> +       };

The aliases should go into the .dts file.

> +               edma1: dma-controller@400E8000 {
> +                       #dma-cells = <2>;
> +                       compatible = "fsl,imx7ulp-edma";
> +                       reg = <0x400E8000 0x4000>,
> +                               <0x400EC000 0x4000>;

Use lowercase letters in hex numbers here.

        Arnd
