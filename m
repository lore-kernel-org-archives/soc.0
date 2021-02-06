Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B20C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 15:08:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8D864E22
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 15:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8D864E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2HzsmuWGwUvLqHMrVWCoBz8MMP1R3Y+yXZSIEJVYrGo=; b=LoQ18yMfGyCLv/bZ8XbgwBB+i
	EUAbrJXQuzh0K7AXkW3q6hSTD7l/2LZ5veoIawYD9y2d013N+2eWpLgiqNUjtGT+e7dkQh08aeh4n
	ic6FmvPJbqCnwqHZjveUwEg19Z3EVTStXoU7a/DCLKFd7G2TdnupBbwfwL8CxOWbA/tDWTG409nqP
	3IcBxhFFSGpD4k6yIZ6P0Zga+ZUSSoQLE6CSqzyb4aiMi7KPC4jfPN7KrbzErfxSiFMu7zgaWbv7k
	kEVB6IgDa56qIQfERzMirxzSwfxHQLUqlD+KL0/oDmF1vqlLwBjB8vmAv67StxP7mW5FL+AVMWkr8
	UsLCQD9zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8PAt-0000l0-VI; Sat, 06 Feb 2021 15:07:04 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8PAr-0000kW-3U
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 15:07:02 +0000
Received: by mail-wr1-f50.google.com with SMTP id 7so11301270wrz.0
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 07:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fzMdGIncwXZccKuwFCYwYE/wDOhe7aap4KiSx77Zgp0=;
 b=g8fK7x9BFY0zWkhauP8gq+Cl66KYCgEgdC9poPcy0R2MDETWnVzp/gr3drVCRNsP2M
 Q3nNK6pzDv9/+v7ivC8EOsNM0/LFBp6Dp418YuUmrQLAiEcbSIg4BYGE/da5t16HqWZp
 GRp0gF+VW6nG+Q+E1dxvVDVEURCW+L7w3VE1sqJjuGoQWtZabD77ud5vSjzsfP7FveOj
 ikGZnUovV59PFMZ1Gd5IITz9QJycWs2hiUvRPJJ1gR9ju4muTMiG/1HkRJqJ0fRqr72T
 DhfPPonZsRcbC4jAmBNMgwHgHx8xk/S7iAs4DV1k7nYFM7zxKncV5Zca0dKucFXBZ1kf
 f3/w==
X-Gm-Message-State: AOAM5323bzXDWxZiQ012eD629DY/Y3QtQQIVU+6LRSNfPhZzcaHoffZA
 WegNKA6Q+ZMzmpAvYNRcFg2+VZBf1dQ=
X-Google-Smtp-Source: ABdhPJwbJn9PaV7uVVeptZSLdmOkDPGrrad13AK38DSA0rKn7zNGSVqVrGkydECDJ0UubdHLvPkEqQ==
X-Received: by 2002:adf:cc8e:: with SMTP id p14mr10271797wrj.270.1612624019973; 
 Sat, 06 Feb 2021 07:06:59 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
 by smtp.googlemail.com with ESMTPSA id n9sm16781833wrq.41.2021.02.06.07.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 07:06:58 -0800 (PST)
Date: Sat, 6 Feb 2021 16:06:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210206150655.nq2m4usyzg4rgvtt@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_100701_241737_0BDF1C9E 
X-CRM114-Status: GOOD (  35.76  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, arm-soc <arm@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210206150655.LqJI3AS2jgMuf9MKxbuSvVEJNM3O0ZYcyxnNldAiaVg@z>

On Sat, Feb 06, 2021 at 03:35:54PM +0100, Arnd Bergmann wrote:
> On Sat, Feb 6, 2021 at 2:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
> > >
> > > ----------------------------------------------------------------
> > > Samsung DTS ARM changes for v5.12
> > >
> > > 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
> > >    it suspend/resume cycle.
> > > 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
> > > 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
> > >    charger.
> > >
> >
> > Hi everyone,
> >
> > Any progress or new comments about this pull request?
> 
> Hi Krzysztof,
> 
> Sorry for not getting back to you on this earlier. I discussed this with
> Olof the other day and we decided to merge this, I just haven't
> gone through the pull requests over the past few days. My plan is
> to do the next round on Monday.
> 
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.

Thank you for explanation. I would love to receive kind of guidance,
best practices, guide for future patches. I will them write it down and
try to follow during my review. However it made me a sad that a patch,
adhering in my mind to all rules, was postponing the pull request.

> 
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
> 
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
> 
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

Good summary, thanks Arnd. I would like to add that the discussed change
was bringing a new compatible. It was saying: hey, this hardware so far we
treated as old one, but it's not, sorry, it is different, so here you
have a new compatible with a change in few properties as well (and new
bindings which appeared a release earlier).

Best regards,
Krzysztof


> 
>           Arnd
> 
> [1] https://lore.kernel.org/lkml/20210130143949.aamac2724esupt7v@kozik-lap/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
