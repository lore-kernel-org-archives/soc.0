Return-Path: <SRS0=vL6j=24=gmail.com=prabhakar.csengg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA08C38A2D
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 08:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32DDEC433D6; Thu, 27 Oct 2022 08:20:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ED49C433C1;
	Thu, 27 Oct 2022 08:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3ED49C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id q9so2486120ejd.0;
        Thu, 27 Oct 2022 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yLZb0eCEmPbt6XCImQLnWXa0g/D2mdCPENmM5h+0jwE=;
        b=BllIFPs/F79nlMLuFBJOgtM2ZQfMVvi6XS/8ah6Tjyu9Vq+Dm4PguQPqRyc/Cv67a3
         2PgTJZgqqNZbMRSJNVYRyW802BW1hkPwPggbWsOjdfSKUw6cw92OJTKu0R4ifOnoO5DT
         heWxsIXcTPSrE7IKJGumD+szEYrf0qE+hb6dfuzy4/pz8N2AWH3xyYavBOwZFKRXrIsu
         9JNpo1l2rz3KCYxARfdsxCFdbVknGjrAN63uYEWW80RcC17keEhk4P8FEep0OVpORf2e
         mLBbqLZRYY2LBzgfWisFsKHl5B4Tu6jufyHns8YurJrRwicDOOGDqbJv+6CVEt0iGSzJ
         SE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLZb0eCEmPbt6XCImQLnWXa0g/D2mdCPENmM5h+0jwE=;
        b=QJMdWGG/UzkaLBuhJ3oi+/GAsps6IoECcXKocQdXwaXHJswahDYBclPkqzW4rfIkZB
         2l6+J4gPSk4o+O8B7t4PdD+9su5o/RMRsDP70ZVhzjDNMZqb/UTvJ/R3l3Uwn/PDydF6
         lTgtv5aqBOPB7jAs9S6MFU5sbDFsmXZ7KK8mQfSQIoDm4Elwmoc8kPyUoTSXvAhekdIv
         rGGyrtcq7GGNadzZa/MDZnUSgRx5RBfRLekXUQzWUGVkFMjpJrrOIgNZ6N7OLuYOSCaj
         ZJq5FihMJOvA6PWk15beoruAqV+vp5MfJZfbN1Uox9qxOQgj6jygOTxEvYz3KFqaTOiJ
         jBmg==
X-Gm-Message-State: ACrzQf2YFJgFxLJewWW2MXvspzsVV18oXM7qqUCpxuMXVrJ6j8eZcjtM
	R7/QK3jK8izej/dW96mUuOfMu0v9imlydf7n6+A=
X-Google-Smtp-Source: AMsMyM49+SK4g8rI8Gl/M2IN/uHmlHyw2onhRC25Y/4JSKYZfGwLi0DI3dmFQymh9tnjoOsDrWoUXSmVKKL0amALrhI=
X-Received: by 2002:a17:907:b1c:b0:797:983a:7d97 with SMTP id
 h28-20020a1709070b1c00b00797983a7d97mr33693456ejl.267.1666858852484; Thu, 27
 Oct 2022 01:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com> <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
In-Reply-To: <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Oct 2022 09:20:24 +0100
Message-ID: <CA+V-a8tK8qQHNnwgvUiMMHOuBfVmbLyMvT4RZjq055nrda8yPw@mail.gmail.com>
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

On Tue, Oct 25, 2022 at 5:13 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Tue, Oct 25, 2022 at 1:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> > > can be shared with RZ/Five (RISC-V SoC).
> > >
> > > Below are the changes due to which SoC specific parts are moved to
> > > r9a07g043u.dtsi:
> > > - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> > > - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> > > - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
> > >   for SYSC block on RZ/Five
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > This assumes the operating points tables are the same for both variants?
> > I guess that's OK.
> >
> Ive asked the HW team to confirm this. For the v2 I'll keep it as is
> and later move it if required.
>
Ive confirmed with the HW team the OPP table is the same for both the variants.

Cheers,
Prabhakar
