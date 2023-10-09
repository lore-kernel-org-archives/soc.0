Return-Path: <SRS0=2/Qf=FX=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D66CD612F
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 20:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37A36C433CC; Mon,  9 Oct 2023 20:04:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29046C433C9
	for <soc@kernel.org>; Mon,  9 Oct 2023 20:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29046C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c9ad9473d7so41005ad.1
        for <soc@kernel.org>; Mon, 09 Oct 2023 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696881843; x=1697486643; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=792ACGhD6QjX3gm4sl6mN1ZnGztud0zoUVjrdn9K8C0=;
        b=JqvPg2P7YJdQAILCXv9MfAmsD8Wm6V83H/EA4ZAblFbzlMqUQdPpAune7IDntHVhGJ
         r6S9tq9SZAn2+mo/vKYFg15gxB4DAAJtUXT7lz8dlQd+l0+vucmhw+XXVwM/ftuu2/9I
         KhcNxMlN56DS+LWvxknPn/H7fPkQ2gb5ag00OqAj0tHfW0crbwFFewUmjkyTUbXXY+tJ
         WBBwnqo7tnKqnECC/bsOIT5CyvOVZ2tysLDo7xAzBBssxltZtorDcOd+f4HZNot3BlUP
         7JQrAA5bvwQxV7qgUDVkYEgunxy/1JVZCn8xDzmMTkrJvoOn/3TUkJO8ACmTVrKgWwMC
         lE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696881843; x=1697486643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=792ACGhD6QjX3gm4sl6mN1ZnGztud0zoUVjrdn9K8C0=;
        b=Uref30sneyQfQ6A/P0EGPGnY7sTElRQhBr5/ioXZ9j2DngDYcQWGtHYOiPOf+zO6ZU
         WLilH6+6yIRDedzkxVOUYS8TiiBwYNJw2+/WOOmBxACaw3+bw8uReI1ZPa1gpQg9yK+Q
         6MIc7OinKFX77+CsHR6bvjJQmIySqBTJqSLBYaXQRihXoIveGoCfc080BAETQ6X8vbAG
         zra8qlGHii+hz+2Lvms7mUTRcL9nDj/w7f8hUATmwrTs2Pobk1ODghq+c09e0zWmY8bq
         Eq/VIOuUBnWZZq6ojoUFYtkWFFsQmjktrase3A8SNHFRgDqrHNMmDpsBwv6x16RXAGkB
         s9HA==
X-Gm-Message-State: AOJu0YyhFj8PjNnh3fS+ic0ZgqND0xVBb9KtkJyHLAtpbrFsiBxf78c7
	Bcqe9nc6yD3+sLsD0fn8SPtwqQ==
X-Google-Smtp-Source: AGHT+IGoDE0HuNMIvb5i2H0sYSVhJ0lPtrnwVtRl9vcbmzHn2Ebn09gMy1XHI6WbiXHnD9jwHuRR6Q==
X-Received: by 2002:a17:902:ec8b:b0:1c6:c41:679c with SMTP id x11-20020a170902ec8b00b001c60c41679cmr803671plg.4.1696881843213;
        Mon, 09 Oct 2023 13:04:03 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id k3-20020a63ab43000000b0050f85ef50d1sm8838631pgp.26.2023.10.09.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:04:02 -0700 (PDT)
Date: Mon, 9 Oct 2023 13:03:59 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
	s.nawrocki@samsung.com, linus.walleij@linaro.org,
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, olof@lixom.net,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH 19/21] google/gs101: Add dt overlay for oriole board
Message-ID: <ZSRcr6JRbj-wZf7R@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-20-peter.griffin@linaro.org>
 <7f2032c2-812a-46b5-8914-056cd53c37cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f2032c2-812a-46b5-8914-056cd53c37cb@linaro.org>

On 10/05/2023, Krzysztof Kozlowski wrote:
> On 05/10/2023 17:56, Peter Griffin wrote:
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
> >  	gs101-oriole.dtb \
> > +	gs101-oriole.dtbo
> >  
> >  
> > diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dtso b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > new file mode 100644
> > index 000000000000..50832fd94204
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/google/gs101-oriole.dtso
> > @@ -0,0 +1,21 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole DVT Device Tree
> > + *
> > + * Copyright 2021-2023 Google,LLC
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	board_id = <0x20304>;
> > +	board_rev = <0x10000>;
> 
> Undocumented properties. Please propose bindings... Also, underscores
> are not allowed, so in this form it is a no-go... although I understand
> the pain of not being able to change the bootloader.
> 
> For reference:
> https://lore.kernel.org/all/20220605150747.GA3465286-robh@kernel.org/
> https://lore.kernel.org/all/20220610163343.GA1787330-robh@kernel.org/

These names are actually arbitrary and don't depend on the bootloader. They are
passed into the mkdtimg tool [1] using --id and --rev and used to create the
dt_table_entries. The bootloader traverses the table and picks the overlay
based on these properties. So we can use whatever property names we want
without changing the bootloader.

[1] https://android.googlesource.com/platform/system/libufdt/+/refs/heads/main/utils/

Thanks,
Will

> 
> 
> Best regards,
> Krzysztof
> 
