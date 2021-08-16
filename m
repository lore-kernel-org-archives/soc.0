Return-Path: <SRS0=SWds=NH=chromium.org=dianders@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9B7C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 23:42:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 90B0460FC3; Mon, 16 Aug 2021 23:42:01 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6865760F35
	for <soc@kernel.org>; Mon, 16 Aug 2021 23:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6865760F35
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f52.google.com with SMTP id a21so10352030ioq.6
        for <soc@kernel.org>; Mon, 16 Aug 2021 16:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
        b=f3vWQ8hpMBdzUhxwYoB7ZXd1idjeJdSU/Lux1E2ajeWTow8CGkLMmswSwHWv88uIDV
         Z8fwbsMBs1PFxt4DmLYFdezFyRCIlheNU0LiHc0PVzYb1wtUjs1RoWhYdgpQ+WRxv7Ea
         T8uaB68h7hB4RiinpVFaW6htRwRUKytbbxlu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DEq8bFOyl5Jq/DdBh6oBU2GKmvGKeW+7mALqJjFNlg=;
        b=d3jsqhMu3+c9eenRn591idb1m/Ixi/9Hv4Y57YDkAaWOUSdsUJPgRN2GNxMth2rpXU
         yxxc+h1kj3K2qKe/Fmyp6z9uq3OMxSHmV9aS2EgczixMPXUoIu4WwMN1FUStc7p/wvdD
         P1UkbLtD9xfkNxpldvKEg+dHzb/sNsfcjLA9rVoqY1+OkmzdtdbJTF9NSropRkgwxmt0
         bxtFKs8S/w6/1sLyROaV5+gE3aJFtzfz0a+iNHxO1w2uAqgJv8GmGLjnSzT/Lann/Jxq
         nDXKZgIEnqahJZWBXqXEb/XC3FUFED8S+P7ToaJtd+85neRAI/B2VImhS/T6mhSpfCLf
         kbng==
X-Gm-Message-State: AOAM532jH3ubteYI/nGB67xpBPuLQNb6fZiVQiGn1fMS1JIzL6WafXB1
	0SMk6mU1tiOCH2O16ezZCripz6a3B0qZaw==
X-Google-Smtp-Source: ABdhPJxeGZIJiykFk9d2SuyIk+sMiIuCSHq77W0g5TIH9zQV6l7uBf2W16DjD0qe/Py46nhdqw8arA==
X-Received: by 2002:a05:6602:713:: with SMTP id f19mr657630iox.140.1629157320559;
        Mon, 16 Aug 2021 16:42:00 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id g8sm171026ild.31.2021.08.16.16.41.58
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 16:41:59 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id i13so20306152ilm.11
        for <soc@kernel.org>; Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr341747ili.187.1629157318317;
 Mon, 16 Aug 2021 16:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210816231223.586597-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210816231223.586597-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Aug 2021 16:41:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Message-ID: <CAD=FV=XHOOjVgoQsS7vMDzeov0p6groC6Qnxz_TWpFj7dh7XLQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v5.15
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: arm@kernel.org, SoC Team <soc@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andy Gross <agross@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Alex Elder <elder@linaro.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Rajendra Nayak <rnayak@codeaurora.org>, Sandeep Maheswaram <sanm@codeaurora.org>, 
	Thara Gopinath <thara.gopinath@linaro.org>, Caleb Connolly <caleb@connolly.tech>, 
	Georgi Djakov <georgi.djakov@linaro.org>, 
	Gokul Sriram Palanisamy <gokulsri@codeaurora.org>, Judy Hsiao <judyhsiao@chromium.org>, 
	Martin Botka <martin.botka@somainline.org>, Robert Marko <robimarko@gmail.com>, 
	V Sujith Kumar Reddy <vsujithk@codeaurora.org>, Baruch Siach <baruch@tkos.co.il>, 
	Felipe Balbi <felipe.balbi@microsoft.com>, Jonathan Marek <jonathan@marek.ca>, 
	Kathiravan T <kathirav@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
	Ravi Kumar Bokka <rbokka@codeaurora.org>, Robert Foss <robert.foss@linaro.org>, 
	Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>, Shaik Sajida Bhanu <sbhanu@codeaurora.org>, 
	Sibi Sankar <sibis@codeaurora.org>, Wesley Cheng <wcheng@codeaurora.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, satya priya <skakit@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Aug 16, 2021 at 4:12 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Douglas Anderson (1):
>       arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

I hope the above patch doesn't cause problems. I had landed it in the
drm-misc-next tree as per:

https://lore.kernel.org/linux-arm-msm/YMDdyEzCpdttQyNu@builder.lan/

Presumably git will magically do the right thing here since nothing
else on nearby lines is changing, but I at least wanted to point this
out in case there are any issues. Right now in linuxnext I see both
changes:

ab428819ee3f arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
ab6f24b404c9 arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip


-Doug
