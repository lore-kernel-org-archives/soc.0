Return-Path: <SRS0=Y5q6=HT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB47C4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 14:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC29DC43391; Fri,  8 Dec 2023 14:27:57 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD27FC433C7
	for <soc@kernel.org>; Fri,  8 Dec 2023 14:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD27FC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67aa3b62c35so11626236d6.0
        for <soc@kernel.org>; Fri, 08 Dec 2023 06:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702045675; x=1702650475; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6tktGOmflBDjrD9owZW8jUp+CHgDfz/rbbtd4HS0Vg=;
        b=h/zrwhmiPt7Wmrqoal2ZOlktSCL00posL5OtPTw6wkyZXcSZJ9SD+JMRfIviGG/1Y4
         GF/hUGvBSsdVcf4FedDKkudui4ODBYxyP7Y7LtVSXYXzWad0iatHiTlVvIQGD9nJWyki
         x7KM+YSWWajJ5zkrcVa7rwn4krDfhIO7A+z8zJCR6GP1geWbXoKfU23JxVFvXkoUp8EU
         Jvvv4/usbUXayHkKm/xZmbHX9QrTAYeZ4se/sxOPSE7Ioi8IgD2ArU951oDq9zQLRhmH
         G4y2Kh+baRJtWGWAaFzCiD/RW8asp7v7BsGtzflSEZfa4TEnuAa5Mal/wLp2Gjs4uY2W
         3MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702045675; x=1702650475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6tktGOmflBDjrD9owZW8jUp+CHgDfz/rbbtd4HS0Vg=;
        b=bJtAR+Bup8Ea5WFNlW33N7rZ3TxBMMVlKLx29moqyBWHMr22ERKkDPVJXGR3FEKMzd
         kshp/vqHVw+dCznjXysnCnH/nXSEL1dIag9I4iMrUxBWnbUNveclCsFf+sj2GA///Iyv
         uAfF+cKrFkC2AC/WpAojJUEFPQWS6klJ4VM+tN9gXzNUa6stmz11eKxwzovD0v9NVHfn
         KmX+HFBy2s8WGbgApmhm/LhtjyQ1ydrzqz5Hrjbm4+Va2ctAIqdvuWqzlwgNrmdAbUzM
         Dy51bGN6bXzr9eUnvi//WhtQbTk5hxquZNXV5mdaR9MIWEMBtU11ckM1cDXw0lYnH48o
         ApJg==
X-Gm-Message-State: AOJu0YwkepMqG8nKmmGrSfPLQy1QK6KUJoYtW90VvH5+4n2EFd+OLGtx
	75lzyXpgdcj0Tn/yHXSn2lAX/G5Bqb4dcgiRkVM9kQ==
X-Google-Smtp-Source: AGHT+IGbiA6FsS80GfwV+c82tNjaevxVqMuJe5EJncnQTyRiVvDHSd4AgX2BqsQb6YkJ2YjyEjuCQy/avC/S0mz+amg=
X-Received: by 2002:ad4:5695:0:b0:67a:a721:e150 with SMTP id
 bd21-20020ad45695000000b0067aa721e150mr16777qvb.125.1702045675625; Fri, 08
 Dec 2023 06:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-13-peter.griffin@linaro.org> <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
In-Reply-To: <20bf05b9d9ccc5c11ef17500ac7a97c46dd46a9a.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 Dec 2023 14:27:44 +0000
Message-ID: <CADrjBPr_sv29Dc3F-4wVvH_N+qU6509kvHqkyZG==Q1RRpi5gA@mail.gmail.com>
Subject: Re: [PATCH v5 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review

On Mon, 4 Dec 2023 at 17:51, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> On Fri, 2023-12-01 at 16:09 +0000, Peter Griffin wrote:
> > cmu_top is the top level clock management unit which contains PLLs, mux=
es,
> > dividers and gates that feed the other clock management units.
> >
> > cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> > APM module.
> >
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile    |    1 +
> >  drivers/clk/samsung/clk-gs101.c | 2495 +++++++++++++++++++++++++++++++
> >  2 files changed, 2496 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..3056944a5a54 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       +=3D clk-=
exynos7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)     +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)     +=3D clk-s5pv210.o clk-s5pv210-au=
dss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)   +=3D clk-fsd.o
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..6bd233a7ab63
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,2495 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + * Author: Peter Griffin <peter.griffin@linaro.org>
> > + *
> > + * Common Clock Framework support for GS101.
> > + */
> > [...]
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> > +PNAME(mout_cmu_hsi0_usb31drd_p)      =3D { "oscclk", "dout_shared2_div=
2" };
> > +
> > +PNAME(mout_cmu_hsi0_bus_p)   =3D { "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                 "dout_shared2_div2", "dout_shared3_di=
v2",
> > +                                 "fout_spare_pll" };
>
> This should also be updated....
>
> > [...]
> > +     MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p,
> > +         CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 3),
>
> ...because we have 8 possibilities now.

Interesting, unfortunately there is some discrepancy between the
documentation again :( All the cmu_top clock parents were authored
using the cmu_diagrams which only shows the 5 parents listed above.
Checking the mux register definition it lists 5-7 as being oscclk
5=3Dosclk
6=3Dosclk
7=3Doscclk

Downstream clock implementation lists these oscclk 5-7 as well, so I
guess we should add them...sigh

> (I didn't check the other parents, but you mentioned you updated field wi=
dths
> in other registers, too, so maybe need to double check the parent strings=
 as well)

Yes I will go through and re-check these parent names again.

Peter
