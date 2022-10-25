Return-Path: <SRS0=pv8K=22=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DA6C04A95
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 16:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B16DBC433C1; Tue, 25 Oct 2022 16:11:24 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA659C433D6;
	Tue, 25 Oct 2022 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA659C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id a67so36981561edf.12;
        Tue, 25 Oct 2022 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlXbIDv9437lExc8ejab3R1D1/KjaGnyi1kzpCh97FY=;
        b=gLjcHgW+H7vRYcAMMpizp/Ql0s90VR4SnYym1rTloiMZSZCth0n7GsoLxeVMBofFSS
         fKW5dOM0xYdyi+G1CfGzjNYq9ldtyS/J+wetGAbPYOhde5gAjMMYi/YvfoBbGJb1+hAh
         mOUQT9ilxzCCK/OLWaWFBzNKpQiPdeZTjOKrGSYZRQYxau7PMiq5bBwpbtJzZ5Ps1IrW
         mWpOrApdt4w+Nmrn4+SjhC3eoJ+LzlrXCRSY671e0BoRbSyBDcvMhPqNzqcwip7kWzYQ
         rSuVu/bZjF2NhLAamh8akKhlTWGtZuBioS7moKOJtYVyW9HAtmrKSSwRhLMj2TqD/Pde
         bZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlXbIDv9437lExc8ejab3R1D1/KjaGnyi1kzpCh97FY=;
        b=Y9KwVrLPDj8uKcseFY5oYvfgTJZPsSzf5h26rk+mZogDLpXiID/chFTbPozT+XRYbw
         OYzW8z4XqyYDDXTOqCIXhgpfGBa5hTDy3ChHsVnazByQ3Ylp7nAG3UveszUtcqvX9fv4
         CXVree9+YifBv9Es0opVRZ4ZXV8rLpNSs6NYwcSey2nTBeu1ZfCXLJxeLnUZS2/S6utd
         ogrHNe9nFUa2VPNLtBn3z6ckid/zStQdLBZ15Op6Z7d8N/23XfSyOo/5iCHs9P21keZ6
         /r9XOb9kW6aktzhgVxPOgagYyspCMSWEDKsoMqI4+X2Hus6xdyvKjjkJQoBP6un09N7C
         ASJQ==
X-Gm-Message-State: ACrzQf1ThTfIliYEbmPYrFGFJ05NOeIvtspFOrdWHIYA0yxe/NDyt2XK
	8mvpcT6w4vXQ7T/fs42t4umHP8Yvr8widgVY1tY=
X-Google-Smtp-Source: AMsMyM5IYA65H7Pr/6Jmn0rANYjXlWU97pLnIVRzuk9t3RJDMspuL/wBdeTH2rr9fzryGYGCc8oupzb6cw4vPMk3DVM=
X-Received: by 2002:a05:6402:40c2:b0:461:a29c:4ac0 with SMTP id
 z2-20020a05640240c200b00461a29c4ac0mr13289160edb.319.1666714281900; Tue, 25
 Oct 2022 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:10:55 +0100
Message-ID: <CA+V-a8s43vAhX4gf+AtgNoru_V4tq0e=cC+oB-VsSPJ_hWjj4A@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

Thank you for the review.

On Tue, Oct 25, 2022 at 1:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property so
> > that we can share the common parts of the SoC DTSI with the RZ/Five
> > (RISC-V) SoC and the RZ/G2UL (ARM64) SoC.
> >
> > This patch adds a new file r9a07g043u.dtsi to separate out RZ/G2UL
> > (ARM64) SoC specific parts. No functional changes (same DTB).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/G2UL SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +#define SOC_PERIPHERAL_IRQ(nr, na)     GIC_SPI nr na
>
> s/na/flags/
>
> Originally, when I assumed incorrectly that dtc does not support
> arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
> ("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
> although the second parameter now has a completely different meaning ;-)
>
> However, as the NCEPLIC does support interrupt flags, unlike the SiFive
> PLIC, there is no need to have the flags parameter in the macro.
>
Ok, I'll drop the second parameter.

Cheers,
Prabhakar
