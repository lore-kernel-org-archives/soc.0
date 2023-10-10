Return-Path: <SRS0=zUad=FY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896ACCD80B7
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 12:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56080C433C9; Tue, 10 Oct 2023 12:09:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8150AC433D9
	for <soc@kernel.org>; Tue, 10 Oct 2023 12:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8150AC433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-66cfc96f475so1364136d6.3
        for <soc@kernel.org>; Tue, 10 Oct 2023 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939782; x=1697544582; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DgSEBJcUi7PZ5OXedvwInXaFNURNqtsaL0h7wFFXk5g=;
        b=McWeyHjgs6Egr0TkN1+7Y5Xd1i9dBKF07gO7s7vcEu2TT3042bNqUvFlQzq91idYeN
         op7vaMZ38dD0HihiwOyew3q0EjKkldzGdYa0n9n1VivYIAh0yWOxVdDC+r5IPmbWIJI4
         dpzpP/tDsTA7qQ1RFATOCLIgLdBGDVoOXickfynwSJLDLvB/TWYFgnQaNuOLWhMUl2PA
         0FOVAG4g8N+j5VNsJPW2MAw0wUfcQBHvAbl7jXfjy8WDOtBujZcs4se9krDCYGNe/FTD
         USmuAQJdCUiXluqLccUSrzO/b0CHgowrFWvCdW9DsLUqhzRfjaLpH2nvvG41k8G+R6PE
         rL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939782; x=1697544582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgSEBJcUi7PZ5OXedvwInXaFNURNqtsaL0h7wFFXk5g=;
        b=mNvJ4PlfxssMxAaDKR84lXs0y8cfDblp+/w95maKBN7TFi1ybm9thQi7TJMmkt5/1M
         IxbJJVR0qDXQZX2tOR3/8m4g41ejyxS5V13fQNi8vU0dGDjHoLxvIA8XgRHmEe7qgZlQ
         gHX0a1RP98EHQTrx4pnMMVzfRN6M/aVedgU6YNrqW1xK0WJtC32oS3FjodpRwE4v5aYx
         UOAq5l6pcu7r8vraNxSZR95eT6LmHvYfydk9mAQCmq+c3He1nNU2nImubjrBFagIDQqW
         wHaArcm61OYXEXkZoQjVCFFQClecusReo5d0Z3VBwoa01B2eLDrrSi4UeeVdF/xmcCFB
         cvzQ==
X-Gm-Message-State: AOJu0YxpH/WqtRl69nNWVLWfwJG6JirI6QXJynu1e1hZU7ik1BFXgdIV
	4zJa6xOy2ZIkhR7je0Ucmu3gE3qInN4yXNcPg27reA==
X-Google-Smtp-Source: AGHT+IEkobWfRAv+hk9GeXAgYbAsdwwHInRJB4q4A/k6gLUZyJCTapOQUejfM/de0SvYVTlXeCdNVMlVoHapdH1mpY8=
X-Received: by 2002:ad4:5cc7:0:b0:65d:dcc:9754 with SMTP id
 iu7-20020ad45cc7000000b0065d0dcc9754mr22900149qvb.30.1696939782310; Tue, 10
 Oct 2023 05:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-20-peter.griffin@linaro.org> <20231006205204.GA269353-robh@kernel.org>
In-Reply-To: <20231006205204.GA269353-robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 10 Oct 2023 13:09:31 +0100
Message-ID: <CADrjBPpEFo4gRTsWau+xGoBAr2j7srhbxYefJGDer+PRu9QxBg@mail.gmail.com>
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your review!

On Fri, 6 Oct 2023 at 21:52, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 05, 2023 at 04:56:16PM +0100, Peter Griffin wrote:
> > The LK bootloader on Pixel6 searches for a dt overlay in the
> > dtbo partition with a board_id and board_rev that matches
> > what is baked into the device. If this overlay is not present
> > then the phone will bootloop in fastboot and you can't boot
> > the upstream kernel.
> >
> > This commit adds a dtbo for the production oriole variant.
> > The other pre-production board overlays are not included
> > at this time.
> >
> > Adding the dtbo here allows for a better experience when
> > building/booting the upstream kernel on Pixel devices
> > as all the DT required to boot the device will be created
> > as part of the kernel build process. Rather than having to
> > fetch the dtbo from some other repo.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/google/Makefile          |  1 +
> >  arch/arm64/boot/dts/google/gs101-oriole.dtso | 21 ++++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dtso
> >
> > diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> > index 6d2026a767d4..3f1761f8daa9 100644
> > --- a/arch/arm64/boot/dts/google/Makefile
> > +++ b/arch/arm64/boot/dts/google/Makefile
> > @@ -2,5 +2,6 @@
> >
> >  dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
> >       gs101-oriole.dtb \
> > +     gs101-oriole.dtbo
>
> Overlays in the kernel must be able to be applied to a base DT in the
> kernel. Add a rule to apply this (hint: a '-dtbs' variable does this
> similar to -objs variables).

Ok will do, thanks for the hint

>
> > diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > new file mode 100644
> > index 000000000000..50832fd94204
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole DVT Device Tree
>
> Doesn't DVT mean pre-production?

Yes, DVT stands for Design Verification Testing. I can remove that
DVT suffix for v2.
I suppose that means there were no changes between DVT and production as this
is the overlay used by the production devices.

regards,

Peter
