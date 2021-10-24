Return-Path: <SRS0=TWVE=PM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C13C433F5
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 17:53:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF6656108B; Sun, 24 Oct 2021 17:53:32 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C743B60FD7;
	Sun, 24 Oct 2021 17:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C743B60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MYNW8-1mAXmt3nz0-00VOTi; Sun, 24 Oct 2021 19:53:29 +0200
Received: by mail-wm1-f54.google.com with SMTP id o4-20020a1c7504000000b0032cab7473caso2243361wmc.1;
        Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
X-Gm-Message-State: AOAM530KjnP+tFjXQ62O84bHQiCdjjaVNO0KASBFgvniMxIwzmM/pj6k
	XeUA37lGK0h+p7bInfZNHXt4DxE9e8p9oSTsomU=
X-Google-Smtp-Source: ABdhPJxAhKvKxvRV90kejl8FnT17ZZByidqHhrwYyLntatIyXa6+UFeOuZK/953n6F+p+BmGC4bLZFSksrkP/BWw3Es=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1275704wmj.98.1635098009501;
 Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 19:53:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: imx: add initial support for i.MXRT10xx family
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
X-Provags-ID: V03:K1:ZRo6yk6+9B0bFLfmM5rCluYtA0iKDsw9n6p0S/81qJKB509/Eh1
 /Vr3v95SydUjkWj69dP1cTIgUHtEoxHHk+7FCKXBkAIf93rnHBQVaYn+utJRwvFjZ6an3Ci
 agdlTXlKK9AP4JsqK/zcv/z0yby5DhNywnXTNPCZW5fiq2vPNCr5lhm4hfft8Q9C7QohwIv
 ZPaaoMqfT9Qn/gLRgyVOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EVOCgYK+4Ws=:B95Mk1tgOpEusWwjkQgZV0
 oeIhhTL8IcHPxnICAFgpHBYUY0PVXhp9QAvq5POSme6J4+ioetrx2EJvZLTXynUjGsajm0giE
 yEKSDDpxEZa8xx0YDXtCaLGgcXCWGoDP8+xebCW5XfX0CJG8D7Gg2o/6PlFQUzW2L9qxB/kBR
 9heQyeT5r4LsfDYd5q5/F8df2cPoKNnkydKjXfNYEFp08ZQqB1PYjW9f3kgidELPU2+BB3//e
 pqL9PxGaHMPlXpRjqKDdI7fAIJ5bu3DNhe33UFS8CJc0xK0t45bycFMKChCeqqURxXTYgrUcj
 7nfk2Ui4YcrMrw2JHqzMkFYq21w3y6dgATI52HfkjJwpEeY25JZAEsMw1hNCt9yXosSjgn/il
 FYh8BY56C03xkcaY5enrC68t0X5h+dC0i+XXpQAXCJ+eunVZ6ClZxbhG3m3mYicae1gezPHuY
 8hvHaR7fcnptnnbsqAjnFul7oIEffAiF637zPje1+1h9bkRNYJA/rmBQZSJd5mewuRgAFCQql
 FzoToDyE7vFbBuMSyrFSFkhTLnN7rkST5oyFMy7TuuK2sy9Px4iSkpFvGu5DjGN3m/OCTP/RO
 iocpxtBvOdS32HoCzkdNNVTEHaIXdzPOrOBEot1ANlQEathmOqZWY+8+lywATux2Vy4Aalshu
 usinqhPFGI8hi/1H3C7SIyz9OMUbJkM+0dnMRhLzrOn7sIes+Uvww2GBUoG3wg4mB721kxfhl
 al8jWbA8WdCvP3Ys/oV2anc0xpDiMp8r5OsYqt/JSUXeogymWVUzdcrnc5y6WgG3M79CPSTZ9
 k3i3URM6g1vfrU5zb2YesvCUzCyKmOEopiFazlVoc+R9HcW6WI=

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
