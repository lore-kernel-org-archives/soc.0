Return-Path: <SRS0=KYts=JF=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C11C43460
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 23:05:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EB5CE611B0; Thu,  8 Apr 2021 23:05:29 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1ED461159
	for <soc@kernel.org>; Thu,  8 Apr 2021 23:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1ED461159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oo1-f47.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so901666ooe.9
        for <soc@kernel.org>; Thu, 08 Apr 2021 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fIJgPmsymRSbpAq065huLv5F9qsBv+0+1g6TYUpN05I=;
        b=jVGst8yP+aXkUmXUvTfLCylBlxO5+0c1cLYJz8HXDAMObgH+8PeUFm6p/kkIO2pZI8
         FGGcsAgojuRqkVmpgTUh8kxaSTvcorn9xjwQQogdWJgiIE9mJu9M7uEjYNTFxgSbNtOJ
         yAo8zuZmAQ4n6Gm34vqYTZRRyoDjN40TLF1YD0SZ40uGqb1APBGDGqXexISpEwyQrhNo
         hsorUmXOixtOdON0WoNKPYLIX0zG2bXpLsI/OKT3KqZUCLU7ZCcS8SvW18/0YpUZCRsc
         Oxw4fuWJSrabcK1yINRXoBNiqQ00zTmBKzvl/LPpvxbWZ1lHmwjM2lj5XWUtbiXnNmIc
         V4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fIJgPmsymRSbpAq065huLv5F9qsBv+0+1g6TYUpN05I=;
        b=rxbMiTwerJMYzFJsN5AUfCspPk/drJgmf+Dg6gXbEIXaBvkfPH6beoJaCQ5+/vWuQW
         rIQCyhphSZ491KU8FjCaDuUqUEhYSrZe7jv5NdtrLupadVviQ1kruC1inVsiN6WrHOhz
         /5ZAW15Mz7OMQlPGZGQhMG38bl+kI9YS26HC5S4UVRVNuDbeEF3g5Y7GdSJ8OOQ46dmc
         Gv0EWhKskkeLNiVq9lWW41P7bWJ7btXDZlSHsLDvHxpZIdubDMrDTbbEUMl7BnJ4stwZ
         nCsmebpsPNsiKGAMz50FTmzm+L6YJ8OjxkCQ7vsFgNnjx9B8pkYiDBTzVfFT9tcZ0YII
         Bckw==
X-Gm-Message-State: AOAM5301jEGyuAkWefM+JSwCdDhSIac/xMZNLX7ZGJMkSt/cWhpdFY8x
	JJNRD0xKL5wIwb4Os5vt7Zsbxw==
X-Google-Smtp-Source: ABdhPJxRzyAgaAYEq32zzNis2OIL568aSsy9PaGGntU7HxN3A33+OInIy5jLCmOjuHtchT30o8XzHQ==
X-Received: by 2002:a4a:8247:: with SMTP id t7mr9504066oog.53.1617923128816;
        Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x3sm195405oif.22.2021.04.08.16.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
Date: Thu, 8 Apr 2021 18:05:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Jack Pham <jackp@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Sandeep Maheswaram <sanm@codeaurora.org>,
	Robert Foss <robert.foss@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	satya priya <skakit@codeaurora.org>,
	Abhishek Kumar <kuabhs@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
Message-ID: <20210408230522.GS904837@yoga>
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
 <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
 <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>

On Thu 08 Apr 16:53 CDT 2021, Dmitry Baryshkov wrote:

> On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > > >
> > >
> > > I'm about to send you a another set of pull requests with some more
> > > goodies that was lingering on the list. I will take a look to see if I
> > > can follow up on that with some fixes for above warnings - and take
> > > another look at incorporating dtbs_check in my workflow.
> >
> > Ok, sounds good. As I mentioned, I'm also just learning how to use
> > dtbs_check properly. Unfortunately, it takes ages to run on a
> > non-parallel build,
> > and using 'make -j32' as I normally do means the output gets reordered
> > with every run.
> >
> > It's probably ok if you figure out how to only run it for the files you
> > actually change in the Qualcomm tree.
> 
> Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
> less painful.
> 

Yes, this is a trick I'm applying as well.

It would however be nice if one didn't have to disable CONFIG_ARCH_* to
achieve this, or even better if one could run dtbs_check on a single
.dtb. In particular since many of the warnings are resolved by fixing
the bindings, which causes dtbs_check to recheck all files.

Regards,
Bjorn
