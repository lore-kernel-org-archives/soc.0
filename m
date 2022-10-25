Return-Path: <SRS0=pv8K=22=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D151C04A95
	for <soc@archiver.kernel.org>; Tue, 25 Oct 2022 16:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6B21C433D6; Tue, 25 Oct 2022 16:13:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00468C433C1;
	Tue, 25 Oct 2022 16:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00468C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id d26so13766131eje.10;
        Tue, 25 Oct 2022 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8k5UyCJg2NMPP4g60YtwffYqOC0aHgrkKd8pUxsWhgY=;
        b=owRTX5/ShqCDoM8DYtFu07eYMwO7yrFql7qZ690fVlPcCRqqcGQAJXFI3ewpdN3F/e
         n7rU+r3Lt0GIXJ1nacsBmjYp+fiZv5KD2U3M/hCJ1qCHu3FOYfodErRQv3JJfwmZtgC3
         oMMNX7BGcndu5E1gXP6U6nPojUZo2FhkaNeIXuazK3oyKKnarISJ/5mPrfaUPYtVrCEN
         5G0ujzTL6j7tNKHfM3yNKn49i7p5gk+yV0Kr9PTAdFFJd2mLLVgadtKKdE5+ra7I20z1
         ctP++yM9vlyiu9v4C8dqnTc6Ov6RZQKvVF6oG1vndty9jsIXU3jj3hPwo5ARAwN9M2X9
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k5UyCJg2NMPP4g60YtwffYqOC0aHgrkKd8pUxsWhgY=;
        b=7kJD7surSxjGq5qlZ9oub0+2YbOkMz6zdT7YRaHI0+JsT8X286lrofxTwRfTfvoEDW
         dPjhyHUW6hHuCfP+B68iL0OsFZMLrbvTXIYHq+D2/Y2jDAhcS18ZXITCZGM9WlbzvZV5
         I2ZHBaG5Bie49XJo+YgR2ivRfqn+eQdYmjlNIM5k5AiWKsFwHc9XE2nf61Y06aehpyc4
         KiaBdvfUQ0Xb/Lh6BSMHBYBGz352v7nwngYt3V8MPcNmvf3vDq1To/wTYNtEzts6xEdL
         lGkp6FYCbcZviw3iX4/vh3h+IsN1C1pXanE0CD5KQB3Fpru0PkJV/ALK0MewNO8zmocD
         5xOg==
X-Gm-Message-State: ACrzQf1e+JT+L8wgOwViCRBo0pOWhYUrPkq3NXYYQySiYKPWyUvt2Fdc
	FQrYsC8GSgYhdPZJuO74ORhAtWhdWTa3WxIcLs8=
X-Google-Smtp-Source: AMsMyM7emL6MbHVHmI1HuBgGTnzWTCjyKfPkCHMUYmk40cRiSKsI1GbMCGWs0NZiBfecUTAMefnzbVLT4+u2uByPAGk=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr32981078ejb.80.1666714427234; Tue, 25
 Oct 2022 09:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:13:20 +0100
Message-ID: <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out
 RZ/G2UL SoC specific parts
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

On Tue, Oct 25, 2022 at 1:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> This assumes the operating points tables are the same for both variants?
> I guess that's OK.
>
Ive asked the HW team to confirm this. For the v2 I'll keep it as is
and later move it if required.

> Overall, LGTM.
>
\o/

Cheers,
Prabhakar
