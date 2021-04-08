Return-Path: <SRS0=1Od/=JF=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CA9C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 23:41:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7BE1961168; Thu,  8 Apr 2021 23:41:50 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4057161132
	for <soc@kernel.org>; Thu,  8 Apr 2021 23:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4057161132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-qk1-f179.google.com with SMTP id c3so4169717qkc.5
        for <soc@kernel.org>; Thu, 08 Apr 2021 16:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
        b=yHH1TguXIOLaBlQty2FkN1++Ql1LbpqyhCP/Bi9XQjCI+iCfX3544SZzo5Y7gLXcrB
         c3vqh34BZjV/GX060haL1oSrlETmiX2GKL4Hc2D+QH2W7CTmlQuW06kq8qaVXqa3O+Ba
         pYybh9dAQ//7dOoGPTLu//LBK0EntAPRBYR4TLyK2RFNRHKJUVYs3r8MG5f4IwzI31vS
         WPlUBkat9NZq6QOv4mvJDKzSdfg7PV8sG1HwkXKR6Pa6TeNMlsplEoZLwPqcZWNYDYKP
         lmZdS6usMKm8ISMpRX0aWzPtDxGcV+oWwI54ScYD6OcXFo8KBfrQ09Mvey00ZhcR93nV
         myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KRUudqQ7fiqiTO1h1nhjXIsFEoc1XK+L2rdZ1uxSAg=;
        b=J4Ajo21JW/R8+syko6d28U9X3ZB6D0yZTQ4XjjLAzIRwBCmghpTgLRFDfADaePcFCs
         F72cP4B0ZC/OqHoTb6K7V4wAv2lJMhI0rIZyWYLLPL/emMSGReL88x4Iw/FlF6ShZX5R
         1Gd7f3cc4V8fVIQMenejcwftj1mu1xxhawZylhB9gBg9FB+XtfczCpASIy+Nkl5dfSJ5
         P7JyqzaJ/WWSTyjtMvhreRwBeqTi6ZCbjpAF+Cb7EeK0I3CU9yDYS2LVd7/o85kAbLBR
         8onjFWX7vP269sAZgRYewOkaGZE7IRHd65ZnFR0EU4Dfh5iFx42dqJbT8kufGjeLLiXH
         TYSg==
X-Gm-Message-State: AOAM5314rUMlqqW+Lmjua0DrvlA7/ky1qy+l6iFzW7HSh/EIjtocpWdC
	kSoW0209E7GA9gFiSblr+voQRzmmC8g1fuQtULY/LHjhu7XbOw==
X-Google-Smtp-Source: ABdhPJyHPuE4navRPOijhLZmY/RoeCxFazCLQbKT5I8ozqsoCzXvOiMSY+ipZbh1hlP3lOdy4M8E0I0XN9PPmb1zcMM=
X-Received: by 2002:ae9:f312:: with SMTP id p18mr11406022qkg.162.1617925309436;
 Thu, 08 Apr 2021 16:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de> <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
 <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com> <20210408230522.GS904837@yoga>
In-Reply-To: <20210408230522.GS904837@yoga>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Apr 2021 02:41:38 +0300
Message-ID: <CAA8EJprO7jwqaKXXk70hzDJnTU6iX6i2Vk1OxkrwDKFFQQSyEw@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Jack Pham <jackp@codeaurora.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>, 
	Sandeep Maheswaram <sanm@codeaurora.org>, Robert Foss <robert.foss@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>, Andy Gross <agross@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, satya priya <skakit@codeaurora.org>, 
	Abhishek Kumar <kuabhs@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Shawn Guo <shawn.guo@linaro.org>, 
	Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Apr 2021 at 02:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Thu 08 Apr 16:53 CDT 2021, Dmitry Baryshkov wrote:
>
> > On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > > > >
> > > >
> > > > I'm about to send you a another set of pull requests with some more
> > > > goodies that was lingering on the list. I will take a look to see if I
> > > > can follow up on that with some fixes for above warnings - and take
> > > > another look at incorporating dtbs_check in my workflow.
> > >
> > > Ok, sounds good. As I mentioned, I'm also just learning how to use
> > > dtbs_check properly. Unfortunately, it takes ages to run on a
> > > non-parallel build,
> > > and using 'make -j32' as I normally do means the output gets reordered
> > > with every run.
> > >
> > > It's probably ok if you figure out how to only run it for the files you
> > > actually change in the Qualcomm tree.
> >
> > Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
> > less painful.
> >
>
> Yes, this is a trick I'm applying as well.
>
> It would however be nice if one didn't have to disable CONFIG_ARCH_* to
> achieve this, or even better if one could run dtbs_check on a single
> .dtb. In particular since many of the warnings are resolved by fixing
> the bindings, which causes dtbs_check to recheck all files.

As a quick hack: add the following rule to the top-level Makefile:

%.dt.yaml: include/config/kernel.release scripts_dtc
        $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
Documentation/devicetree/bindings/processed-schema.json
        $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y

Now you can run checks for a single device tree by running 'make
ARCH=arm64 ...... sdm845-db845.dy.yaml'

I don't know if it's worth including this into the upstream source tree.

-- 
With best wishes
Dmitry
