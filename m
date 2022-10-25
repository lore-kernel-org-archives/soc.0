Return-Path: <SRS0=G1Et=22=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F77CC38A2D
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 687FBC433D7; Tue, 25 Oct 2022 12:28:50 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A84FC433D6;
	Tue, 25 Oct 2022 12:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A84FC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id cr19so7387931qtb.0;
        Tue, 25 Oct 2022 05:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zk1x69BorUq5EOLXWvjLkthJmpSNSl2Oga4mvV/7nWM=;
        b=DEDWq7C/I3VMlysCzoaGQ/kjDVZjPokQEw4NsHSDluxCOQbSAtEWHNRP7Skfvepjsz
         2uzpNdvRyTXRrF/BX1glmSuLhZ283c0kJ5fot73cae8W+G1pmJaRTyZMd4ixkzEsQ+Qf
         oVwvlQwBP0+9oxn3E14pJf6a1/EdMQFnvZz9tnur7SujOdmsUMsekNHk3UNOs0Owgyq4
         3ft5cF5qpAt1B1Mc2O41wgapAsjKefAm6qOWCIBqiLOFdZ574Y3izZhR47JDRC6N92A1
         LvLCKyMrclN38r/Itcd8RTc5F1vqk2iLXQJKicEQ48kjCd3jyDnU34NPD+MNQNkoU1zx
         bOdw==
X-Gm-Message-State: ACrzQf19anMnEEWDLKqw0+YpOyIo/ZprMMMuOkseeUSHweDQfiL51LXn
	uJBwfNukjkdDJjgwaRAYmgkmTWxe2XbYgw==
X-Google-Smtp-Source: AMsMyM5JC4UG9wuchR3gWffqYkiYqSJJZ9SypDOQE3Djf69QXjzE7jqBc+4zMThmkhbBvzWnnz9RnA==
X-Received: by 2002:ac8:7e82:0:b0:39c:f746:9250 with SMTP id w2-20020ac87e82000000b0039cf7469250mr31745279qtj.620.1666700926762;
        Tue, 25 Oct 2022 05:28:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id az44-20020a05620a172c00b006eea461177csm1955842qkb.29.2022.10.25.05.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:28:46 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-36d2188004bso50765787b3.4;
        Tue, 25 Oct 2022 05:28:45 -0700 (PDT)
X-Received: by 2002:a81:12c8:0:b0:36a:bd6b:92fb with SMTP id
 191-20020a8112c8000000b0036abd6b92fbmr16103916yws.316.1666700925399; Tue, 25
 Oct 2022 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:28:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
Message-ID: <CAMuHMdXiim0bDBxaGWi2GjAmKS1gKj8D8TUBPXnZtm0EphKsmQ@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
To: Prabhakar <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property so
> that we can share the common parts of the SoC DTSI with the RZ/Five
> (RISC-V) SoC and the RZ/G2UL (ARM64) SoC.
>
> This patch adds a new file r9a07g043u.dtsi to separate out RZ/G2UL
> (ARM64) SoC specific parts. No functional changes (same DTB).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2UL SoC
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#define SOC_PERIPHERAL_IRQ(nr, na)     GIC_SPI nr na

s/na/flags/

Originally, when I assumed incorrectly that dtc does not support
arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
although the second parameter now has a completely different meaning ;-)

However, as the NCEPLIC does support interrupt flags, unlike the SiFive
PLIC, there is no need to have the flags parameter in the macro.

> +
> +#include "r9a07g043.dtsi"

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
