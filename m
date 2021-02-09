Return-Path: <SRS0=hahe=HL=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5287EC433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:26:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1E9AE64E4B; Tue,  9 Feb 2021 23:26:27 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E43B464E50
	for <soc@kernel.org>; Tue,  9 Feb 2021 23:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E43B464E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f51.google.com with SMTP id k10so150943otl.2
        for <soc@kernel.org>; Tue, 09 Feb 2021 15:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
        b=q91+zAClRM7pyaCnLFx3MyKyH7OSxHVCSJpb77hP1+0SiR/fqGac79HrjLCaptgY6+
         Lf27lzi31zn+AJXdqJYupbclg/9XBIdSU0quV1yfIw1kKidFcATuGNt50YwFLkCR9Sxe
         BTaX1H7MWwVwg71ebPrwXplIv0VvsW1NztckZJign/UjFLsLvxZ0ylNHYQKApzED5RkY
         bCCm+LpNvgdzyq3tECg/zZJzC9K6y8se77udepdOroQ5Efyhi2WTrLtJaocE2nQtKnsv
         zQITzIU3rPEiEOva3hZ4M8wNFLh/qxx2K8hEDQqKsmZBK91un4Xxpr/0TzXFIswzAfAl
         lK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IwjXZ3dkAIZUownYRrDsDZnRxOFipZhcPjf1znpQlRU=;
        b=nYHpk6RdBgqeww+ZeUmydyVPaRbYdTQ57yyyL+EjtJhrrrEnkA4UA4BOYA8Aj1pL5n
         9boPWgh0VUq6g6YA5KiaqETHRIZeiF9U1NYgU0zvsDZxWMgZ7OLfeyjj04W3dr0MrzXc
         qettNhxqlpkoAtAj4J8kanL6l0nTFnHKAUCUhUZx7hhSlEYFzoroJb/kPp4OlInKj30w
         2tjFfsQz2sRBIyA33Q5OKTtua+rGux4AxDy2yK5X+YMgKYyi+t5DK+ejVP4OwStJXMfv
         xuZDEXEwIrRPMb2LGPSqZUTvRaVQPygBB5sBbMUpnjHVSGrqYT6NdCWauQ+VpOBmPOU3
         qEyw==
X-Gm-Message-State: AOAM533dZKrjxWdWuyl+Gn1k/HbODyeb/8o/mXsfvmmRmLQmX2cPL/Y8
	Atsh8L7Q9HhHtS+22bSZakuBOw==
X-Google-Smtp-Source: ABdhPJwUBm3MgKUTm/uqt3L5ze0JESuAsqG9gWJMpqLjxyJ5YKUQ/ezM6jHaJ8b0gtPMlK1L69wtlA==
X-Received: by 2002:a05:6830:2106:: with SMTP id i6mr62990otc.260.1612913186087;
        Tue, 09 Feb 2021 15:26:26 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y65sm50603oie.50.2021.02.09.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 15:26:25 -0800 (PST)
Date: Tue, 9 Feb 2021 17:26:23 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Andy Gross <agross@kernel.org>,
	Robert Foss <robert.foss@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Gustave Monce <gustave.monce@outlook.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Akhil P Oommen <akhilpo@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, Danny Lin <danny@kdrag0n.dev>,
	"J . R . Divya Antony" <d.antony.jr@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Steev Klimaszewski <steev@kali.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Vinod Koul <vkoul@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Eric Biggers <ebiggers@google.com>, linux-arm-msm@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	Caleb Connolly <caleb@connolly.tech>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.12
Message-ID: <YCMaH1pYhU2VH8wp@builder.lan>
References: <20210204052043.388621-1-bjorn.andersson@linaro.org>
 <161291108058.974605.13581246808545504549.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161291108058.974605.13581246808545504549.b4-ty@arndb.de>

On Tue 09 Feb 17:06 CST 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Wed, 3 Feb 2021 23:20:43 -0600, Bjorn Andersson wrote:
> > The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> > 
> >   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.12
> > 
> > [...]
> 
> Merged into arm/dt, thanks!
> 
> I noticed that this came fairly late in the cycle and has a fairly
> large amount of changes in it. It would be nice if you could try
> to send some of the DT contents a little earlier in the future to
> avoid risking them to miss out.
> 

Yeah, sorry about it showing up late.

I'm trying to balance it because I do feel frustration from the
contributors that the Qualcomm branches are "locked down" for 4-5 weeks
per cycle.

> It could also help to split up the largest branches to make them a
> little smaller, e.g. by having one branch just for new SoC and/or
> new board support, and another branch for changes to existing machines.
> 

It's fairly common that things such as PMICs are reused between new and
old platforms, so I fear that such a split will cause unnecessary
conflicts between my trees.

Perhaps I should just send multiple pull requests throughout the cycle?

Regards,
Bjorn
