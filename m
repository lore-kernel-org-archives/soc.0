Return-Path: <SRS0=aQQe=QJ=gmail.com=emil.renner.berthing@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA972C433EF
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 14:02:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96E5760F25; Mon, 22 Nov 2021 14:02:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23015608FB;
	Mon, 22 Nov 2021 14:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23015608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id u11so14173333plf.3;
        Mon, 22 Nov 2021 06:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CXsdV198ETc5Z4b8HkqNnBSItnEYeGqb45DkswhRR10=;
        b=Q6byk+Q5g+cxNLEm9cRU1WHbZ9HJE4lvvdMnQXsT8WMgW+ZOHZGZ4MgfdPRjvCA3uh
         WAU2hINBj2ls0UbltQ+AUEmGoX+KI97zNWG74UL3lrY2PyuuQZvsDY37pSi0rn3/3Rav
         8+DkUZY0tt1qhp7A9yllOPDRs9Y42mXujqOfgjODOQnC5I9Joq/rEGkD1IM+X7Q2dDXB
         STa5Z1skT1ltR1SrrBpLeo60nmI9dO6VqnHZoYUEhOsYDE5j9yYCOlFsUIikbzM3BEjb
         zBDQ6AqqePXXxqd74OW/3rp2RPOk03C3YY77MF+t/LSRxTd5wBScqIj7KSlglumRYkM8
         a5zA==
X-Gm-Message-State: AOAM532GgHxmBVSX/Qiu09A0ETs8ATLCRiFVe6yeQd6BdZhMUUWs6/1/
	wL6UbDlZ17WF907AUM05BMLdQLY//zyVif1vuiw=
X-Google-Smtp-Source: ABdhPJwgDW7QnFYaRXQx8WMqdI3IoaCx11UiPY/TY96xWHkzvW+86RsBX57z5zjgEHmwt2m4CJlWhRK0P1C2/0hu1wE=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr108553260pll.33.1637589748634; Mon, 22
 Nov 2021 06:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
 <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com> <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
In-Reply-To: <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 22 Nov 2021 15:02:17 +0100
Message-ID: <CANBLGcyWGeYUk_RcL6rhmu4608bP7LQ35o-B5FiNckQUDJ83Wg@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
	Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
	Matteo Croce <mcroce@microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Nov 2021 at 00:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Nov 12, 2021 at 12:04 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > > As it appears to have some cross dependencies I assume
> > > it will be merged through the SoC tree?
> >
> > I don't know. I've never tried this before, so whatever is easiest I
> > guess. Do I do anything special other than cc'ing soc@kernel.org for
> > v4 to make that happen?
>
> You create a pull request with git request-pull and sent it to
> soc@vger.kernel.org and linux-arm-kernel on Cc that should
> work fine and it appears here:
> https://patchwork.kernel.org/project/linux-soc/list/

Thanks. I'm just waiting for Palmer to ack the riscv bits then I'll do that.

/Emil
