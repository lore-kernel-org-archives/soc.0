Return-Path: <SRS0=1Od/=JF=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92448C43460
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 21:53:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6612F61178; Thu,  8 Apr 2021 21:53:24 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2511E61157
	for <soc@kernel.org>; Thu,  8 Apr 2021 21:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2511E61157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-qt1-f175.google.com with SMTP id i19so2685694qtv.7
        for <soc@kernel.org>; Thu, 08 Apr 2021 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
        b=vaG2KBh189d7TZmUuvPHgxCJvrL7amxUPUc71iQ/utCzeDOi1HhJnVZZ1eT4/aKxQq
         LcDpwKA/93MWV5MLbATVwcP9LygPP3KGNBj5JkRSvfCvqDpOQK9YnLIkrv4EkYlecESb
         8eVkj882/feUO1nOujrywbsC+RxU5IGYfzzQOKNgf1YhjYSLBtN8ahzLXmhb2ib4s/G+
         iz8LSf+gJeD92JDc1U0cSgXROYw7dx170PtdpH0hidMSm6GzWkzFa3h8U/9PmhE/M7Mr
         bkcAGXSejjfmyxLMa9Y/9qBdrpLrOb03V+MzLUeyaouqBnRPsp/obm1EpL67KKT6/99M
         /vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
        b=C/TQyBpQaIIt/PukVLZgJk+b0uwRbgv/8Azw6Z7RLd+q9u16W0/7Eyck3ZBsKXgGxJ
         UC3vgeyQ8LPsfddAZkRKoAHec54ZiWJet7TLQf73HL+U6Dw4m7fL9RlpEMUZ/pn2CcQZ
         L5vV5iBaTGYvg2t2wtR27E/XR9PYevc0xaxBsCOz3z0tvGXQD2DyjBMNo4SbRoD7JBf2
         7YdEZBxT2YXvHyKsp1AFrTPxaiN9FP17Dvg5OsNdrdQHURsnKykBR9M7CyYv2zi4cbwc
         E3iVaixYKb5F2uzQQPt+EA/GgdAw81KtYgPWXZUnYJ0K74A9zvvWhV8bpPsncZZ2JBYj
         7ePg==
X-Gm-Message-State: AOAM532IjfeQTQNrDK8WZKlsT9AfgqFmGvHh7Nglo9Po7l3EWsWVe1ac
	pf3zaFSE+YVNOL9keIQT2Z+4RwyasxF1NAGGEn37ow==
X-Google-Smtp-Source: ABdhPJwazj9FWuSPV9bHxG8ukv+3bBFs/5s4EePYj0/79a4vdUFo+2UxV8RU8gK+M9NIUTF1Ek/hqPP1sKhPeo53OuM=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr9398597qta.135.1617918803348;
 Thu, 08 Apr 2021 14:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de> <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
In-Reply-To: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Apr 2021 00:53:12 +0300
Message-ID: <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
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

On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > >
> >
> > I'm about to send you a another set of pull requests with some more
> > goodies that was lingering on the list. I will take a look to see if I
> > can follow up on that with some fixes for above warnings - and take
> > another look at incorporating dtbs_check in my workflow.
>
> Ok, sounds good. As I mentioned, I'm also just learning how to use
> dtbs_check properly. Unfortunately, it takes ages to run on a
> non-parallel build,
> and using 'make -j32' as I normally do means the output gets reordered
> with every run.
>
> It's probably ok if you figure out how to only run it for the files you
> actually change in the Qualcomm tree.

Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
less painful.

-- 
With best wishes
Dmitry
