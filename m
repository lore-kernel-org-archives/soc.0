Return-Path: <SRS0=lkk/=JK=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F727C433ED
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 02:36:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 538AD613AD; Tue, 13 Apr 2021 02:36:16 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB2261242
	for <soc@kernel.org>; Tue, 13 Apr 2021 02:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB2261242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f181.google.com with SMTP id c16so15606028oib.3
        for <soc@kernel.org>; Mon, 12 Apr 2021 19:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
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
        b=Yd5/OBF/oveFfsbAOzZ1nZwSW9LodJUNbVsHf27KqOWDzQtSUy/j8HjmBoxnAYRLv5
         8w+CY7YI5TdB7232SFluTReb5lG0uSxe7XNR76V+nxawqv74h7Fyhx4/VpDkJ77Go2sa
         WO6tm4MBqzP+k+7B+XaCkI11hVPIC2jNaPas3VdAm9H3CUVZuucRpwZvsT3xcIbG9RU3
         r9P4XkVcH0p9t4qUuELNlK+bn8AON42zRkrsf4POeipSw3kWFWnFCxefzebACptYk5iK
         pB6T3SxfRINkBVfz2xHg6gj9Sa6ZY5zPiZqoDqqcf0ZwJxovknM1BvztZ7mXAck/GSBE
         GVAQ==
X-Gm-Message-State: AOAM530H9Rm3jZn1I09e+5nJvVGLhtEQWZtt//eRF85fhaiZjbQbytnX
	My04edFbwzzFyEHUC13iZlrw+w==
X-Google-Smtp-Source: ABdhPJyETmo337jDHkzhWwLzvIm8y71EMibugr9rZ+9yLbbO2H2ShEbUvG4cC3VgfFHjeczqmy4Dyg==
X-Received: by 2002:aca:df44:: with SMTP id w65mr1642090oig.36.1618281375262;
        Mon, 12 Apr 2021 19:36:15 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1_YB944niA-ebk-nJx-JDBh1q7z6s-9mLGFjF2Nv9r9w@mail.gmail.com>

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
