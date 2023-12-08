Return-Path: <SRS0=Y5q6=HT=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393A7C4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 21:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7EEEC433CD; Fri,  8 Dec 2023 21:14:34 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8B39C433CA
	for <soc@kernel.org>; Fri,  8 Dec 2023 21:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8B39C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-67a9febb2bfso14364366d6.1
        for <soc@kernel.org>; Fri, 08 Dec 2023 13:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702070072; x=1702674872; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMdZYz3DPUe4bdT/CXZ3OjIbw+BdLseGOOZQ+mLDsoY=;
        b=vw+n52vfP6DFHMbQAsdM302lPO0m7pBQEJ3slLA8D6Uz2chN6FUvgqM9btq30ueow3
         npl5MrEFiEhoWzZe0j+U3wSrBPtSuahyuV2gjzTsSHzuCtUnUkktyulGiF4xIJYvMEwW
         w5G9dgetAlafIIvJBNjPuvnVLBB5CD2Cmf0bBgzkewGxjDOsdXk/rSaV1a0t6F1kMvgV
         zMfWZ/sEnuGZ8h+zxoiJdFieKuxVCowamI3bY80Ph4Jh7fQKahg08Mhi6f99iPDfZ7Cz
         KH9FV58gQnsURU63yMb5zOYr/SEhO1bDzPofKEyUW2q+rKhUZ8F6l7KChQFJ9UoXUvO5
         qQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702070072; x=1702674872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMdZYz3DPUe4bdT/CXZ3OjIbw+BdLseGOOZQ+mLDsoY=;
        b=fr5KT65ptFxCVR9kj3uE/gFZzJTa2ShlOjYck07C5ToOduDVqqIAPznkYXiN7UMQgt
         sI0oEZQy6+GjxnZIqeBZuP8QY9p9geZlmBz81HvoN/MT1s6jysEh0KO7EFgnJXt/vIfl
         xZXlpUT9qlrTaeT76jtMhNp3h768FuUOraWfDazQy41s8qGgtOCzrzEYeaPqT3pwW5az
         20NNkmUUBI9CYQtFTHNdoNJDyhNi7IcKcT0SOlUO9I8J4/omn/2V2GGGwpUzvwNxAKL1
         8fcB27XfoBVdc3EWJ2hGxGkp66moXKPLwYIBtzI9rpE+m/wZzHgeKe6ilO6EZNWWc+SP
         /bvw==
X-Gm-Message-State: AOJu0YxZyCF+8c1Ug3hbq6qU5Z7Z3AJTys6Zqc/n9TEnCVnolcgSN3zk
	Q7/vQznMrFnveBpvYE7b9aRKDzJ3lixirbH7JviuPw==
X-Google-Smtp-Source: AGHT+IGpulKyZ3OIbS0DyP2qkU03il9CmjBCOxhzoGEpedDhT+htnC+NzAmQyXg4CgZlNXYQiSL6lZrAvMlkclzO+XA=
X-Received: by 2002:a05:6214:a91:b0:67a:a721:f304 with SMTP id
 ev17-20020a0562140a9100b0067aa721f304mr526927qvb.68.1702070072556; Fri, 08
 Dec 2023 13:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-13-peter.griffin@linaro.org> <5e9c0b1c5885775a7bc32ef59cb09a2a93d4cbe1.camel@linaro.org>
In-Reply-To: <5e9c0b1c5885775a7bc32ef59cb09a2a93d4cbe1.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 Dec 2023 21:14:21 +0000
Message-ID: <CADrjBPqAjqW27TvvT3BpEovOsouRedsnB49qdkkgSto=z0jM3Q@mail.gmail.com>
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

Hi Andr=C3=A9

On Tue, 5 Dec 2023 at 07:52, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
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
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +
> > +#include "clk.h"
> > +#include "clk-exynos-arm64.h"
> > +
> > +/* NOTE: Must be equal to the last clock ID increased by one */
> > +#define TOP_NR_CLK   (CLK_GOUT_TPU_UART + 1)
> > +#define APM_NR_CLK   (CLK_APM_PLL_DIV16_APM + 1)
> > +#define MISC_NR_CLK  (CLK_GOUT_MISC_XIU_D_MISC_IPCLKPORT_ACLK + 1)
> > +
> > +/* ---- CMU_TOP ------------------------------------------------------=
------- */
> > +
> > [...]
> > +
> > +/* ---- CMU_APM ------------------------------------------------------=
------- */
> > [..]
> > +
> > +/* ---- CMU_MISC -----------------------------------------------------=
-------- */
>
> nit - the CMU_MISC comment here is an outlier.

Will fix.

Peter.
