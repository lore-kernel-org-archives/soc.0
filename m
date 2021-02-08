Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470B0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:44:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B7364E8F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B7364E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mJDI2hu2GX1UHAgHTZ4A9d+6gSw5ULLPJFwXhGIiPEg=; b=i3dQPUHvEkZKuA37sC6Qt2bq6
	GrDe1tYP0IDgioLtska0G954o3Zx4peYWa/LPOLTjHYu39PI3djibe3uXqdC6X29CKNVVUHPpl5S9
	3v4Bn7s8QbURKK64Yu75rbA+TJKV8Uq+IGvLRbNKXxOeJyJNXwR/C6ZRVT5jO71XeiCNEfGU4AgVI
	eRIfi37QhxHKRxySe8+VXYQKa6GD8W7IbnLApFKwf8sEkP5/VNjWZE7TV3buLHd503KwG1qYxnfne
	+KLuCcaEwF1wa2xRoIzSNg0Mz4yW1C7R7k3ja35XxJkmNnfSBfYqnS4B8t4YnFwGGo56zQ5swOip7
	AncoBKwrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BUe-00083m-Iy; Mon, 08 Feb 2021 18:42:40 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BUY-00081n-PF
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 18:42:35 +0000
Received: by mail-ed1-f41.google.com with SMTP id z22so19785812edb.9
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 10:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o0MO6kYhDlukwe2FztGhJY4JOmsuVtg2OPvSn78DT4o=;
 b=XKAkKq58FRv1MKrExTGBfjqt0oTfx87sQQba2R5aX5YG2asludpTbtwu45RG8yS3Ii
 E41O8uOiY0lpK97gW1WEDUARBkdoXg7gHdME74LEw0IGL4d1bF4qbRCd7Tf+JU76H5+u
 76mNYLtgR/2z+UOfVs8sT0o3XwCnkq25zXk3m9JltpKIxjOsCux2SRFvD0hmIXgmfMwG
 Wr/X7KmS5G0gfATNdZKy795vXBTvYkEF4lfdRivcyBZA8a20o4nTvgmOeDVzX02TBE16
 19fewkH88JdOQstt/zx9v8GZ2DzxtzHNORxOflOo43buwZX+tY7JXki4ROketY4TnrpG
 mWiQ==
X-Gm-Message-State: AOAM530tBRXxlL1ukgF8jXK3eaIkEqotzwsoNlzwHLAiQtupRTCkbmW2
 86IxrxsovKo3+ogwlJlTqZ0=
X-Google-Smtp-Source: ABdhPJxPQoDmwOFtcSLnMjYpNRs+iVkrhj4hV31wgmf6XJ1MLpWB5omO8uuafc7Bk011dYwog3NnRA==
X-Received: by 2002:a05:6402:22ce:: with SMTP id
 dm14mr13185754edb.256.1612809753077; 
 Mon, 08 Feb 2021 10:42:33 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id hy24sm8682518ejc.40.2021.02.08.10.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:42:31 -0800 (PST)
Date: Mon, 8 Feb 2021 19:42:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210208184230.onhlioflyylkx6xo@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
 <CAMuHMdWZ8QmiQCmiW9AvCpviNZeuaxThSo_4Xb2DGEs9hMTKMQ@mail.gmail.com>
 <YCGBIvRfoP0BeyrP@builder.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCGBIvRfoP0BeyrP@builder.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_134234_924297_18919BCC 
X-CRM114-Status: GOOD (  41.20  )
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
 Geert Uytterhoeven <geert@linux-m68k.org>, DTML <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208184230.uiG2zWLiAzk9KayX0tVNZi8Q-5bSoS6P80IEa_N0V2c@z>

On Mon, Feb 08, 2021 at 12:21:22PM -0600, Bjorn Andersson wrote:
> On Sat 06 Feb 13:47 CST 2021, Geert Uytterhoeven wrote:
> 
> > Hi Arnd,
> > 
> > On Sat, Feb 6, 2021 at 3:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > That said, I'm still not happy about the patch we discussed in the
> > > other email thread[1] and I'd like to handle it a little more strictly in
> > > the future, but I agree this wasn't obvious and we have been rather
> > > inconsistent about it in the past, with some platform maintainers
> > > handling it way more strictly than others.
> > >
> > > I've added the devicetree maintainers and a few other platform
> > > maintainers to Cc here, maybe they can provide some further
> > > opinions on the topic so we can come to an approach that
> > > works for everyone.
> > >
> > > My summary of the thread in [1] is there was a driver bug that
> > > required a DT binding change. Krzysztof and the other involved
> > > parties made sure the driver handles it in a backward-compatible
> > > way (an old dtb file will still run into the bug but keep working
> > > with new kernels), but decided that they did not need to worry
> > > about the opposite case (running an old kernel with an updated
> > > dtb). I noticed the compatibility break and said that I would
> > > prefer this to be done in a way that is compatible both ways,
> > > or at the minimum be alerted about the binding break in the
> > > pull request, with an explanation about why this had to be done,
> > > even when we don't think anyone is going to be affected.
> > >
> > > What do others think about this? Should we generally assume
> > > that breaking old kernels with new dtbs is acceptable, or should
> > > we try to avoid it if possible, the same way we try to avoid
> > > breaking new kernels with old dtbs? Should this be a platform
> > > specific policy or should we try to handle all platforms the same
> > > way?
> > 
> > For Renesas SoCs, we typically only consider compatibility of new
> > kernels with old DTBs, not the other way around.
> > However, most DTB updates are due to new hardware support, so using the
> > new DTB with an old kernel usually just means no newly documented
> > hardware, or new feature, is being used by the old kernel.
> > 
> 
> This is the case for the Qualcomm tree as well, it's expected that a new
> kernel should work with older DT. But, while we don't actively try to
> break it, there are plenty of examples where we don't/can't give the
> promise in the other direction.

Thanks everyone for comments.

Let me steer the discussion to original topic - it's about old kernel
and new DTB, assuming that mainline kernel bisectability is not
affected.

Flow looks like this:

0. You have existing bidings and drivers.
1. Patch changing bindings (with new compatible) and drivers gets
   accepted by maintainer.
2. Patch above (bindings+drivers) goes during merge window to v5.11-rc1.
3. Patch changing in-tree DTS to new compatible gets accepted by
   maintainer and it is sent as v5.12-rc1 material to SoC maintainers.

So again: old kernel, using old bindings, new DTB.

Another case is where out-of-tree user of bindings, e.g. FreeBSD, takes
new DTS (at point of #3 above or later) but did not take the bindings.
Such system would be broken but it's their fault - they took DTS without
taking the bindings (which were there already for one release!).

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
