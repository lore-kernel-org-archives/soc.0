Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13616C4332F
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 19:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1F76C433D9; Mon, 11 Dec 2023 19:46:19 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B821BC433C7
	for <soc@kernel.org>; Mon, 11 Dec 2023 19:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B821BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-db537948ea0so4727745276.2
        for <soc@kernel.org>; Mon, 11 Dec 2023 11:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702323978; x=1702928778; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTeSUxrSykIw7I7YvDs4Fui8ab3WCE1QDiM2/J6ViGI=;
        b=OUzS4Ac9nEYzdnsrDddSxwRLO86xQ1scQFCEXkvk4MTA0NjjnaEHyBDHGlfKizEPIt
         f/THVFlZUZm/DI6pZi+j/ymKekonbWoljdjd+itrqbSeZJBIPxVKM+yGgQGKmfql7Ho4
         PDDbHemM8zxkGwuYYayYjwJ2ji1zi8PNlD4/hv7uX3r4U275iSQIVxgld5PtNsUrQ3iy
         2zwzoJ0kYcJZr9wIbuzyPhJRApyQOI6FtctoFJUg44hoF0/gumWGEUMxqvBd4zmRjzna
         +FjlG6bJevATDRC4IubuvizNc1zYE6o+IuiD9xJw8dwIiWdPlj1g8oeu/I9jgSzxGQXy
         oMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702323978; x=1702928778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTeSUxrSykIw7I7YvDs4Fui8ab3WCE1QDiM2/J6ViGI=;
        b=r2V88hbdJ0f8y0OCY2fYjOZxDJQqxk22E6IoE3EpRQBHQn9TOmkkZ3uS96wWbywH2v
         zW6zxK+Tf3fylZ6ZTWgQro0Nzr3k93bksAjmi5iqE2wrPML3/9oa10LI68CEAXJ8r3Ng
         aNTQYdedFj1PtJktNo0+ggweZf+0urxXP+o9CDLyeFdAP+VRupjnB6LG1bS62aTVQE95
         pXxjMpKg9ChuA+8SKwre97+unM4wBDmyCLZD5TEZzh1bAdJ/6v199zPIRnbcC7o84Wt9
         NjFvBFMSD8bfyoKPGxRKsJWLRbelOorSZ2giX9fbDAuc74Pqi4aPILMRE+gvjE2iVTL7
         u/cQ==
X-Gm-Message-State: AOJu0YzzOyiH8XwLytIoIhO8dgitPsrd79vnFcRifjCLUXw2qqhrmX0D
	4bIRqANiYSPlo44dqaGu8cxnPTLovpCcIKJCgzT+zA==
X-Google-Smtp-Source: AGHT+IHswS/zKdRCASUc9ie39QTavfGoVLFXGgY+/DITpsMOqyQNhT0tlQm6Qgrmdxlk1QdkPO5OCc3GD+qSIcfxiqE=
X-Received: by 2002:a25:ea4a:0:b0:da1:b041:70ac with SMTP id
 o10-20020a25ea4a000000b00da1b04170acmr2938062ybe.10.1702323977703; Mon, 11
 Dec 2023 11:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-9-peter.griffin@linaro.org> <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
In-Reply-To: <CAL_JsqJ_NUajmQs8ZYiE2GpvNxBwtkLRE2jvWDU3hKtztt92Ug@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 19:46:06 +0000
Message-ID: <CADrjBPrkso2cM8zKq-WU8WC3P3A9YoS6nqX-f6XvSNS-EofK9g@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks for your review.

On Mon, 11 Dec 2023 at 16:43, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Dec 11, 2023 at 10:24=E2=80=AFAM Peter Griffin <peter.griffin@lin=
aro.org> wrote:
> >
> > cmu_top is the top level clock management unit which contains PLLs, mux=
es,
> > dividers and gates that feed the other clock management units.
> >
> > cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> > APM module.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Tested-by: Will McVicker <willmcvicker@google.com>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Makefile    |    1 +
> >  drivers/clk/samsung/clk-gs101.c | 2512 +++++++++++++++++++++++++++++++
> >  2 files changed, 2513 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..3056944a5a54 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) +=3D clk-exynos=
7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)       +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)       +=3D clk-s5pv210.o clk-s5pv210-=
audss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)     +=3D clk-fsd.o
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..05361fce3c6f
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,2512 @@
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
>
> You probably don't need this header. Please check.
>
> > +#include <linux/platform_device.h>

You are correct, this header isn't required. If a new series is
required I will remove it.

Whilst you're here I'd like to draw your attention to [PATCH 2/16]
where I've removed your reviewed-by tag in v7 because I added the ect
node documentation in google.yaml. The empty ect node is required to
be present by the bootloader or the device will boot loop. Can you
re-review that patch?

The alternative is to remove the empty ect node, and the binding
documentation for it and add your Reviewed-by tag back again. But then
an upstream kernel won't boot 'out the box' on a pixel 6 which seems
less than ideal default behaviour.

regards,

Peter.
