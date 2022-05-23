Return-Path: <SRS0=V8kV=V7=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177ABC433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 14:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5EF5C34100; Mon, 23 May 2022 14:06:32 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB709C385A9;
	Mon, 23 May 2022 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB709C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id y15so8297456qtx.4;
        Mon, 23 May 2022 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fYWALA3lJgoSN00lrVAVMkJgNm+QYBYbKEt1Mc7Ujl4=;
        b=dbQlCYK4kUsiauG/2q6X9XZ/kOXYA/h9a0mLc2O1oQ/b7+WcxOUD4u3pZ/snMQvpHH
         24Jt0GJDwueg5zfykQ4h+SXaU6npEMGfVfEaRReXu2FQ0udX1X9WKalUv6L8lsS1al3X
         dY1bieOHcJ/1rfO7A5WD2V+MvzJRIa1ms3MpcYF8sWRZ0rm2OSrify2jPNgPWGExbwvw
         KCfcpDOr7Wl1BmXFPUDqjptubZ5H/tWANNDCj7PL/UZQFxuni8we0qNN17nm07egaUF7
         3LsA66mt2dp3DiqXG1G7NfxfIWl0AIIllnQe1L1cNAnV29piQFtb7IZ2cPg4zcJbdSd/
         nkOg==
X-Gm-Message-State: AOAM532T06ASQua5qCnMapaMfP+6tyS0t+14qRgkGUy+ll7GVypp0bbX
	arZvVL8iRiC3Hc3Pwh2rPpqT2vGjZtaLOA==
X-Google-Smtp-Source: ABdhPJz5AldMa8B0xGSD75gXexB457MTQeFv6JhA8XGIPH1nQvtnIxyffAD1/IPFF+59lCww3PIYMg==
X-Received: by 2002:a05:622a:1010:b0:2f3:d8f4:6cb4 with SMTP id d16-20020a05622a101000b002f3d8f46cb4mr16275787qte.180.1653314790641;
        Mon, 23 May 2022 07:06:30 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id a16-20020ac87210000000b002f39b99f6a0sm4178577qtp.58.2022.05.23.07.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 07:06:30 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id i187so23355777ybg.6;
        Mon, 23 May 2022 07:06:30 -0700 (PDT)
X-Received: by 2002:a81:234b:0:b0:2f8:4082:bbd3 with SMTP id
 j72-20020a81234b000000b002f84082bbd3mr23570342ywj.47.1653314322494; Mon, 23
 May 2022 06:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-18-tmaimon77@gmail.com>
 <c1b86493-d82d-a639-07af-4c979d733786@linaro.org>
In-Reply-To: <c1b86493-d82d-a639-07af-4c979d733786@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 15:58:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSccO3J5OYrFUn+azKyzYBP1wmuHZoRU2t3PUbkZx1wA@mail.gmail.com>
Message-ID: <CAMuHMdWSccO3J5OYrFUn+azKyzYBP1wmuHZoRU2t3PUbkZx1wA@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] arm64: dts: nuvoton: Add initial NPCM8XX device tree
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg KH <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, 
	Vinod <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Robert Hancock <robert.hancock@calian.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Lubomir Rintel <lkundrak@v3.sk>, arm-soc <soc@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, May 23, 2022 at 11:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 22/05/2022 17:50, Tomer Maimon wrote:
> > This adds initial device tree support for the
> > Nuvoton NPCM845 Board Management controller (BMC) SoC family.
>
> Thank you for your patch. There is something to discuss/improve.
>
> > The NPCM845 based quad-core Cortex-A35 ARMv8 architecture and
> > have various peripheral IPs.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

> > +             l2: l2-cache {
> > +                     compatible = "cache";
>
> Is this a real compatible? What bindings are you using here?

The compatible value and related properties are defined in the
Devicetree Specification, v0.4-rc1, Section 3.9 ("Multi-level and
Shared Cache Nodes (/cpus/cpu*/l?-cache)").

The properties are handled by
dtschema/schemas/cache-controller.yaml, but the latter seems to lack
any checking on the compatible value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
