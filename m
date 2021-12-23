Return-Path: <SRS0=hZ9M=RI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C4C433F5
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 15:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3459C36AE9; Thu, 23 Dec 2021 15:44:05 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F298C36AE5
	for <soc@kernel.org>; Thu, 23 Dec 2021 15:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F298C36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f178.google.com with SMTP id j124so9442126oih.12
        for <soc@kernel.org>; Thu, 23 Dec 2021 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1fwwSdyPDmJrjBqvgfhWwK5/B7Z6WVD41tKc+tzuI9Y=;
        b=dfU8NCEFlprLJHJEnCF6GvLWjBULr43g9OU81r0AUa9LnF5soLHnnoLtxdr8XONYSH
         C/RYV2mnCnBOKX8CGIb8QuE7kZx6jLyD1YV1fLS2L7aFzCwbD69oB0U7aIgcbXNpP46I
         +ReOE0AdcG8IMWnbJoVE0QUaHbaG65dY5qafFidaGCrazhXNSQXMYzbkBeDevFlbxlMV
         I6Vg4tviMMWeEtxI36zdQYyr3mRxOOLd8Pvjzq+DJojdMdV6ZRxczrDmxcP4gA2TtvFF
         RwfstC2ObrYklB59q0m2SSrlZsecOtXx93uleV3cIvJJBeosm+c2kG3epevi6hfc69SJ
         US8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1fwwSdyPDmJrjBqvgfhWwK5/B7Z6WVD41tKc+tzuI9Y=;
        b=Yj0NDuxP50vwzzQJl47O71f8Qxt1/y0cfgGk3fuHboGI95wfC7xrFNtPJ4baPr2YUS
         saA8RkeGXl7whs1is+YAcBG25Ldi3myLbUr/d0CXq+ucFiNzrDGuH/B+AVDGbjJBgiHG
         OAgj3S+3vxsq7mj8MmT7nHerqwmbz6UQb9UoiBlKiNJU18IbIGmNCe6HoEHEsIx+/KOW
         despPt9rbm/LzZnUF34q37nPgmL4SpGLX1MbOuVGqyeC+RfwtEl42ZtP+Hc/VKVDk8UF
         NSSOQAViKDwQmLHAvKYytmUxh2Zb+AAE7NBMFhcPmyxpxOqlpwNIBPcct3COzlfH8jBp
         3lwg==
X-Gm-Message-State: AOAM532y6G+SwWDoRTp4uubblIegvsvw5P9hEf8cJ/U5xQ14DTVcNVb4
	IKHaA8X0RdIaflkASwzWZ6gdUQ==
X-Google-Smtp-Source: ABdhPJxpfqDKnPz1DYcgUZ1ElZ07nh0if0gtDDDecukFbgK146Ktyx9xjHphpVLEvAsxxRcKVDyH5w==
X-Received: by 2002:a05:6808:aa5:: with SMTP id r5mr2081321oij.119.1640274244080;
        Thu, 23 Dec 2021 07:44:04 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm1055762oil.6.2021.12.23.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 07:44:03 -0800 (PST)
Date: Thu, 23 Dec 2021 07:45:11 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: agross@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	olof@lixom.net, quic_vamslank@quicinc.com, robh+dt@kernel.org,
	sboyd@codeaurora.org, soc@kernel.org
Subject: Re: [PATCH v3 0/3] Add devicetree support for SDX65 Modem and MTP
Message-ID: <YcSZh8racQsDiF5O@ripper>
References: <163960723735.3062250.7838330411965052999.b4-ty@linaro.org>
 <20211223144407.GA6503@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211223144407.GA6503@standask-GA-A55M-S2HP>

On Thu 23 Dec 06:44 PST 2021, Stanislav Jakubek wrote:

> Hi Bjorn, it seems to me like a patch similar to Patch 1/3 was applied
> some time ago, see 61339f368d59d25e22401731f89de44e3215508b, and applying
> this patch has caused the compatible to be documented twice.
> 

I'm confused to why git allowed me to merge patch 1 without complaining,
but that obviously shouldn't have been merged twice. Thanks for
reporting this!

Let's clean that up, would you be interested in submitting a patch for
it?

Regards,
Bjorn
