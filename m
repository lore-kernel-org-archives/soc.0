Return-Path: <SRS0=pv8K=22=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC41C38A2D
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 16:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D332C433D7; Tue, 25 Oct 2022 16:15:31 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51E26C433D6;
	Tue, 25 Oct 2022 16:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51E26C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id ud5so10310745ejc.4;
        Tue, 25 Oct 2022 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6UbVAonXzXEF4tPDCKPCg7WA+lFJIW3l1l+LGaIaaE=;
        b=RjpvOL7MSyyleyOkn8duD/qRqvUDoc6ReK96YgdY5m0G5KbDzB58n9ZiozO5uLkYzl
         WGKrhs3fXBqlLFh2WalirQ+LuFXGXrw0T65oKEfXNv6vKU6fdrvf5mkPLCnqYg4GG9AD
         zl3lgzL9PGDRBLuN1Dz3NdxNQIuTw1Zdb4eAtSKWLAcAUqVenhNFXJkDG3Td3vkrZqkI
         +ZUIotgvcfu2D+YHA7WPGU+B7km+CGQsyfDuY5jkALCn7i7b67de2tO4HitSy7IBPvIX
         YpEu8r8wj5RIoAkggInn9ZfemMGg677A4W2Dypf5py66SRM96J7/lypK2wDBhB9YQCyl
         lMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6UbVAonXzXEF4tPDCKPCg7WA+lFJIW3l1l+LGaIaaE=;
        b=NF2bwjz8XVbOuA8dLNeed1J3Jv3MjUMGQyuFBma/j3CZL1AEbv0emYwwoaIP62na9Q
         wUEK6RtQDWh4m+TaFkmHdG84lL5sQ06GsktnchO9z6+Yys/Qv92q4sbEe7t1tEj767LX
         3GX2FTwvcF1m664nan9QaUHtDOs0he6hIOVtyD7eIGHcAEigOxOT5Sp3HkvgWbXB8MmN
         DsU2iRpg7L9+sZLSn5f1PwBKNpwWPhT6ZWWQ/bTZYYupFdxvmEOFKPNKCa3quv/e5L5X
         L3q0rGqh/0QceGrsDp0cN4iHnswdY1akJyp5E9FnPy9i1km6ZulOrTovgGNAXBJrk2QQ
         IMSQ==
X-Gm-Message-State: ACrzQf2qMeWAy48vVubg5AHBwJs66AfUHcyF2CQ8u37hziVpjGcIND6c
	BoE8R2cVpzkKnGWZ6O1U8YSItvmIT2GhxwQ12Ac=
X-Google-Smtp-Source: AMsMyM6vy+HKe105A0nfDnGKP7UgYHtFcSSQKGQ0dQB7bPXBOvkwm8XyyCyR6qhyWVIACh56BdQUdBIdPqCHtiZCRtc=
X-Received: by 2002:a17:906:5a4b:b0:78d:4e5a:d101 with SMTP id
 my11-20020a1709065a4b00b0078d4e5ad101mr32495249ejc.196.1666714528655; Tue, 25
 Oct 2022 09:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXcHWaUS3rq=3bQOeax1Vig4R1MpG8dDHbe5TDjkVYx0Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:15:02 +0100
Message-ID: <CA+V-a8vGW9Vngo+Rs2=v=c6Q-iCxqh9DR=TT2i1K1-cRTza25A@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
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

Hi Geert.

Thank you for the review.

On Tue, Oct 25, 2022 at 1:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> (now replying to the latest version)
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> > so that this can be shared with the RZ/Five SoC.
> >
> > Implementation is based on the discussion [0] where I have used option#2.
> >
> > The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> > identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> > created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> > (r9a07g043F.dtsi)
>
> Thanks for your series!
>
> > Sending this as an RFC to get some feedback.
> >
> > r9a07g043f.dtsi will look something like below:
> >
> > #include <dt-bindings/interrupt-controller/irq.h>
> >
> > #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> > #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na
>
> Originally, when I assumed incorrectly that dtc does not support
> arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
> ("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
> although the second parameter now has a completely different meaning ;-)
>
> However, as the NCEPLIC does support interrupt flags, unlike the SiFive
> PLIC, there is no need to have the flags parameter in the macro.
>
> Moreover,  it looks like the SOC_PERIPHERAL_IRQ_NUMBER()
> intermediate is not needed, so you can just write:
>
>     #define SOC_PERIPHERAL_IRQ(nr)  (nr + 32)
>
Agreed, I'll change it as per your suggestion and send a v2.

Cheers,
Prabhakar
