Return-Path: <SRS0=PinD=25=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C15ECAAA1
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 11:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E6A7C433D6; Fri, 28 Oct 2022 11:43:15 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22903C433D7;
	Fri, 28 Oct 2022 11:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22903C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id g10so5835972oif.10;
        Fri, 28 Oct 2022 04:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yam5XYWQb6y7gKmWe0fD9G/82ZNnLxLp0NPkpKXtkPQ=;
        b=OLoe6iGUnZ//OuPIkRUBSnlTyHTtx4FNoYTZK3ePPmhxpORFXzaaeinpemejaQ8dIH
         AmyehNfysSt5QWSK03+waQ9ejGlWCh07IZmCHcxICcPZRarZZHssY36MhOAdtAr1qvTQ
         LqayWzxI8lTNYomn45/S/gTJZdzN/cuWs7f+ShES1O9+8LgRPz2W60sJP3iS0VPuRF16
         jr0O3yTUvaNOgulT268ehj8mG3OjJSEoyoGQ1yY0xlbL/pHYev9tFCF9AkCTt4STnte4
         3zFG/fZXRsamQr0j6PqUhMuZhBRdVkC4iNbSI3VK0bDMg1JLUVBGoEUirwwckfciyD5r
         4yFg==
X-Gm-Message-State: ACrzQf1p5FMTQMVIsvax1shyQdws2jk0Teywd1aRNiHuAU4uPDCZAJlO
	h8h82qDgPZRWKU+w0+gxZdogIqutg+rcBQ==
X-Google-Smtp-Source: AMsMyM44bWMIYrvWlTo4uBHf5uk3yYphah4ycuMh0ZB5ZQwZ70zrQefX4FD/ggJwjI0I4PYSql1z1w==
X-Received: by 2002:a05:6808:f14:b0:355:5204:dd6b with SMTP id m20-20020a0568080f1400b003555204dd6bmr7760366oiw.93.1666957392973;
        Fri, 28 Oct 2022 04:43:12 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id x35-20020a05683040a300b006391adb6034sm1532200ott.72.2022.10.28.04.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:43:12 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id v40-20020a056830092800b00661e37421c2so2835033ott.3;
        Fri, 28 Oct 2022 04:43:12 -0700 (PDT)
X-Received: by 2002:a25:d64e:0:b0:6cb:7faa:af94 with SMTP id
 n75-20020a25d64e000000b006cb7faaaf94mr16836632ybg.36.1666956913602; Fri, 28
 Oct 2022 04:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 13:35:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
Message-ID: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL
 SoC specific parts
To: Prabhakar <prabhakar.csengg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> can be shared with RZ/Five (RISC-V SoC).
>
> Below are the changes due to which SoC specific parts are moved to
> r9a07g043u.dtsi:
> - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
>   for SYSC block on RZ/Five
> - RZ/G2UL has armv8-timer whereas the RZ/Five has riscv-timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

> ---
> RFC->v2
> * Updated commit message about timer

Right. And I'll add while applying:

  - RZ/G2UL has PSCI whereas RZ/Five have OpenSBI


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
