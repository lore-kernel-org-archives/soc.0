Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F5BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 17:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1630F61040
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 17:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1630F61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ewlK46uCyBQbgACg1DKw+dLFzT8Fi/EViw/gFWweZc=; b=KzRlYz25EZmz/G
	m3258V6Wz75QU1hvtYvlv7GPsr/BsoqPcnftERgi8Q0Ar20FySYkl7kCZyfnSIRYQ+mMcvMamNVMj
	/nZ9RSwuy+fBM35YkW41ZGMIxftfyhZ6bRHT6iYJ2KemG9k1vTGONFBMMfSN/gJC8OWZ2BGSeRiph
	SkRE2Wgb3rwv1ROSrJnQpmwdGFGqPAfoMHy9JxxY8kX2dR76W1nzwbi10aNISXYDNRZVGUHDfUDHv
	xngLjRJwvjFudXn5CaqR57GlOn8fn5UQP5l/fJVv8Q/nj0qCUD+xYciW6Eo9orL1+FJITwQlrSy1c
	Bj1dV57cRrxCraLwEhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mehgh-00EQZb-0J; Sun, 24 Oct 2021 17:53:39 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mehgc-00EQYV-AD
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 17:53:35 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MiJEc-1n8nJ13KDu-00fVyc for <linux-arm-kernel@lists.infradead.org>; Sun, 24
 Oct 2021 19:53:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 i10-20020a1c3b0a000000b0032cb02544aaso3030751wma.5
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
X-Gm-Message-State: AOAM5324Fx4Ss3kyFv9j4+WgdUgkWqgbVao9H+Yx3AhHnlxxbfwZLxth
 U32WYwSFrkJSBDzoC21Qa8NrMr4kq//otiqNwjk=
X-Google-Smtp-Source: ABdhPJxAhKvKxvRV90kejl8FnT17ZZByidqHhrwYyLntatIyXa6+UFeOuZK/953n6F+p+BmGC4bLZFSksrkP/BWw3Es=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1275704wmj.98.1635098009501; 
 Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 19:53:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: imx: add initial support for i.MXRT10xx family
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, gregkh <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 giulio.benetti@benettiengineering.com, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com, 
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
X-Provags-ID: V03:K1:B5Xecb/JyaNCZ7g5Z8um4wRFlxZCy/QJ+Z6oNbuB90MitOHSD3P
 JK8VG3l0CccorJVps3GmdjcOXuhVAiKD8FBs2GSQP0FEp2cu9Gh5Ouloty8Dsp+zAQHbFoA
 BCwGWHj/V9HVBL0HxC42TBBMZ+96s89kCKF4rV+/WccZ92anLkr82OjLh9UQ9mjP8Q9kdEM
 +oTg8D1ZONVMNo3C3IFkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wOhUBBjyK6k=:/G8FAdbLSjfpfU7RuEctzi
 37YYEIFtriwJ0Eu9JTOEWjM/qUO9eNFnXjWU3GHyeIS9+gVz73yJCugqFqqMWwW6T6Tbzo9ri
 8FkGHzq3DKpZsbOl2TUC2053t0IKCYLMle/MrIapbIs9ZO3MreL9GeiGoX7Q+msPVOid+rVpd
 owmoRsLhJ2mgmWB7KvM34ac3fU3oIMAozVIm53/e0AhcMi9W3FhxlF0GjtbcDjiUGgt+yJ/o9
 WWq6G/NOfVxOePxa0Gf9vSZ3qYQ8Xa2Qrm7/FrepqtPipoH3l2CVf0eIaK0mxYpeIWCL4hkN9
 7+m3gXONuWd4ppeBK4nr/ffIo8INPN+ETGdwM2dpo3kdh8xDsINdqWB6XmPWrkMk9ZsseU/29
 Xwsr+6v0PtlML4Smi5ZF+IiUSs8f7Z0bpbWYA8U4akkXg8rjZ69bndD6cvoFg/KudyG+bpVDn
 9dXGCEGKegRAZj3G7geQbEvvwkeyfYEA+x7QsLUEU+QE1hBrVle/nUIaa57Rgi4WuNYV+1D7H
 0+vNDrQ9t8cjgaVglY5B1sX4xU4q0olg+CoZKpFIoogzPUpwgS3Xj53My0uimd/5sZjxm0JpH
 6KrPKnCfzw4zD45awaZ4xeYAyM5PJOs8hzfdGMLcek6hB9ycgVfGTi5vTrLiNoY4AJ+CJdTaQ
 9p8zaW8XptyaLlveo3aPoa+l92psqvuDgPyoXRHHFgrQF9uThP/gw2F8xuF7sFzxb7XypCZKC
 hXECdT2MYlDdIWvPZF0/B+55XYhZbw6DM8V3zy0s/rHeZ8zz08KIeJCJ/uRO5Lu8okHjfM3H0
 bBIDFKf7qpjqCXyoFIrbOVgSL9euneVBti4sQ8r8xMLUvpi8II=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_105334_686246_349C9D68 
X-CRM114-Status: GOOD (  16.54  )
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
Message-ID: <20211024175313.gMf8sElYdTtdtgn19bjwWw5il6YBFUjxoXnWPbgv2fA@z>

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> The i.MXRT10xx family of processors features NXP's implementation of the
> Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.
>
> This patch aims to add an initial support for imxrt.

> +config SOC_IMXRT
> +       bool "i.MXRT support"
> +       depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
> +       select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
> +       select ARM_GIC if ARCH_MULTI_V7

The Kconfig entry appears to contradict the description. Is this platform
only for Armv7-M, or are there also variants with Armv7-A cores?

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
