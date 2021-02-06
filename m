Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58548C433E0
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 14:36:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2B6E64EEC; Sat,  6 Feb 2021 14:36:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5C4064EDD;
	Sat,  6 Feb 2021 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612622171;
	bh=zltFensfIOaucft3dnQbV0Rppek28HnifD2ZFJw+V8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FZpl5EJ8meE2SeQp5Ix9XAJRHzViBqyrVaFpCHN1qkcSVtXseziY7sdCpZpwDfaG2
	 Pqs2L/EXHctoTiF0Q9cm+8AJEripjPvGLccjrtBfZDsHwXalrzXg1NiR76uCUb5o0R
	 RjIRtKEB9KuGpxOsJuApHBs/KYn+4cV5CyoHTLpd1ARvja4rx7voZNhkBkQa845GFz
	 OuR7sKlPq8fhAdIEUj49FUjitwdmV0tVJWuPu5UnpSymDqrP6vE/iCujF6atMa4+pd
	 rMzUYDz+k3Nq34/OmP3gAuStf7oVDquNmHNM0oImywUN+ZZHNIkIhDm396NkuABBxG
	 QHgee5MXYInZQ==
Received: by mail-oo1-f54.google.com with SMTP id y21so2370675oot.12;
        Sat, 06 Feb 2021 06:36:11 -0800 (PST)
X-Gm-Message-State: AOAM530GoKMMjvFjd91YIT3Jickptns5c8PEXHAYwtYuhmecu4oDUwpy
	kOYgpMtXNFseqI9euDYVOmfkS9+hGJD730beHho=
X-Google-Smtp-Source: ABdhPJxxCy2jd7gz66P/CXSyGGBOIFvPAtOXshwBn+zKLK6bFg+1Wb2tqBL8PPdtihQL2pqEJLuoug29AsgqxDAYPpc=
X-Received: by 2002:a4a:bb01:: with SMTP id f1mr7146859oop.66.1612622170813;
 Sat, 06 Feb 2021 06:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org> <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
In-Reply-To: <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 6 Feb 2021 15:35:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Message-ID: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <snawrocki@kernel.org>, DTML <devicetree@vger.kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Frank Rowand <frowand.list@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Alexandre Torgue <alexandre.torgue@st.com>, Kevin Hilman <khilman@baylibre.com>, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 6, 2021 at 2:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
> >
> > ----------------------------------------------------------------
> > Samsung DTS ARM changes for v5.12
> >
> > 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
> >    it suspend/resume cycle.
> > 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
> > 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
> >    charger.
> >
>
> Hi everyone,
>
> Any progress or new comments about this pull request?

Hi Krzysztof,

Sorry for not getting back to you on this earlier. I discussed this with
Olof the other day and we decided to merge this, I just haven't
gone through the pull requests over the past few days. My plan is
to do the next round on Monday.

That said, I'm still not happy about the patch we discussed in the
other email thread[1] and I'd like to handle it a little more strictly in
the future, but I agree this wasn't obvious and we have been rather
inconsistent about it in the past, with some platform maintainers
handling it way more strictly than others.

I've added the devicetree maintainers and a few other platform
maintainers to Cc here, maybe they can provide some further
opinions on the topic so we can come to an approach that
works for everyone.

My summary of the thread in [1] is there was a driver bug that
required a DT binding change. Krzysztof and the other involved
parties made sure the driver handles it in a backward-compatible
way (an old dtb file will still run into the bug but keep working
with new kernels), but decided that they did not need to worry
about the opposite case (running an old kernel with an updated
dtb). I noticed the compatibility break and said that I would
prefer this to be done in a way that is compatible both ways,
or at the minimum be alerted about the binding break in the
pull request, with an explanation about why this had to be done,
even when we don't think anyone is going to be affected.

What do others think about this? Should we generally assume
that breaking old kernels with new dtbs is acceptable, or should
we try to avoid it if possible, the same way we try to avoid
breaking new kernels with old dtbs? Should this be a platform
specific policy or should we try to handle all platforms the same
way?

          Arnd

[1] https://lore.kernel.org/lkml/20210130143949.aamac2724esupt7v@kozik-lap/
