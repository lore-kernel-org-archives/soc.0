Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707CDC433F5
	for <soc@archiver.kernel.org>; Wed,  3 Nov 2021 00:49:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1296E61154; Wed,  3 Nov 2021 00:49:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7E34610E7;
	Wed,  3 Nov 2021 00:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635900560;
	bh=pjrJ9Eim0F0Oy6cYcVGfpZbXWsGqTdRer6YNuWa3fSM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AYHrIY79hM429Qq0AHrXJAo11CSRSPfTlOsD3hUz77rpXEKsjuKUHuct86M2Ad56P
	 6J1bfideITTZOMQDMgJecpaV/jvjdd3MbxPkwNfOB9sRQ8Orq1GligxlLm5wNe9REa
	 cWjXOZws1KMcch182B8PpTKlk2VTsPRvUojiEqaL4G2h9h/SNOmCc6wHDTkyYIUkSh
	 QD6zpdaSBUMjONtzbsYM9hC1Mzz5f/xoWlRJrgsOOG7PeQDCeezQONezqhpIISCaa8
	 2diAahrEwHjlO71l5Jfg7qMXJX5dYzlxj9gIbUVnXz4X02jyf3ce6YaeV4EDiD7Ar7
	 O2/SdTZs5a02A==
Received: by mail-qv1-f51.google.com with SMTP id k29so938168qve.6;
        Tue, 02 Nov 2021 17:49:20 -0700 (PDT)
X-Gm-Message-State: AOAM532vWpzspZ3qztHxMwTM64Tw5kGW/oyWPcrM6kxMwl93qigBSGqe
	zrS2kSde4xaWzrfZCVj6PUY2RY7ZaLmDZm8qCg==
X-Google-Smtp-Source: ABdhPJzXvE4KPNLzkDwnbcAs94NftZ33iBMfInyLwO8qRJqVzgK0V3bGTndcCGxrrpZVNQdn0uG8kngw9P1gPp/WRsY=
X-Received: by 2002:ac8:5a48:: with SMTP id o8mr8888572qta.212.1635900559913;
 Tue, 02 Nov 2021 17:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com> <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
 <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
In-Reply-To: <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Nov 2021 19:49:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
Message-ID: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <b20788@freescale.com>, 
	Fugang Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
	devicetree@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 6:34 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
>
>
> On 11/1/21 16:13, Rob Herring wrote:
> > On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
> >> Add i.MXRT documentation for compatible string.
> >>
> >> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> >> index a90c971b4f1f..4b4340def2aa 100644
> >> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> >> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> >> @@ -21,6 +21,7 @@ properties:
> >>            - fsl,ls1028a-lpuart
> >>            - fsl,imx7ulp-lpuart
> >>            - fsl,imx8qm-lpuart
> >> +          - fsl,imxrt-lpuart
> >
> > Actually, 'rt' is not a single part is it? If the variations are same
> > die, but fused off then no need to distinguish. Otherwise, these should
> > be SoC specific.
> >
> I don't exactly know what "but fused off" means I would assume
> disconnected but on-die?

Right. Or not pinned out is another possibility.

> The imxrtxxx is a series that has the same UART
> controller across them. Should I add ACK?

Looking at the errata docs briefly, there's at least 2 die as some of
the errata docs give the mask id. So they aren't necessarily 'the
same'. You want the compatible strings to be specific enough to handle
any differences or errata. If you only care about the imxrt1050, then
I'd just use that and move on. Otherwise, maybe someone from NXP wants
to comment?

Rob
