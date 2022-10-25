Return-Path: <SRS0=G1Et=22=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4640BC38A2D
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 12:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FE8AC433B5; Tue, 25 Oct 2022 12:42:41 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33A18C433D7;
	Tue, 25 Oct 2022 12:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33A18C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id x13so6954625qvn.6;
        Tue, 25 Oct 2022 05:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaYh77K+gCSv1Fw/DuS4kr5mhCxIMTP6JrJoQ/+vP5Q=;
        b=z/FCSIpfDUhrXhIBqR7jI0tyA3LskjNIrFmbHPgC0FiJWTRLverDFGx9ueqWIMRoUM
         eagrQLgfPbsOPwGplEM6yJ4y9miUuFTOmFhJzknRRhIOqR79BmRjSKIlq84HcRgQ7va6
         gsKnEPi3V9f/wNYaQv9KSWtno3RMq6kf9qIjuQ51ZLA0y+t0ye8ymnoAVYszbYbJS0Iw
         THVvHtXw1pIiPRFcK1dnSNAgez3L5IsiPGoStWQXn0TsBwsIvNYygv9YJflqpc/eZOXM
         0+urlpIVDZwT8m28tZiIwOomptymi39PP/vcajxBnmOTOV7wwIAsriCKJ7/3ycSrGvBm
         m/Ng==
X-Gm-Message-State: ACrzQf2FgSAnL8MFqzhcf01JvZC2rA3iN+FEVs5SuIspn+uwpCZmHM/M
	CGaWxy0JzLeim/2WMRtfsuKj1QmNDSoKtA==
X-Google-Smtp-Source: AMsMyM5tFRQzMsaxxPuPgcH/7VLPfBaTwEiBdXpJyBJ+7L6lEAH5obleHyUi8Tn8aSzrLkvQiT8a8A==
X-Received: by 2002:a05:6214:20c2:b0:4b1:316c:67a2 with SMTP id 2-20020a05621420c200b004b1316c67a2mr31638024qve.32.1666701758773;
        Tue, 25 Oct 2022 05:42:38 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bq44-20020a05620a46ac00b006ee77f1ecc3sm2004952qkb.31.2022.10.25.05.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:42:37 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id o70so14391077yba.7;
        Tue, 25 Oct 2022 05:42:36 -0700 (PDT)
X-Received: by 2002:a5b:52:0:b0:6cb:7584:1b20 with SMTP id e18-20020a5b0052000000b006cb75841b20mr1953298ybp.380.1666701756292;
 Tue, 25 Oct 2022 05:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:42:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
Message-ID: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
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

(now replying to the latest version)

On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> so that this can be shared with the RZ/Five SoC.
>
> Implementation is based on the discussion [0] where I have used option#2.
>
> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> (r9a07g043F.dtsi)

Thanks for your series!

> Sending this as an RFC to get some feedback.
>
> r9a07g043f.dtsi will look something like below:
>
> #include <dt-bindings/interrupt-controller/irq.h>
>
> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na

Originally, when I assumed incorrectly that dtc does not support
arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
although the second parameter now has a completely different meaning ;-)

However, as the NCEPLIC does support interrupt flags, unlike the SiFive
PLIC, there is no need to have the flags parameter in the macro.

Moreover,  it looks like the SOC_PERIPHERAL_IRQ_NUMBER()
intermediate is not needed, so you can just write:

    #define SOC_PERIPHERAL_IRQ(nr)  (nr + 32)

> #include <arm64/renesas/r9a07g043.dtsi>
>
> / {
>    ...
>    ...
> };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
