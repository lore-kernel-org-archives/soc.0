Return-Path: <SRS0=cpLJ=RY=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A28C433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 21:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8F6CC36AED; Sat,  8 Jan 2022 21:18:55 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01DA3C36AE5
	for <soc@kernel.org>; Sat,  8 Jan 2022 21:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01DA3C36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pl1-f172.google.com with SMTP id h1so8700472pls.11
        for <soc@kernel.org>; Sat, 08 Jan 2022 13:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQdHX59zQzGaf+OD8CwAKEthqzbXd85Vf3CrWa5Zq2E=;
        b=ehLSUCz/PoKCY8UVLuCTp0TOssmBOWuJhidj7WZ9dGV8EDqfPr0pVY44E5TZ75huCz
         wyWH1niOT1m8Wis1qDnmP2pj+LOR2VXd0IkvA1XZ6eeNBbAI8s9snPCHq6/PYGTZN6Fs
         TPf8kxA/iV5IXmBkPWMHXSVAYlNSzW5WXER94FlL+VGxEa3+kKnE/0DasR/sWHWNu/rr
         wCh1atlqeYUjz7SK18GoczdPzsJEzTgGMj/HVEiVj4/2tYx7LJIqzHwUF0XNRdV8Os7D
         rG4FRTcNEERWGimzCwmT9zld9ZbnnmC49wNC2VwJs93VCfIsSsc9NOxxJaO0m8UtgdSY
         Rgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQdHX59zQzGaf+OD8CwAKEthqzbXd85Vf3CrWa5Zq2E=;
        b=d9dv7ecEgfvrDbsQRBDUUIcwe0/8jLJSrmHFw27XOrTfNX6O9iJeoRFx5vokmtNpqx
         1OkWO6zPZT4rtWGDMiEE3+/4vBLCFhZ8G4QI5P5AmQBblzRif0W9m8S6nWZl8bSc7t+S
         XqYY7xxQpj/cipqvR2hWAPZs+jpFhV1HxlZXo3+FFWsg+GQZGkuaak/ZdI5N7sx8sLiz
         Qd3Fq6KfZDwXvBuiceTeG+z7Kod5ykGaf4+YGYuZCry0RRimHnVry0Kr2SjZFxpe+F3H
         KdUVeJCOdfB0NXw0/T71LfcjAeenZM8F/iANhk4ATSY/NV1Zb2CTGUtRJnjruETzT7jd
         KLyQ==
X-Gm-Message-State: AOAM530MmiFfP6vIV0ROLBFBT+KYEeGNydhZVrAd8OXJw3XDoflzFR1Y
	HtyCHBch0AscAXKEX8m/lAeAX50ukXqkxzX+V8IyRQ==
X-Google-Smtp-Source: ABdhPJwGySUI2fsTiCx40M78PiFzLhwoLq1bFbm/II9AeUmCOBd2CE39UQgkFOJfOnTXEz2jDWn0SdoSDbY5ON7o/u8=
X-Received: by 2002:a63:a741:: with SMTP id w1mr7966528pgo.620.1641676734454;
 Sat, 08 Jan 2022 13:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20220104170247.956760-1-linus.walleij@linaro.org> <07f6beef-8824-e995-577e-3c705ed7d40f@i2se.com>
In-Reply-To: <07f6beef-8824-e995-577e-3c705ed7d40f@i2se.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 8 Jan 2022 13:18:43 -0800
Message-ID: <CAOesGMjQavd+2eupBE40BfhBwVq4_K493Kn0uzsCi9DoPHB19A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: gpio-ranges property is now required
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Phil Elwell <phil@raspberrypi.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 8, 2022 at 1:04 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi Olof,
>
> Am 04.01.22 um 18:02 schrieb Linus Walleij:
> > From: Phil Elwell <phil@raspberrypi.com>
> >
> > Since [1], added in 5.7, the absence of a gpio-ranges property has
> > prevented GPIOs from being restored to inputs when released.
> > Add those properties for BCM283x and BCM2711 devices.
> >
> > [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
> >     pin-ranges")
> >
> > Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> > Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
> > Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> > Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reported-by: Jan Kiszka <jan.kiszka@web.de>
> > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/r/20211206092237.4105895-3-phil@raspberrypi.com
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Hi SoC maintainers, please apply this directly for fixes, the
> > missing patch is wreacking havoc in the RPi world.
>
> this patch has been send to soc@kernel.org in order to fix a regression
> [1] caused by "pinctrl: bcm2835: Change init order for gpio hog". Would
> be great to get it into 5.16
>
> [1] -
> https://lore.kernel.org/all/ec60b52b-7a59-266d-9608-11c0da9053a6@i2se.com/

Yeah, my bad -- I only scanned for pull requests and missed this
patch. I'll send it up. Linus just merged the pull request I sent so
I'll do an incremental one.

-Olof
