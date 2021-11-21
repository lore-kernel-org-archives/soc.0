Return-Path: <SRS0=LHDJ=QI=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEABC433EF
	for <soc@archiver.kernel.org>; Sun, 21 Nov 2021 23:19:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8033260F5D; Sun, 21 Nov 2021 23:19:34 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7E960F48
	for <soc@kernel.org>; Sun, 21 Nov 2021 23:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E7E960F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso26193212otj.1
        for <soc@kernel.org>; Sun, 21 Nov 2021 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=niG4LhykdMe2sCgAWkzlpTzAknhhfhfFKN7/kHVLdb8=;
        b=wcakSBzJXl9BZALRNXqLiyhsCB+m6PdHwbi8HzqWYQSDqzOUzvEqpnvo21ThgDfiUG
         YeyUYuOqKliWaPSXP/3LV4nTzhJ67sErjZ9XmD8vEyQ0pDW321Hx2roOzp9DvJ0BEA7J
         2IWUMeWBcGigOgZN2CdXyeomJHmgrZ/hwlM+gUea3h48Ioa5ZpPo0L3VUny+fxgUQ0ks
         /ZLvb22GhtsiEvG5gQXnXcMFBm5AfOhDm+50f7dWkr6nQIM/zeugbt4FCtIx6kcdwEIS
         IWPVkQyjCfhxRQIYm1R2CrQsPeeRMtMsD9QvTBmJ8X3sG9ojs8/p/EM1lQ+VBLpDkc4q
         TKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=niG4LhykdMe2sCgAWkzlpTzAknhhfhfFKN7/kHVLdb8=;
        b=qRJEPU6ZQ9snQb/sFbFueitklkp8NUixeJLp75RTI+QyAMsbJDlnyg/k+5syg2dDYE
         mYI1BbKiy4WObJVK6VBmZqCSvsSjmInNoF01aT4QwTYuxHlKDy47N6klCFqTf78gMQvK
         ybTmu7unrA8pm7a8mObbw2mXDtwLC7g1gfd8h0xmgl+6v3HSMYJlPl9bgcHBGQBfwrT3
         qakRW5LNaXeVn6Ow0f+FC22sZ7M4KlaXPpR80gRwngzgHX8LlNMcBfvOsw4rT4XeXMoD
         QCp+PNXpO0KvSgUIpsRFks3iISerfoFJddZdqLcjt7FuRiJgdAshUxBpE2GnnjneScDN
         61xQ==
X-Gm-Message-State: AOAM531ZnYkzWfdLRnOlEA5y0qz94RqvE6OgCmzbC4nDV1Y0Vh87sHjI
	3ctRFll7KvmQUExdvvESoG6na3jeQGy4VAO3HYZiug==
X-Google-Smtp-Source: ABdhPJyVdtjQUoLHr9GMlVhAVr/1N/sztecCcTj39EJlBe5nSjbyIi50Oo/ofoA+ROJrbzFktx9bDGshBDQgVsRlEgw=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20546619otj.35.1637536773648;
 Sun, 21 Nov 2021 15:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com> <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
In-Reply-To: <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Nov 2021 00:19:22 +0100
Message-ID: <CACRpkdbsP1zibFvg2yL67ndQJ1MxBRmH5j+cZ-giZkmrnGROdw@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
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

On Fri, Nov 12, 2021 at 12:04 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:

> > As it appears to have some cross dependencies I assume
> > it will be merged through the SoC tree?
>
> I don't know. I've never tried this before, so whatever is easiest I
> guess. Do I do anything special other than cc'ing soc@kernel.org for
> v4 to make that happen?

You create a pull request with git request-pull and sent it to
soc@vger.kernel.org and linux-arm-kernel on Cc that should
work fine and it appears here:
https://patchwork.kernel.org/project/linux-soc/list/

Yours,
Linus Walleij
