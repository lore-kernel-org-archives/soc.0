Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E57C433ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 12 Apr 2021 16:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42A056128C
	for <linux-devicetree@archiver.kernel.org>; Mon, 12 Apr 2021 16:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243042AbhDLQBk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 12 Apr 2021 12:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242868AbhDLQBj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 12 Apr 2021 12:01:39 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07FFC061574
        for <devicetree@vger.kernel.org>; Mon, 12 Apr 2021 09:01:19 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id t17-20020a9d77510000b0290287a5143b41so2030341otl.11
        for <devicetree@vger.kernel.org>; Mon, 12 Apr 2021 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5CtEYzn7kIwgucylcxTz9N8ey3nUOdntfUbQ88bxuCE=;
        b=f+N61ZZEKv3sMaFIhuG/mjI1//fMUJZYO6yOBVZ7MxDa5r9bneo8QNZeQfgypRXxbP
         wtlu0EOAlLpFfy/BCPC+mA4AqQCbsc6Y0Zl5kQi0SXblVNBu2tXIw2LnuHYj/aFeu1N3
         +ki+1g/DMJfJJuskmsATMHwApEASlmvK14N05xaldnD6YzT6nvcM3nOLWOKdy5dOVCgR
         weqmJs6fUcUh46L712+j+AjrwdAU4oEJ9bYTF0C/WKUN0nj4/nnL2qRASYugOlljNA7l
         3h1YcRSZ0eXcR0su+rxeWTFzIQzS84j17GFIidQvOCx6J6+QfVUKBBpsvf2XZ8/NvsNy
         ngXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5CtEYzn7kIwgucylcxTz9N8ey3nUOdntfUbQ88bxuCE=;
        b=btgqM2ug5VeKdWp+LBS8FKx0zTt4/B1eh1LKLXXj5XjXXqLWk59BV353X7iq1N1b1Q
         YkHNUD09doE1nt0ZwzGLNF14+40ea7CF+w84ODVXSiMPr8lXJud7g/yDY9hVeHDNmvjw
         yNc1q3X/jSC5COYQ/1wtW48wGF9HKcNi+hMOIZTL4Qcw0P/2yy20P/IDpAI0MKLPZea+
         YV3VYVlA9sP49bBTjXRAiPch0gZLI2+k1CHVhfKTZnX+PYCBUAnThpcbpuFwQISll9lt
         qDAuSgT88ZvNdzcWFqNnwJ3OXYRfdqyaCk0Bt6k79+UQc4tf7j6wZ9nrthllAvQFSWax
         Rduw==
X-Gm-Message-State: AOAM5320NhUJeTFPhvN22MOx6JrjaA5lqiRPenW1Esbxh3WiK7V+5rc4
        LYVP/me+qN1lTVrFOOY4JsmgtA==
X-Google-Smtp-Source: ABdhPJwS38KMUVg12cbP/tOlpohlU/ohYYS3v7TQUu9ZHOsy/jn9DdfMfY39UoC8kf+BB65AOqhl0A==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr24903296otj.351.1618243278839;
        Mon, 12 Apr 2021 09:01:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f8sm2730348otp.71.2021.04.12.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 09:01:18 -0700 (PDT)
Date:   Mon, 12 Apr 2021 11:01:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        SoC Team <soc@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: New 'make dtbs_check W=1' warnings
Message-ID: <20210412160116.GA904837@yoga>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
 <CAMuHMdWY0aGoAw6QfF5PQRFNFwAzNP9cmFCjbKnsSbHsMz45fQ@mail.gmail.com>
 <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3EaaTGvAYvffbf7AF-iaC05yMShdnTc2QMcKQGZv7N8Q@mail.gmail.com>
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 12 Apr 08:14 CDT 2021, Arnd Bergmann wrote:

> On Mon, Apr 12, 2021 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Apr 8, 2021 at 5:08 PM Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > >
> > > For this merge window, I don't think any of them are show-stoppers (Rob, let me
> > > know if you disagree), but in the long run we may want to gradually enforce
> > > a rule about not merging changes that introduce any new warnings, in order to
> > > have a chance of cleaning up the existing ones.
> >
> > This may not be as simple as it sounds, as DT binding updates typically
> > follow a different path than DTS(i) updates.  DT bindings updates may be
> > picked up by a subsystem maintainer, by Rob, or by the platform
> > maintainer.
> 
> I checked out the bindings from linux-next, which seems to have covered
> most of these. Sometimes it pays off to be lazy and merge them after
> everyone else.
> 
> > For trivial updates (e.g. adding a compatible value, and sometimes
> > extending a limit), a DTS(i) update may be accepted by the platform
> > maintainer before the corresponding DT binding update.  The latter may
> > even be merged one or more kernel revisions later, especially when
> > involving subsystems that are not traditionally rooted into platforms
> > using DT.
> >
> > Of course we could mention any expected warning regressions in our pull
> > requests for soc.
> 
> Right, that would certainly help. Some maintainers send all binding
> updates both to the driver maintainers and to the soc tree, along
> with the other changes that only go into one tree. That is of course
> also more work on your side, but it solves the problem entirely.
> 

So the same binding patch is picked up both in the driver and soc tree?
I was expecting that to cause (harmless) conflicts when things arrive in
Linus' merge queue?

Or are you saying people go the length to create immutable branches for
each binding?


I'm curious because it's fairly often that we introduce clocks,
interconnects etc where the macros from the dt bindings includes aren't
available for another release (so we use numerical constants and then go
back and fix them up later).

Regards,
Bjorn

> > > renesas/r8a774a1-beacon-rzg2m-kit.dt.yaml: csi2@feaa0000: ports:
> > > 'port@0' is a required property
> >
> > [...]
> >
> > I've replied to these as a response to your PR reply, see
> > https://lore.kernel.org/linux-renesas-soc/CAMuHMdWHLnXgBSjP7VKUdx-YNr9rSKFkE5Ge5q_tarU6HP9Lhw@mail.gmail.com/
> 
> Ok, thanks.
> 
>       Arnd
