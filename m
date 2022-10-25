Return-Path: <SRS0=G1Et=22=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41989C38A2D
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 12:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BB80C433D7; Tue, 25 Oct 2022 12:37:23 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8814C433C1;
	Tue, 25 Oct 2022 12:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8814C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id r19so7374455qtx.6;
        Tue, 25 Oct 2022 05:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEjQC8UwPSpJbdU9AEdKNSZFHoUYuJmVXV6mmwXFmnE=;
        b=cWCeSJlNvs3r7QVdeCLE+6xjADargYj1/dG9w0iMoXJzMzOUR9iXBkwcoUnKNDwToR
         HYp17gVoZ8fqajXUeeMuzOXdEyLfXc4rOpiEiVM2lTTHo2VmCVXCljK9Ym3Vy6XOcy8n
         Lg5013NkDMZsdZpOMBAEz2aRBIecNPZySZlFY6Ri1mjCkhqSOcagOqouwRpx/ovISRwh
         uHyTr+JA7XI89kxNHzjQ4nrDVaQm4eEfFVXQm+vMX0BuhlXhOV2++HmjN3pzYOyEvV1A
         Zasbw5JFv/366CcfeD/pptGg7m4rA1KNYuQ7uwOLmiXzoEjAKFdem43uMOa8i5yO808E
         /dxA==
X-Gm-Message-State: ACrzQf0beWfqvgKOU8Rw7d5EMhw507xW/7eqgdzK81SomYwpqQbQhWvV
	noxOZgJ32ychHDJX7tvSE4T3iQW2IG3Mmw==
X-Google-Smtp-Source: AMsMyM40B4FKvxIbQGL5fOkoMdwqf19OyWOdwS7p6TL9x2bZTvxd37hoM832zsE+hvwOS0kI2dDu3w==
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id d17-20020a05622a15d100b0039cf1dafe0emr31363723qty.662.1666701440457;
        Tue, 25 Oct 2022 05:37:20 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id bl23-20020a05620a1a9700b006bbc09af9f5sm1973087qkb.101.2022.10.25.05.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:37:19 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-367cd2807f2so112067687b3.1;
        Tue, 25 Oct 2022 05:37:18 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr32925900ywe.283.1666701438736; Tue, 25
 Oct 2022 05:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:37:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
Message-ID: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out
 RZ/G2UL SoC specific parts
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
> Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> can be shared with RZ/Five (RISC-V SoC).
>
> Below are the changes due to which SoC specific parts are moved to
> r9a07g043u.dtsi:
> - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
>   for SYSC block on RZ/Five
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

This assumes the operating points tables are the same for both variants?
I guess that's OK.

Overall, LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
