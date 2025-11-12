Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1AB31BCAB
	for <soc@lists.linux.dev>; Wed, 12 Nov 2025 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950395; cv=none; b=iIneq7w+wq6lhYtu9PA7kJ6/AL7tVuTGDqX5mGylENZ2oBhGwj5XyQWYIuCATO0WCetnBOxI10wwfp/7em7rDRbrQaD/VCkCYvZN4N8OlGlPaQR9g2B+Y/08L5KX2RbbREcwh2YtYRakN/mWOpBW7AsBa+tBLDbbvKDk22/wjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950395; c=relaxed/simple;
	bh=dDKYGlIJ32m211Bih55y93s3DErpXU3iR5VwKKs6LPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpyXAqDVcfYWQKcvdMEUQY7+yU9Tf3hpBH//y2P4O80YVvKCrzIoMoMQE8ZCYF4l7qjsqBZRCBS81LdnCKLMKLUmTh4UdNmaNpN0ONxMEVEcsq/5+C/KU25WJe8p184sre79Ud7ovIekjBUdOMY5ZgHKRnLQsbGftXmINfbU/kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4Qm4fJT; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4Qm4fJT"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3d18422565eso463768fac.1
        for <soc@lists.linux.dev>; Wed, 12 Nov 2025 04:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762950392; x=1763555192; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=W4Qm4fJTlvJeZLD0yWJjsvCvQojQ22KBcmLgFn1vTY14KRQVwK8uPyPxjEkJ5Ohdmo
         o9JSJ7uq5dKlyKeEke9DyH7vGbgyrBMqxo3B4sI6V0bXbya/fO6Fsk0NrV9OJrObm/o4
         b9TtODtda9rbCWIHBx06/BMAfbfuiSpuEKWnlo64MQolhKZQQ+PwnZLbTiwB7TlqW77/
         BPILzVrm3EqygteRu2g8AhLq0ib9T+HqUukQc6i0haqfigrmQ7/bWhJYO4sVTmBCjQAl
         xl1lEYHwS7/1SQPMm8CmdYd7a39t+Y26GXqUfJnnjxCJUpjmoBs/EgnHz3w1D0lvMZI7
         DUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950392; x=1763555192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFrt/LADXbjn6c8+TuF1xEj034sEsGmUDeod+7NYBo=;
        b=KWSG5mE8q+vBdZEdacY6oFdwIEDfJwYzBsdGLEgFwB9T62xPjcFUzlR8UIpyTVwqYU
         tTi0HXicK9cGColKDncHioxUqMgq9KBkHtHTyr5qgDv01t90XKYUUUEdi72s1DHHaHlQ
         nN+i+FV4aNhuA8PPHwCh1yxmge2Ws/0QT0Iwn6Vi+8Vr2RceBYuRQzRv0FDf+oPHzYBb
         Qmr6E5HZVb6vALHsS4PRWbO/HVNrdGYWpz3o3LYl5WND9nMYtEJ9Jw8aQB6gNYQKJ1AB
         ZzCzbMk3fZ+gk+lJwxP/CaprDJz88dsnOfRa14wzY2t3IXZYTlcXDZZsspuNLCxDbBG/
         9Ryg==
X-Forwarded-Encrypted: i=1; AJvYcCWIUsnSU+WpU+uzD6YtXb9vRkj/qK8oeOG5BLAxGrwO3zu8jX+QFwMnupSNIadWQIL2AT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YztA06rSpDmtZ8gIaFp/ATRJ+WjdodzxFLuYTCnQgbKb7vesTxR
	MNL36+EMNtMk2pCaafmHgi7Y8CSA79r8dyb8SXdJNij6vp8usUyMTgY2k4GUYvkfVX9jMX2ouml
	E8GDniye7Y0/zBx1MzyPD4oNyygc2PS/KKI5LLCt9AQ==
