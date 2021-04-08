Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D54C433B4
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:05:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DED9F6113A; Thu,  8 Apr 2021 20:05:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6D0A60FDA;
	Thu,  8 Apr 2021 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912300;
	bh=3kIIacXoQFBQy8yEj8Z2NRLgJ8azW9bsrjCf1Joem7A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JOa/NTqdU7G83fbavNfhl5BUoD+9rhqhNOMRnHnKj0KlmyV1Y2HpBXmiMjYd40uVj
	 X8zd/0OyuXlYaEtlXOiKz6TZQm8L4Gdt6bnvKu15JkXmliSUUeUGJSKXFblRZe7Dhu
	 Wh2DTZlA3F8OU7HXO44GzEsi2skgB1hZjnyLW4/4UxyWU1xciPv0T/jvvUVRX9odII
	 06XHr9oQ074CrEH3XBSgnCMJg32EWtL0CX+tcicUDXGGrFuHJY4bWyM6ppUqlRa4WS
	 ybUVuEDBM4K7wFe/quh/7lZHkZUaUSudKTA3VCzQVajk8rdZWOl7fLs3NbJgn2Zh5V
	 PUb67pqABtR8w==
Received: by mail-ot1-f52.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso3502194oti.11;
        Thu, 08 Apr 2021 13:05:00 -0700 (PDT)
X-Gm-Message-State: AOAM533mWJlwo2Dex3Fw517JsTq3Ssi1QLL4f4/27GZZ2Yhikh62yZpl
	1g+wQcRjOVEz6cBFG0uAOutuZtyw6JyR9wuY5do=
X-Google-Smtp-Source: ABdhPJyR9VAcVN1TEnQNSo+1kiW312GG1ZiLtvnYHlLiZhYuNzKfn7gEwt3o3axBkrbdG6jvGdU8YR5gyM8Y3YAg1b0=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr9533160otq.251.1617912300146;
 Thu, 08 Apr 2021 13:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de> <YG8qIfFdY+As5tye@builder.lan>
In-Reply-To: <YG8qIfFdY+As5tye@builder.lan>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 8 Apr 2021 22:04:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
Message-ID: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Jack Pham <jackp@codeaurora.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Douglas Anderson <dianders@chromium.org>, 
	Kevin Hilman <khilman@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>, 
	Sandeep Maheswaram <sanm@codeaurora.org>, Robert Foss <robert.foss@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
	Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>, Andy Gross <agross@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, satya priya <skakit@codeaurora.org>, 
	Abhishek Kumar <kuabhs@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Shawn Guo <shawn.guo@linaro.org>, 
	Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > Maybe see if you can address these in a follow-up, to avoid regressions.
> >
>
> I'm about to send you a another set of pull requests with some more
> goodies that was lingering on the list. I will take a look to see if I
> can follow up on that with some fixes for above warnings - and take
> another look at incorporating dtbs_check in my workflow.

Ok, sounds good. As I mentioned, I'm also just learning how to use
dtbs_check properly. Unfortunately, it takes ages to run on a
non-parallel build,
and using 'make -j32' as I normally do means the output gets reordered
with every run.

It's probably ok if you figure out how to only run it for the files you
actually change in the Qualcomm tree.

       Arnd
