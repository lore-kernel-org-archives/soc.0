Return-Path: <SRS0=PinD=25=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04212C38A02
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 11:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C18FEC433B5; Fri, 28 Oct 2022 11:31:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A3E4C433C1;
	Fri, 28 Oct 2022 11:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A3E4C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id o28so532163qkl.4;
        Fri, 28 Oct 2022 04:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n41bBGLdctrsHUVRRarV2Di1E8TbeCdMm8nLJHc7p30=;
        b=6OUneVSCG6hl86wWoQ5E1yzXn2YIj1XILq7JfVEjIvjFEW8lV39rdlluVGppgE9JjU
         jDgNIJNQ37o5n+x+EeHvUlgATki0RwqH7M6Ga1Oof4K8IQqUvzXUHrb0AxXoe+0VL1MJ
         0e3jHw4h0QMJ1U8Fj6BZGCTtoMsRBIFWNDrjACHnHmp+sVjJZay0qzYI17kWrRutO1uh
         i2DrRP7BRtvH86QGO6FDO/tazsVgzrChdiahkOo5Rv+FsqO3DzG+Jm/qG1leOpCxP7tC
         DwBgPfWz0rOEC8Y83481GGQQ+h588Q2d1/0Xca6ke50wubX2BhJRpplV9adDNzqJyvN9
         c+xg==
X-Gm-Message-State: ACrzQf0a6tCI8B+yTTsmD1EcmxL+ULS069lvthgQd1f1dauSY9yZOa09
	HMuOqBPzCBbu77aNC7CfpJBioIOQtRTo9Q==
X-Google-Smtp-Source: AMsMyM5q5LBobhPpadhYdWK21Rklj7L74CP6CZbzlPQrmTQPsNsEnFJ+tHnGl3Fc4KORKNNZDRWi2Q==
X-Received: by 2002:a05:620a:15a7:b0:6f9:efd4:1326 with SMTP id f7-20020a05620a15a700b006f9efd41326mr5380042qkk.654.1666956708749;
        Fri, 28 Oct 2022 04:31:48 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id w7-20020ac84d07000000b0039d02911555sm2226116qtv.78.2022.10.28.04.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:31:47 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-36cbcda2157so44318597b3.11;
        Fri, 28 Oct 2022 04:31:47 -0700 (PDT)
X-Received: by 2002:a81:3d2:0:b0:36b:6772:75a3 with SMTP id
 201-20020a8103d2000000b0036b677275a3mr29799990ywd.383.1666956706935; Fri, 28
 Oct 2022 04:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221025220629.79321-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221025220629.79321-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 13:31:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-OXF3hG2im4SNsFsLXES84PVKkOxo5gRAi1dD7V6BnQ@mail.gmail.com>
Message-ID: <CAMuHMdW-OXF3hG2im4SNsFsLXES84PVKkOxo5gRAi1dD7V6BnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
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

On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> ---
> rfc -> v2
> * Changed the SOC_PERIPHERAL_IRQ() macro to just accept IRQ number

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
