Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403E5C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 00:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BCF160F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 00:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BCF160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+8nJ/6bHuEA0fvrc+p6WksOUyanx4IWDo66BqXK/qs=; b=4+KzSJSkelNBIo
	X6AkHmYVd6v9dWGSM9DG9SxBYwnokfSaS+86H5nyBV5A8pS/8RSDS8Q+QFz+S5qtL7/r7bEscImFd
	+lUgDXZvoXos2xvoH+oy6ax14mZiwd28evpH7NV7KT2+Gx942PxAF/DPn9RdflIKoZT2+xGYPQrKV
	2hM+iolptVsXdJuSxakeoOXnwROrzEd2pIg0BQEf4jQfTgBMdC5xx40DR090tL8GY9RoNAapdnCxa
	vT9s5QlieIQU7UB5jFQKmkDCjMxl4Auj9TUire7dn12kTunBN1LTmpYlAhrxMHRL6lYssaLLZ/WC1
	y/OX6ltPNFQlFkQaybRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4Sz-003g3Q-5j; Wed, 03 Nov 2021 00:49:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4Sv-003g2v-IW
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 00:49:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBDE4610E8
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  3 Nov 2021 00:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635900561;
 bh=pjrJ9Eim0F0Oy6cYcVGfpZbXWsGqTdRer6YNuWa3fSM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=VU2pufOzQdPRrooOyybnlYPyzgB76B+VV7nLpCGOuKlnCi0okow1BDMx043fXXyT1
 mpt/UzJs3iArKjzT9fvlOVNOLEd5yQsO8t7nmyT/ayaWoMfqXIhOcdj22VYvyV2yKA
 /u+mZ0WhKpPtXLmyO552bA36WO2PPVl3ggxLoi7O/Wk+ijIcdBGmhVL2sn4e0dOBlZ
 l95LpxfVsECEtmEXv+wFDdneI6I0xnYbr5BjionpzH34FII/uu4CTu7O2suOpvcnYA
 6XfmlAjr6fUPrcZJItwv3w2dOcMu0G4spLZujmbD1hMs0CJoHhgDOUTJxdrJd6vJvG
 keGNOWyXUQoMg==
Received: by mail-qv1-f42.google.com with SMTP id u16so938175qvk.4
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 17:49:20 -0700 (PDT)
X-Gm-Message-State: AOAM533aBZQHrv5cR0r0h7omDYjz9E4bAoO3MnY7VftJfrH4/so2L7Ed
 W8eoIc/LQbDu5+3SYfbT+9I9GMeGEsbDwu0xcQ==
X-Google-Smtp-Source: ABdhPJzXvE4KPNLzkDwnbcAs94NftZ33iBMfInyLwO8qRJqVzgK0V3bGTndcCGxrrpZVNQdn0uG8kngw9P1gPp/WRsY=
X-Received: by 2002:ac8:5a48:: with SMTP id o8mr8888572qta.212.1635900559913; 
 Tue, 02 Nov 2021 17:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
 <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
 <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
In-Reply-To: <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Nov 2021 19:49:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
Message-ID: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <b20788@freescale.com>, 
 Fugang Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_174921_677838_5F7B4ACE 
X-CRM114-Status: GOOD (  22.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211103004907.QlPxJVgtGoDjMIzu4v_odcRgmJnXJCuPfuZaoYbcgns@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
