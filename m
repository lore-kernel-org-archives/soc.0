Return-Path: <SRS0=fFfY=LJ=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A97C48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 15:50:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8000861925; Tue, 15 Jun 2021 15:50:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389456192C
	for <soc@kernel.org>; Tue, 15 Jun 2021 15:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389456192C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-lf1-f49.google.com with SMTP id a1so27755494lfr.12
        for <soc@kernel.org>; Tue, 15 Jun 2021 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=caPAnGjSd4h6+T+U8kn9IN5DYqDEbeO8s61SWfgGQiU=;
        b=ykPY+pJTDeZbwHvJeaxD6YKg9kCRSQNAo/PnoLbZV1vKr4CisT3mtLmBV26r83KSO0
         a3xTWbXaGu0a0FHS/2TInhTu3zvkcVbvfc1r0tPigWW8QrBt2aSHgMcaANe+2CbYtdco
         1TFnF65IYwDaHEtf4Ozl7DBArc4xfGin8Q4qY/hZAbcBM21rb37EzEJLgdPVj6C4X3jj
         r18qbUCgKWYx1NA5GRdcVQkYIiuLtpldL7UD6y2+BsuaaVXxBi5ZiXDbPQ7/lRMGINf8
         8PH7MQK/1TzKQ8llgfmp81J4k/7hbtNP2q05WWY0iQ/UFc2iqyiBJ4OBuHbMzg0JGVl/
         QApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=caPAnGjSd4h6+T+U8kn9IN5DYqDEbeO8s61SWfgGQiU=;
        b=bkephWBByM3RSRYVh+wBKyZfTPjH4/aRrUpnTMbAh691TvdtEViYYZBOQUYYFwonL+
         9VqFvJyx1SAHJlrzrJg+nUsaUrAoYS+xAaqYdbuo2OrWBeSIYRcwdSyhYOysBk2tJ0O8
         sYTYxB6LU/mPgu2Txgf5RLOfMAx5e+i2H8u836GaEja2uRMTEc8umZt8uSot8EDdhBkV
         M96LEMn61Tgj2txdaf1sP4XIV36nc4sfqFeoVDri8XC1NFiq8sYv5e22HZpkj9eeGJq5
         NWrdtd3y5jVq5opldIgbF553cWUqcfAmoEp89Y7lvYv/J6JFs/fte7VdKUMfE/N7K3be
         wg7g==
X-Gm-Message-State: AOAM532Pa6K8H+M3jK9lnjbmRq/N9ETptfNOhnmiOHZ6q/pwl0Ix/6Re
	GhTiyjGH198GG4hl/u+HXxRG1A==
X-Google-Smtp-Source: ABdhPJwxuB9tOQI6TVdHMSJ9B4bJ0fJNMtpEVn9u2b7PDdYteUCrpcuZd+KI1PPo11tnqSXSokqh0g==
X-Received: by 2002:a05:6512:2206:: with SMTP id h6mr36436lfu.345.1623772235530;
        Tue, 15 Jun 2021 08:50:35 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id x11sm2214844ljh.120.2021.06.15.08.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:50:34 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:41:55 -0700
From: Olof Johansson <olof@lixom.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] memory: Tegra for v5.14, part two
Message-ID: <20210615154155.GE11724@lx2k>
References: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614195200.21657-1-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,


On Mon, Jun 14, 2021 at 09:52:00PM +0200, Krzysztof Kozlowski wrote:
> Hi Arnd and Olof,
> 
> Tegra got quite big rework this cycle.  The last piece comes from Thierry,
> however it depends on one patch in Will's tree.  Since the last Thierry's
> patches depend both on that one patch and other memory controller drivers
> changes, they are here.
> 
> Best regards,
> Krzysztof

So, this pull request is a bit weird. It contains a lot more than what the
email indicates:

> The following changes since commit 393d66fd2cacba3e6aa95d7bb38790bfb7b1cc3a:
> 
>   memory: tegra: Implement SID override programming (2021-06-03 21:50:43 +0200)

This seems to be a patch in the middle of the new material in your branch, not
the start of what we already have in our tree.

As a result, the diffstat when we merge looks completely different. While
I generally trust you to not try to squeeze in material under the radar, it's
also unfortunately making it hard to double-check that you didn't accidentally
bring in something you didn't mean to.

So, before I merge this.. can you confirm, or even better generate a full pull
request summary/diffstat/pull request email that shows the full new material?


Thanks!


-Olof

