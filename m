Return-Path: <SRS0=0nBm=HI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F5C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 14:37:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDF564EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Feb 2021 14:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDF564EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xH1Tr2tNcMQll95ZAR75Ljcnuss0FVjaM2aMP1VwitM=; b=a4JCOfIjPAifuG4zVs/3orZJY
	Jla8diK5eG5nB3UKMIHIAHggfhlgXIoPvC5iW9Sfygxd5S1lgy8fyNOGFAd5W2opblZUHfn1q1vsc
	n1ncz/OJ5GXn9WwpHvmFtncdJEf0BrgpqnJrBCJM7b3R3Ezkmi1byftrAMuYdkJMs6wjE7dc/b1Vp
	bVlroJWCqOsjgeb2BwJ17BrBAwMd76mUBcrQUSxbQJYnp0jLlv4n27r8/ZMta9e100Kqo50A95TBB
	hLivYX+FOJI6fKEBqimx7ngw1QvUw52m4Mhxz2+1SJSaFoRorA3ngMGjH1fzYA1676rbrk8igxsdB
	+EnvozmwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8Oh5-00077d-C2; Sat, 06 Feb 2021 14:36:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Oh3-00076c-4R
 for linux-arm-kernel@lists.infradead.org; Sat, 06 Feb 2021 14:36:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2C5164EDE
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oo1-f47.google.com with SMTP id x23so2386491oop.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 06 Feb 2021 06:36:11 -0800 (PST)
X-Gm-Message-State: AOAM531O8d3f9Tt+0pCO+ZdF02e8rJqhB290pvj0F1VH8PfjtX+fCNX5
 UO+QVyxfuTLmR7tmTMjMq6xdJB0YjkuXKiVRqno=
X-Google-Smtp-Source: ABdhPJxxCy2jd7gz66P/CXSyGGBOIFvPAtOXshwBn+zKLK6bFg+1Wb2tqBL8PPdtihQL2pqEJLuoug29AsgqxDAYPpc=
X-Received: by 2002:a4a:bb01:: with SMTP id f1mr7146859oop.66.1612622170813;
 Sat, 06 Feb 2021 06:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
In-Reply-To: <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 6 Feb 2021 15:35:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Message-ID: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_093613_300195_F7D975D5 
X-CRM114-Status: GOOD (  25.23  )
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
Message-ID: <20210206143554.NzqQ9BZlEG_e-i6vNeTif2Y0GAQJKu_jSOvzlP6uoA8@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
