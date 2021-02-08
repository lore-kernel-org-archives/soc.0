Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3E1C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:22:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DF864E84
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DF864E84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3cpNgOA0nsj6SfYy6YM4jTnhS5I+XoTxfZleUdKv4nY=; b=A3eR01SmrszdvzQphYSS2l1lT
	sMNT8oJjqdwdPo/LY5mLaTLiDtbC5jtzEuUEExSKPyUFfCUObxET3kUsbIVi1UAWalrG0YDZmcDlK
	LRSXqoQZvzmUZA5NXZqInW3lqCEOZ/Sp5rLqACB3u+IeIzUXc+Cq9BKcLekfLigac95QM9j2j3Egj
	upoPsd01+iEfneMwJ9OYDenykf45mw5HtlMQmtcjJvSiUUzMQtz3iDOBR1nCcktA4vMfoY6TGw+wE
	2bXZMy7Y8sm51ydZi4Rk/qgMPt1wt/9zjS6238OF/II/Ym9BTWO4yvWqT0AllvmIR09v7pG+koI6f
	AcEz2H/Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BAA-00054e-AK; Mon, 08 Feb 2021 18:21:30 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BA7-000543-Bt
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 18:21:29 +0000
Received: by mail-oi1-x236.google.com with SMTP id h6so16620165oie.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/6qzm5KZjVpY/QzjBwjI8Vq6UfMUyCiZgQDTe4g04Js=;
 b=bxtDkLUWrKlJbPvM+jLfS8mCKCZwiI+jYVHmSbVHEdnMKKDWCwbDMx1u4JoCotMd86
 jpuHSVKLSdvYumtDRShyyRZWBOz6z1cwykOVpK90620JyQF79VJvkofMNFqpManNxZgK
 Ahm5BbXg9l8iodZB4CVJrKOEOct471xOuycq1+AMk7eywGux9yzCV47I2NLgn/HZKsA5
 Sy7fyEHXNhuJ/CE8ZxFso48MhgXsCdXqseuYphZGyOxMJ2ZSYXdt/j/v914THaZ7hNZY
 ywfaUDikqO1A3vCqtSn1xr0qTN1DunOOYGtqk90yICZeJ3xg/Bq2w6K+racW4OerdImi
 APlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/6qzm5KZjVpY/QzjBwjI8Vq6UfMUyCiZgQDTe4g04Js=;
 b=gGQ+Y90HADqbqK74Aq9qW+5jXMmZYGzKoMCMc38lLYLiTsgDKUqa7UNl9MkO1uqL6a
 gBVLgquldLKRiEHpEOVybLdw494Gyn9UA6ewUlmqnA9DSIW4rTkyGQrn+TgE4A48nMTV
 U7paJCdFYoEjCydSs9G+1LbXrPoD19h9gSLYnLQldeRDuTzhIVP/Qq92K/dPDEn726IG
 rJ+VF/dVI5HdspO79rbKYiNK8rF5pxQhjnLkYief1JZE+qnQjSjueFbsVSBvM5q3TfjT
 qoJl51AEM8UzsPceuU9XNNx/KtjUiu0NcZWJjt+hSVConka0piAmpoKwD8dLgxsmcekG
 ZG4g==
X-Gm-Message-State: AOAM531C/xzzBbj2Iqo8JO3A9DZUCpcS/PxpeKF7ZNo1NCBBL0e5aEU9
 DJnDrurj9A0YGYLvJ8sFOLc29Q==
X-Google-Smtp-Source: ABdhPJzFxujF8FdJ9rDgJh66bsfw8Jea1OwoyzKak4GDomOyVWtD7WQiDcq3QdmAsvzxsDQBvxe4Qg==
X-Received: by 2002:aca:7541:: with SMTP id q62mr15579oic.143.1612808485225;
 Mon, 08 Feb 2021 10:21:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t2sm3937004otj.47.2021.02.08.10.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:21:24 -0800 (PST)
Date: Mon, 8 Feb 2021 12:21:22 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <YCGBIvRfoP0BeyrP@builder.lan>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_132127_792478_2D3B4585 
X-CRM114-Status: GOOD (  36.31  )
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
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208182122.y_AxWkVIv297NA5LZMrkuKTgSwKSTLejW2BC_5YJmjQ@z>

On Sat 06 Feb 13:47 CST 2021, Geert Uytterhoeven wrote:

> Hi Arnd,
> 
> On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > That said, I'm still not happy about the patch we discussed in the
> > other email thread[1] and I'd like to handle it a little more strictly in
> > the future, but I agree this wasn't obvious and we have been rather
> > inconsistent about it in the past, with some platform maintainers
> > handling it way more strictly than others.
> >
> > I've added the devicetree maintainers and a few other platform
> > maintainers to Cc here, maybe they can provide some further
> > opinions on the topic so we can come to an approach that
> > works for everyone.
> >
> > My summary of the thread in [1] is there was a driver bug that
> > required a DT binding change. Krzysztof and the other involved
> > parties made sure the driver handles it in a backward-compatible
> > way (an old dtb file will still run into the bug but keep working
> > with new kernels), but decided that they did not need to worry
> > about the opposite case (running an old kernel with an updated
> > dtb). I noticed the compatibility break and said that I would
> > prefer this to be done in a way that is compatible both ways,
> > or at the minimum be alerted about the binding break in the
> > pull request, with an explanation about why this had to be done,
> > even when we don't think anyone is going to be affected.
> >
> > What do others think about this? Should we generally assume
> > that breaking old kernels with new dtbs is acceptable, or should
> > we try to avoid it if possible, the same way we try to avoid
> > breaking new kernels with old dtbs? Should this be a platform
> > specific policy or should we try to handle all platforms the same
> > way?
> 
> For Renesas SoCs, we typically only consider compatibility of new
> kernels with old DTBs, not the other way around.
> However, most DTB updates are due to new hardware support, so using the
> new DTB with an old kernel usually just means no newly documented
> hardware, or new feature, is being used by the old kernel.
> 

This is the case for the Qualcomm tree as well, it's expected that a new
kernel should work with older DT. But, while we don't actively try to
break it, there are plenty of examples where we don't/can't give the
promise in the other direction.

These examples ranges from advancements in power management
(implementation and binding) to DT validation forcing deprecation and
adoption of new bindings.

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
