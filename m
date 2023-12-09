Return-Path: <SRS0=QSjn=HU=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C86CC4167B
	for <soc@archiver.kernel.org>; Sat,  9 Dec 2023 22:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BDE9C433C9; Sat,  9 Dec 2023 22:04:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A325C433CA
	for <soc@kernel.org>; Sat,  9 Dec 2023 22:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A325C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-67ac0ef6bb8so20128176d6.1
        for <soc@kernel.org>; Sat, 09 Dec 2023 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702159453; x=1702764253; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDeZCYtXqn2cs2JrwzvomIoxvwFGKvb0D6cCKP3KGx0=;
        b=rX9Yl1tgZCRQtoq2JIn4sSfG/xXwzy4KMs/CN1keiVxSKYco7ashcGCxh02zL0tesu
         HrchW7vfsX5hstfKWzQhrpbL8VwLNLnv0o7CBJTTNzCrXeCby0GcxXBIEE/SywDYZ5J7
         Su9f5/jbHk79UgERj3PVVSQyHuXHuh+PkPbfovmVfmrb6ba4isNZaqQqGn1lmmkX3yTK
         cgGD3khYQyp2Z4/Me/YUT8X5+a6R1t1tiQjG8UyhRbgvYUdEvLeylwd2K1tkx9CdRcaj
         ZFGOrjSsYHHaS9ZsMvQ8rxCDaM2n5R/AlnUiVz9ZF9T+T8ax8YGE05SiOROhluhfTzq0
         54Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702159453; x=1702764253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDeZCYtXqn2cs2JrwzvomIoxvwFGKvb0D6cCKP3KGx0=;
        b=WeK2cLHpqL3HuB5STXt53KlaVCIhVFNyX+Tf6xkwWGgSsuJd3QcfuwjzphJegVtZFs
         90PZkE8ugH94vPYL2BP2oa1Z1y0ToPQhYP99KZV/YF15Od7jFXStuORFZL/sKjucdEGC
         qPPHwBSdyqQI1coYA4RMDoD3HnuoJLsJs5YZQ3T54WfgMGpkaZEUZlHEMOtAOp2xekfL
         svEV6G7P5zgLRSNbMYtFJn7EswN1hvgNyyuZLoAaTH8JhNaTO/1aa2mh2Sy4n+K7C3WS
         oZgBK3Mil2nzD2ya0lQQ3Kv1uwDus+bcf26uATs6gyHFubYtgs8Uja4rGA/3kMdepY16
         Vc7g==
X-Gm-Message-State: AOJu0YxQMaRKZ3oPtLbKPojDadJ4QE7mE+5qexgnTqce8qemFnb0lf/W
	vNpqtbFFkgBko3bzimRE5nu4CkdxcUjcygzn6DL6Iw==
X-Google-Smtp-Source: AGHT+IGShvGwLPhyao8X9Dj8VhmyqZQEkFRbj4Ak+KHDxcWKcLLYf+Q6tnP2alm19gFUubHvpWgjIuI0akR6N4sAeiY=
X-Received: by 2002:a0c:c782:0:b0:67a:21aa:6505 with SMTP id
 k2-20020a0cc782000000b0067a21aa6505mr2131602qvj.45.1702159452795; Sat, 09 Dec
 2023 14:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-20-peter.griffin@linaro.org> <CAPLW+4mOmQM+Hy-kUKn9onU25-ycgj4CWfAK+-vZVH+yw=FhtQ@mail.gmail.com>
In-Reply-To: <CAPLW+4mOmQM+Hy-kUKn9onU25-ycgj4CWfAK+-vZVH+yw=FhtQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 9 Dec 2023 22:04:01 +0000
Message-ID: <CADrjBPqWimgbPUZoW1cTs0grL2Kv3rpNMhz=z-c+MUx6h6mTAQ@mail.gmail.com>
Subject: Re: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
To: Sam Protsenko <semen.protsenko@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, 2 Dec 2023 at 02:28, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add initial board support for the Pixel 6 phone code named Oriole. This
> > has been tested with a minimal busybox initramfs and boots to a shell.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           |   2 +
> >  arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
> >  .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
> >  3 files changed, 111 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
> >  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> >
> > diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/=
exynos/Makefile
> > index 6e4ba69268e5..44c24a8ad9e1 100644
> > --- a/arch/arm64/boot/dts/exynos/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/Makefile
> > @@ -1,4 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +subdir-y +=3D google
> > +
> >  dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> >         exynos5433-tm2.dtb              \
> >         exynos5433-tm2e.dtb             \
> > diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/bo=
ot/dts/exynos/google/Makefile
> > new file mode 100644
> > index 000000000000..0a6d5e1fe4ee
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> > +       gs101-oriole.dtb \
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/=
arm64/boot/dts/exynos/google/gs101-oriole.dts
> > new file mode 100644
> > index 000000000000..6abd00fa337e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole Device Tree
> > + *
> > + * Copyright 2021-2023 Google,LLC
>
> Space after comma. Maybe also make this line consistent for all added
> files. Checking existing files, it's usually spelled "Copyright (C)
> <years>, Google LLC."

I've made it match the other files I've added in v6 (by removing the
,). There seems to be a lot of variation upstream as to whether a . is
used at the end or not so I've left that as it was.
>
> Btw, I forgot to mention in my review for PATCH #18: please double
> check the commit message, there are some issues with punctuation
> there.

Ok, I will check it.

>
> > + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include "gs101-pinctrl.h"
> > +#include "gs101.dtsi"
> > +
> > +/ {
> > +       model =3D "Oriole";
> > +       compatible =3D "google,gs101-oriole", "google,gs101";
> > +
> > +       aliases {
> > +               serial0 =3D &serial_0;
> > +       };
> > +
> > +       chosen {
> > +               /* Bootloader expects bootargs specified otherwise it c=
rashes */
>
> Just wanted to say: I think you are doing a great job with this
> platform, and I can only imagine how hard it can be when you can't
> actually tinker with the bootloader source code. But I do appreciate
> that you was able to minimize stuff like earlycon, ect, etc :) And
> this one actually LGTM.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks, much appreciated!

regards,

Peter.