X-Gm-Gg: ASbGnctOl+gJu7VYqq7KaXtFUKOGrptJ+MznmD5qUV0t0kAfajRwWCIIbVBV5e1SHbc
	zvLqXyIEidcTp4n/+U7bR9RoKiakKIF84KbP77Wu0iqrUqBzVcj6xlpY+qVw+F8fdRr04Unbf+z
	pd196CXzKY0rXLdlK42mJSfnZMxwDLB1S7hS+9NV1SuuKDBmsUz3BmUafad+NnDtHbA/Cqeah+J
	PjMfLyKgzq0CeiB0BDsybkFftHPK9DjgYAe+tkw3DkJ2i0IK2PdS/vcPcXITg==
X-Google-Smtp-Source: AGHT+IE1tLumK4n7DEwiq4S5JSBYPEzwm+BAj2LMCZxL3vQMOt1J1sE0UaE8YVtiqdzAwD2oN7VxHWusv1seYdRsy+g=
X-Received: by 2002:a05:6871:2e8e:b0:3d4:3658:ede0 with SMTP id
 586e51a60fabf-3e83419b8bfmr1247405fac.40.1762950392152; Wed, 12 Nov 2025
 04:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251111192422.4180216-1-dianders@chromium.org>
 <20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a1f1395814@changeid> <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
In-Reply-To: <b55d94f2-6b79-407f-af58-b9847db3c9a2@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Nov 2025 12:26:21 +0000
X-Gm-Features: AWmQ_blqp2Ui-ZoVaTdeg2kHQP2n-uxUtRhftLhBrfgQJGuwpcrlRSIvpnI39mE
Message-ID: <CADrjBPpCKfd_0PY=DULnmqfb8veqH-SQ-kr5gC6Y28uBVo8iRA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: google: Add dts directory for
 Google-designed silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Roy Luo <royluo@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, William McVicker <willmcvicker@google.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Drew Fustini <fustini@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof & Doug,

On Wed, 12 Nov 2025 at 08:10, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/11/2025 20:22, Douglas Anderson wrote:
> > The first four Google Tensor SoCs were offshoots of Samsung Exynos
> > SoCs and their device trees were organized under the "exynos/google"
> > directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
> > Google Tensor SoCs are now of Google's own design. Add a location in
> > the tree to store these device tree files.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  MAINTAINERS                         | 1 +
> >  arch/arm64/Kconfig.platforms        | 6 ++++++
> >  arch/arm64/boot/dts/Makefile        | 1 +
> >  arch/arm64/boot/dts/google/Makefile | 1 +
> >  4 files changed, 9 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/google/Makefile
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ddecf1ef3bed..f73a247ec61c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10606,6 +10606,7 @@ C:    irc://irc.oftc.net/pixel6-kernel-dev
> >  F:   Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >  F:   Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> >  F:   arch/arm64/boot/dts/exynos/google/
> > +F:   arch/arm64/boot/dts/google/
> >  F:   drivers/clk/samsung/clk-gs101.c
> >  F:   drivers/phy/samsung/phy-gs101-ufs.c
> >  F:   include/dt-bindings/clock/google,gs101.h
>
>
> I am fine with this but also please consider having separate maintainers
> entry, because, as you said, this is a completely different SoC.
>
> In any case, up to you folks.

Doug did reach out to me prior to posting. We are OK having it here
(happy to help with Laguna). Most of the exynos specific SoC drivers
are under ARM/SAMSUNG entry anyway. There will be some Laguna SoC
drivers for pinctrl, clocks etc, but many of the IPs are designware so
likely to have existing entries (uart, i2c, spi, i3c, usb etc).

>
> > diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> > index 13173795c43d..044af9a3b45f 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -138,6 +138,12 @@ config ARCH_EXYNOS
> >       help
> >         This enables support for ARMv8 based Samsung Exynos SoC family.
> >
> > +config ARCH_GOOGLE
> > +     bool "Google-Designed SoC family"
> > +     help
> > +       This enables support for Google Tensor chips starting at the
> > +       Google Tensor G5.

It might be worth adding (Laguna) here

With that addressed:
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
