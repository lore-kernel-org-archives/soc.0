Return-Path: <SRS0=OvlU=JK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B784C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 02:38:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF1161242
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Apr 2021 02:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF1161242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=97YIPipowGgoxYrYbbcxElxEH/XTqKqXZ/+iXJpSnrc=; b=O4Ls0/LOYJccyfd5h6NVELQfH
	w/0kQ9cjEFQg1L5UGBxdfZZRm6LqdzW3z81LG00Dvhl7cTseL2ci8WlBgWf2dw9ObOSNilX9jUgSH
	R5Piz9HQfihEpBSljwO7r26Bq26jYaCjCWu2oDQ3WSZYnDOEZqRAXaklbmrnbuGJesVTqBc2lAJFA
	UzPKmcOs+XBty+jFOoUzLWSjQrxAqGkcWdMYhCzm1RoJlWs7+poI+HQpi/0cGoPbsP9ulZznCet5x
	oPfGzxi3MynoX4DXl56tMmqLXZETFiOx0UJ0eTpUZeSrWtBjkxCbzN0a2T4AtpKdgqxT9y1QnAhKZ
	j6L0/EQGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW8uc-0086Du-TD; Tue, 13 Apr 2021 02:36:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW8ua-0086Dh-A8
 for linux-arm-kernel@desiato.infradead.org; Tue, 13 Apr 2021 02:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1W0qgFXOwcGeGkoX3BtzeUrwEFAThPyRgahxXi51edQ=; b=NfBfpjCvoi9QQcyyob1ElIZ6bO
 c9kA4dFDYv7b+2Jg2mou1hwNNAVajGhmnw58jXKcBt5RRfqb7y6FOmlJvorAALpMLN/6w6d7A2g9f
 3dRFPerlHSF2aEqRY5vTMzqRuyn5ipI5DNlTzJhYpsen/xCZWnW2tdKWfyStbLm0LSn6OnUq9yjzL
 fAAogkfUgq34nUKxq0jfvUJs1WadiZdqD1XFDQA9PB7vi9RnLUuVTyATHreiUjmAwcJ1nG8vUZQW5
 XdOEedPoynRbYS1MK20A5YtKktC5DeHTG3EZpYOM+qef/6VXqjdyXbGjAI2rEJamQHt3a5irdgOgS
 KKPG+WYg==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW8uX-006gdQ-Ep
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Apr 2021 02:36:18 +0000
Received: by mail-oi1-x22f.google.com with SMTP id k25so15595011oic.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 12 Apr 2021 19:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1W0qgFXOwcGeGkoX3BtzeUrwEFAThPyRgahxXi51edQ=;
 b=vFDPS8jGKHSnUpxbUJ06UCGO0qQ9WUhdhigkpPGZWZd+7ADtSAO0uObIBf8KwREmZT
 wpwCYXvDZkbX5ElONctoFnT4rn68sv3+TtKLadv6L5G2eQOUEIqEI6VqD/gphdf8G+rE
 HxbCgPf3xszCFVrUd82MOSCZ6B+6SzMsg3N5c/0DuoUjE577i8aOgCyBKhikCdOZF2at
 GigsGGnWDtaZOHbA7ZpRcE7dZoUs3SY4yA/oex0Q7/mVRrXisCjoFufPQy11GA4FfLfv
 Aa7vOIUVeN1nnADsppOjYVsCSrTTLnjRvZgRVhU7M5vH+Jtq5+DgxLuV2TRw5xk73SSt
 VjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1W0qgFXOwcGeGkoX3BtzeUrwEFAThPyRgahxXi51edQ=;
 b=d92HpofJFlt6fO8eaU4Haj2rAzI/ZlabfD7GqAP8/fjrUiQowETlelgiuHiGpw9DJB
 6C42cqh6CF1j0ZutUW6lsd/yTry7ztixmqGzgiXMI9sjJKe+sFPpBbvxNrQ3k5OXs92C
 YOKT5JU4Zi7Ng+5S9X19qQUyc2T8TZ7JOLgOuyVTMGmgHSLOThnXYteQpvMtgmt9DMO8
 11mQmesd/i8DdPO+aQTuoa2kAMLiYeDz+6PfxakMi+H2KPri6eOyl2qSIYWxIAuzL1SH
 bO18URolCHf2/Q+Hqaz1f66kY6Qtslqw923qkO9AhLN5RFAmjMU+vxuzRCrMllVYYcda
 l8pA==
X-Gm-Message-State: AOAM530BkpOlbKyvN+YE3Ej8J4utjlCksfSoUYCnaRDgPGsY22mavUux
 GxuXO2j0IYnNOepjw2rnb1FPUA==
X-Google-Smtp-Source: ABdhPJyETmo337jDHkzhWwLzvIm8y71EMibugr9rZ+9yLbbO2H2ShEbUvG4cC3VgfFHjeczqmy4Dyg==
X-Received: by 2002:aca:df44:: with SMTP id w65mr1642090oig.36.1618281375262; 
 Mon, 12 Apr 2021 19:36:15 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 128sm2551521oog.37.2021.04.12.19.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 19:36:14 -0700 (PDT)
Date: Mon, 12 Apr 2021 21:36:12 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 SoC Team <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <20210413023612.GH1538589@yoga>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
 <20210412160116.GA904837@yoga>
 <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_193617_519089_772C4358 
X-CRM114-Status: GOOD (  27.58  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210413023612.kwfiAXJDZPDfa9DiD8cBshlOpRmdxNJFbC61Q-DXN8c@z>

On Mon 12 Apr 13:52 CDT 2021, Arnd Bergmann wrote:

> On Mon, Apr 12, 2021 at 6:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:
> > > On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > So the same binding patch is picked up both in the driver and soc tree?
> > I was expecting that to cause (harmless) conflicts when things arrive in
> > Linus' merge queue?
> >
> > Or are you saying people go the length to create immutable branches for
> > each binding?
> 
> I think it's usually one immutable branch for all the bindings of a given
> merge window. This avoids the merge conflicts, and you can add further
> bindings on the same branch before sending it off to the soc tree.
> 

That would be convenient to have, but the binding changes we depend on
in a given window (in particular if dtbs_check is expected to pass) is
scattered over a wide range of maintainer trees.

> > I'm curious because it's fairly often that we introduce clocks,
> > interconnects etc where the macros from the dt bindings includes aren't
> > available for another release (so we use numerical constants and then go
> > back and fix them up later).
> 
> Ah right, it is particularly bad for platforms that don't have a regular
> layout in these blocks and need to define a new constant every time
> another clock/reset/pin/... is discovered in the downstream sources.
> 

Even blocks following some standardized layout has this problem, because
each platform will have it's own (often similar) set of
clocks/resets/pins.

And going back to dtbs_check, you will continue to see the warnings
about missing compatibles, because most of the case they won't end up in
the soc tree.

> I was mainly referring to the simpler problem of defining a binding
> document for a device once, and then merging the nodes.
> 

I'm sure we all love the hardware that's simple to translate to a DT
binding, unfortunately though we're dealing with complex SoCs.

Regards,
Bjorn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
