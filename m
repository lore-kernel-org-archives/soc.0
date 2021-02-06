Return-Path: <SRS0=NRVF=HI=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DA5C433E0
	for <soc@archiver.kernel.org>; Sat,  6 Feb 2021 13:45:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9EAF364EAD; Sat,  6 Feb 2021 13:45:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B7464E3B;
	Sat,  6 Feb 2021 13:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B7464E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wr1-f43.google.com with SMTP id c12so11035133wrc.7;
        Sat, 06 Feb 2021 05:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ghVbTm1KHFPZQbBwYfJEJHbvho+CoG+hwSpE/oCZOc=;
        b=N5jlsAfQNvjGr5rTDRDGF9ZtmgoFy9mjwZ4S/rGLNmsZH+q+1kI0BKzOrMEAv8pNh5
         9o5V4LBcaXNa0pe386YKzr5012Mj9LhyVL1nU3AcvZ5Mwhu9NhkYE6SYwIrhUGGF3+0G
         LABNV5agGjzFidikZ+ZG+joVkeEXXEVQJ2QVMMzZxFohIcH+dPpdB6u/JAVcL64Rh4Oq
         Ly7DHzswMRNz+1b4RuFlZcqycWqiXZ9ikdZ9qyO5sX/h7pOw+ASUnlhOUPUY3hezGEZk
         bhH2SDvVLztj5A1PkfLPNXgh1XicU4FRNsuuh3nJ/R1vZB+805HHNxjUACoSRVtBCDrT
         TjLw==
X-Gm-Message-State: AOAM5310LHr55Tht7tADbiWQO0FUwpuGlmjeYd3A8+9AX0cXdbmYcB0W
	9ulXNCDGXC0tKbCXcTh1Oxc=
X-Google-Smtp-Source: ABdhPJxfZL4HL+Mq28hXXROX5oDPXTtbYpNw5IDUR7G1wwpEwQJWkmQ95FfU7I+FNgdfeWWCNapjdQ==
X-Received: by 2002:adf:e807:: with SMTP id o7mr10750502wrm.308.1612619133829;
        Sat, 06 Feb 2021 05:45:33 -0800 (PST)
Received: from kozik-lap (194-95-143-94.dyn.cable.fcom.ch. [94.143.95.194])
        by smtp.googlemail.com with ESMTPSA id w14sm16387610wro.86.2021.02.06.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 05:45:32 -0800 (PST)
Date: Sat, 6 Feb 2021 14:45:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Message-ID: <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210125191240.11278-3-krzk@kernel.org>

On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12
> 
> for you to fetch changes up to 3803f461bd28c1c817281348509399778633e82f:
> 
>   ARM: dts: exynos: Add top-off charging regulator node for I9100 (2021-01-03 17:33:29 +0100)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.12
> 
> 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
>    it suspend/resume cycle.
> 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
> 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
>    charger.
> 

Hi everyone,

Any progress or new comments about this pull request?

Best regards,
Krzysztof



> ----------------------------------------------------------------
> Krzysztof Kozlowski (6):
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
>       ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family
> 
> Marek Szyprowski (1):
>       ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible
> 
> Timon Baetz (2):
>       ARM: dts: exynos: Fix charging regulator voltage and current for I9100
>       ARM: dts: exynos: Add top-off charging regulator node for I9100
> 
>  arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
>  arch/arm/boot/dts/exynos3250-monk.dts         |  2 +-
>  arch/arm/boot/dts/exynos3250-rinato.dts       |  2 +-
>  arch/arm/boot/dts/exynos4210-i9100.dts        | 30 ++++++++++++++++-----------
>  arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts |  2 +-
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi             |  6 +++---
>  8 files changed, 27 insertions(+), 21 deletions(-)
