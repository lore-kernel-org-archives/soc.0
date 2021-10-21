Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707D5C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 21:10:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 11F1961213; Thu, 21 Oct 2021 21:10:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC02B611CE;
	Thu, 21 Oct 2021 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634850618;
	bh=9xbR+lTg9/ACwAiLuzWLsdOO//TC0WWXKlS1NvkC6Bw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G0PAwS1IecKIi2E7CGrbSfqz9TnycnClcpdeg0ENvhE9rzvUObb6iC7RUuj4NaNuA
	 MTmzJWoWkP/b9Boaml4RoufblqgbnjyX8TRvwoohkR2NHIVHDfbT48L3REFQ4qoOqu
	 yRWk+YZH9+TWNOQv6fTyISfqwdS81PYeXa1mjw6+ve/pPEYXUL4P6sIafftN16Sqpy
	 80XQyAdlDKJfVRy1H8/XAJOz7IVVpIrlaRwkCviea2WE8cQ17Thfqu0NbbaLM/0FkC
	 KIQSlZwsUEjvpWhBfdojUqCskfsoM8dXbLCWdtlS76x/9c0S+9JLVpIJ4UbbeBWinm
	 2gD0+fdPUEhQw==
Received: by mail-ed1-f49.google.com with SMTP id y12so3739054eda.4;
        Thu, 21 Oct 2021 14:10:17 -0700 (PDT)
X-Gm-Message-State: AOAM532xrQ4aH8ZBgVt7wY80gVxo/jTAdWHmOsJ64P6Nz8l8yKvo49OW
	t3X71hcDjIzeyIWnrGzn9hjUfsPrOgvpw558/g==
X-Google-Smtp-Source: ABdhPJz7QQpBAGn9kOpB12au2zkwBeIeFcdQTZ975j6S/RSx0DB73w93aSWmxN45JNAofo+mklz65G3wjvl9O72FpZ4=
X-Received: by 2002:a17:906:6a1d:: with SMTP id qw29mr10076859ejc.147.1634850616364;
 Thu, 21 Oct 2021 14:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org> <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
 <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
In-Reply-To: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Oct 2021 16:10:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
Message-ID: <CAL_JsqLyLOK=1HwirRmA+FwyfZckzodqT08Qy_KZz3-WPN6Zsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 3:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> > On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Please apply these instead:
> > https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> > https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/

Linus?

> >
> > There's also also these fixes that I sent:
> > https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/

Viresh?

> > https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/

Bjorn?

> > https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
> > https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/

These 2 are the only ones in next.

> Is this list still up to date? It looks like some of these are already
> in linux-next
> by now, so I'm not sure which ones to apply. Could you send the ones that
> you want me to take to soc@kernel.org?

Splitting up dts fixes by sub-arch only to have them ignored and have
to chase down the status or resend really doesn't motivate me to fix
anything.

Rob
