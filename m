Return-Path: <SRS0=aIE1=GS=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F24AC433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 22:21:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D48A423382; Fri, 15 Jan 2021 22:21:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C424235DD
	for <soc@kernel.org>; Fri, 15 Jan 2021 22:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C424235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f45.google.com with SMTP id o17so15454721lfg.4
        for <soc@kernel.org>; Fri, 15 Jan 2021 14:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P5tRwFZpJtVF/buhxZcoEoFQtvw2RmFYD11GvJuVe9E=;
        b=OyyLbfx9J1qLgRci7wZTIyT4U9KdlUzetkeHVvVxvlw82fsYYml+Fkzsds7VfcTzaW
         ehrV2wHLPbV/yX/eT/taKe0AFrnkF2wixHO9J6lqy7pVfo+hN6IcC7kH/umPa0X7sPGd
         0i+VKkhYyV2PWy+1o/gARg6hLaQxh3nyCTo/KNdhebVl9unlWNBHegnqlGXh/XcgVgiX
         bHabjLBC4Ctnx/IwRjH3tyap8bs7CXZMGO9jLSJnsDM809Jvg/3H1KFr4Nz9b+U5tjOm
         ogxjejK4qkMRDhnzinWDTKVjSLxF8nbKFD7923Pi4wYq+FTMgD11wNL2r5+J681PBlbY
         2GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P5tRwFZpJtVF/buhxZcoEoFQtvw2RmFYD11GvJuVe9E=;
        b=KiZcoNY2sW824xXaaboIeov1Eu2fartNEq9Z/CmN6ed1fLBDuJavDfxOe3/akzldXk
         /dAe6xGOGkWv6cImm1tw79HJCMz/oK05WLudOZUA2m9E+HcDGYxdNsoBIyiudtKGlkzR
         9oNGv0joM7cNSSVylj8nZuljFCPEBFW1KY7tSS4tVIWpbhSSLrUY9y+2WOe1evpcizM0
         AInxfy7og0InTfWEHsPTe74PvoTcxwsPuC6QLdjLpojl90rb1X0Zjk4ojuRqhBtdAdXf
         uqYdZfgfphWjZ/YU1vHgDkGk5vptEtn9sTMFe9UcbdBQPPDOK+27OsTjXK84KuiaVnIH
         KLkw==
X-Gm-Message-State: AOAM530z3PtNH0cVwn+uVMqnJFQKBDzVue5j1r6+8AC76F6S4sOBGYAY
	j8fIDblH79S2JoHNv/9rY6MZwKYiw/59q5MuX19K+FyT71M=
X-Google-Smtp-Source: ABdhPJyazJTE6p8cMWOgUToD0TsF4sKXwlDtfVufaAh9yZKxEA2JGi2DzJU7Cr9YjXQFjerZ5jjJjROYo+ci5pns4VQ=
X-Received: by 2002:a19:495d:: with SMTP id l29mr6235978lfj.465.1610749275587;
 Fri, 15 Jan 2021 14:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20201213225517.3838501-1-linus.walleij@linaro.org> <161073123818.625238.784153877114947970.b4-ty@arndb.de>
In-Reply-To: <161073123818.625238.784153877114947970.b4-ty@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Jan 2021 23:21:04 +0100
Message-ID: <CACRpkdZBMxjBbUXFEa=ByGMKQ189=JHR=CxBBdZ5ejPVuQ_c1A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Hildenbrand <david@redhat.com>, stable <stable@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 6:22 PM Arnd Bergmann <arnd@kernel.org> wrote:

> I had mistakenly not applied this last year before the merge
> window, as I misread the description as being not very urgent.
>
> On second look, this seems important enough for the v5.11
> fixes branch, so I applied it now.

I was just thinking about it while cooking dinner!
- Hey what with that critical patch now again...

Thanks a lot!
Linus
