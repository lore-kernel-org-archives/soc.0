Return-Path: <SRS0=TWVE=PM=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AD8C433F5
	for <soc@archiver.kernel.org>; Sun, 24 Oct 2021 18:07:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E200A61052; Sun, 24 Oct 2021 18:07:12 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3431C60E09;
	Sun, 24 Oct 2021 18:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3431C60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFK8N-1mTQRD1u5h-00FmMJ; Sun, 24 Oct 2021 20:07:10 +0200
Received: by mail-wm1-f53.google.com with SMTP id 84-20020a1c0457000000b003232b0f78f8so10563271wme.0;
        Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
X-Gm-Message-State: AOAM533JWZb0cffYj52A+ZmalfW5pyQqtvBGDdzj7vWqSy2YxvhqSIre
	dtBQ49rad4ur4KhsM1mIJPXGTBNkToZmfTQHB8M=
X-Google-Smtp-Source: ABdhPJxtbVJrHWYPggYA8yPeJNUl2q0CmjGNKBR3lA5Z+IxWQD60zbwZCG/IT3XsglTcMiUM4ygKRYscIv8VMUDJQ9I=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1339077wmj.98.1635098830063;
 Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Oct 2021 20:06:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for i.MXRT1050
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
X-Provags-ID: V03:K1:tPUTrcrVyb56jEbN4C+OmvyGOaA7oXuJZFPHJ+u76Ahn79iY3T1
 hvANBa6bSzN7WU0mFu/ie39frcsvr+9xzysD8lrjhOHSwPwI3642OHB/jwQIETognsb5bT3
 nAETBp4xfZPQCxw++blwXgTz97OLQLAaBlwMqmTmjMG+5u7j+IMb7mA/PWB9/p6tJPvGQAN
 7s4DzOSALIFNsDgGWjxZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sIFMz9MITrg=:PFwpoeCs7e31u+PNUUSvL9
 QsJwugo08gukR923NHkyOYYm60g5OaIzIQ/Tk0AddJyYnTx4dUVPmIwGL8Y1xqSd+Zzqw/+IK
 cMIVMLk797jmpzjVt82eY7oFnLRLqkGrlX1YmlnLAI/sFCB2hsx970UGAEouH3dMuoTttaCIO
 hqRX3txNRKpzWvtTvZpzxczhkc1eYP9VqgTIFL7b9hVAgZ0B3lQ0sCrfnWRaFB2EUwR4l6C49
 W/gqH8Vsh1DCsf4X9Ic6rh2tyz2mrHku+pYNx31Q0Q0qwCWHO89VDFL8TWDrcAKQ8IWgBm5p+
 ypUvDd+h3I7aL5menWbSaJe9/yi4SeLllQ2/Gig22TW+NEZz524phC2PhNWR75XZELY/bqftx
 TYypPSq/uQTN0g+WPV7hvCK6zEb5yhBNi3UMx+dV38elxRQZyhIvsDZ98BTU/stosdDI+P1bb
 yYviCDoBs3c3xO0TuXdOIEEsnYFdqrlsCu0Bl4BGeZoF5XmEg6wQpU95Uw2JHm/BxiRXkWXsq
 HmdUzhtYGnHp4MwdMamxCphpawsCKPzRj6705lMsQfGke4maDuGOjGO69kVw4WwpI82CiSjU+
 2li64VtnI71W3QQpSq2KJfPcrOf2EkB+Uc6fxkcld44LsNniFI03uidizQLsynomh+biBma94
 iyl8tDe+4wrb3RPCFyzIt0EQzc3qVbn4f4Jsagm0IjR3870I08021zEk8Hp3Ic0KWaBS7Mx7f
 c3r0OCYO1cBWM20gpoTBUAz/LJ/f3R5T3sfDuaYgL/a0RPnpChtGNpAbyMzzYZPyKGpRKCuFL
 5Nd4hJI2zwX4Qq8dh9G72hnXpda/ipQ8AP3794nrEDgrm4osfo=

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> +/*
> + * The pin function ID is a tuple of
> + * <mux_reg conf_reg input_reg mux_mode input_val>
> + */
> +
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_SEMC_DA00                          0x014 0x204 0x000 0x0 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXPWM4_PWM0_A                    0x014 0x204 0x494 0x1 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_LPSPI2_SCK                         0x014 0x204 0x500 0x2 0x1
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_XBAR_INOUT2                                0x014 0x204 0x60C 0x3 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXIO1_D00                                0x014 0x204 0x000 0x4 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_GPIO4_IO00                         0x014 0x204 0x000 0x5 0x0

The constants don't appear to be needed in this header at all, as the binding
looks completely generic with a tuple of five values, so  you could simply
open-code the numbers where they are used, no need to include these
in a driver.

        Arnd
