Return-Path: <SRS0=5IZg=25=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2200CC38A02
	for <soc@archiver.kernel.org>; Fri, 28 Oct 2022 11:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D15DCC433C1; Fri, 28 Oct 2022 11:41:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E66C5C433D7;
	Fri, 28 Oct 2022 11:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E66C5C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id ud5so12329562ejc.4;
        Fri, 28 Oct 2022 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5y5A9pG1/H0U+8RgwnxHXSQw6+Rfn/giVW1kToYs3Y=;
        b=Csf6zZS0/kCTQiC1yhxCCUQQrGy4No9ZwiINBJnWGpQCa2tG0KVfBIdKNllX+F85uz
         vzZ5VFkfvUdJkGdJriHLfOY89Q4WOKODXwTdZVhsOdwWOQ+OJbnxRF1k2g65xQJlQb6L
         ImdBaFL8609ImsALNyovHlAtjGeyD0t3h/YpavNYYIEmP5CfZ1sLdWiSYnIQSI9+iVUJ
         slLwnX6Ycwasc/zYFb4nlwfdF31S99ZisgeiZHMr7PhDejYZ182nBfMGMp1FybyegHzJ
         CP9i85gdja1QLPowrSviaFSJWu8xRm3aL3PjboYiuFpnoWVEjDs09zff16/mOj+H//ec
         R+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5y5A9pG1/H0U+8RgwnxHXSQw6+Rfn/giVW1kToYs3Y=;
        b=E0TqHEKNaf0fFAs6qn8rGOta+Ro6i9H4UQBrgULjO6DxZXjXR42dLuCwTweyiXI8li
         BEUyhaMjbx/tmxJ9nLnENUZNBJyJOluZVou1GK2KdcfijirCgkOnhVP7wZJ3jAcEHJXo
         qbWQBY/P5K+MKK3PqC2ZFfdFUGSDVfO43PC65YA7QDu7lw5d+kHh0jMwwzb4W05yb9V9
         r9z8n5mnNVvIiH65IQxbnB7dFO6qg0E63xA+/N+VgytyESo8IBYfZ9/zBQACxUfYQvRe
         N3gGA56KT1UPXo1IDqFDiL8CnfTSvruYvf0RZeVSkVQsQ7iBfPzbrNR70p0Tx9W3JQDP
         YJvA==
X-Gm-Message-State: ACrzQf2CMSnALsE2a6jcUWLx5ebe78iVUPVgaAfZ4nwDmT//FgHgSScm
	aGMwav/VtbRvDbp8HMYOMjpy5yleLNAaTqsStak=
X-Google-Smtp-Source: AMsMyM7k7NlrLg2TkNTq5MWbYtY7EI7PuCwUCR7FFMsv2VcliAPc0Yg89vfXdfHM4lu0CUxKH39lgb2/kVF9LDK8Kqk=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr46178042ejb.80.1666957277120; Fri, 28
 Oct 2022 04:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
In-Reply-To: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 12:40:50 +0100
Message-ID: <CA+V-a8v2RkNSuVxVsoYhS3c-xJ7bJAm+ApaDCoK6oBzTx5gsnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL
 SoC specific parts
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Fri, Oct 28, 2022 at 12:35 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> > can be shared with RZ/Five (RISC-V SoC).
> >
> > Below are the changes due to which SoC specific parts are moved to
> > r9a07g043u.dtsi:
> > - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> > - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> > - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
> >   for SYSC block on RZ/Five
> > - RZ/G2UL has armv8-timer whereas the RZ/Five has riscv-timer
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.2.
>
> > ---
> > RFC->v2
> > * Updated commit message about timer
>
> Right. And I'll add while applying:
>
>   - RZ/G2UL has PSCI whereas RZ/Five have OpenSBI
>
That makes sense, thanks.

Cheers,
Prabhakar
