Return-Path: <SRS0=zQgr=SL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE7FC4332F
	for <soc@archiver.kernel.org>; Thu, 27 Jan 2022 09:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78EC2C340E6; Thu, 27 Jan 2022 09:33:37 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72699C340EE
	for <soc@kernel.org>; Thu, 27 Jan 2022 09:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72699C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 35CEE3F1C6
	for <soc@kernel.org>; Thu, 27 Jan 2022 09:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643276015;
	bh=ab1luuZzn+rKwB0G/H73SwnYANJP++VOjHTq7jQ19wY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=j7X4ELq6R73cQTTV+KhiFFg2KIZeMEhRVhWV5UEu5HtqS4+LmdhKNFy9nLzf/3vfP
	 O2A2BVqIuhn8wDJFtcDZsqIqCwjaR7uqtYgogJAUxZw28wnSMV8a/rHc1yJgTCAI/c
	 wx3C26T6ypR51MSUnwdpNE+qVUqa9Gat2m7tWr5EFhwHyjVZIPdCx921nKh3AkPslY
	 mM0DaQ48EvEEUNIvF3eVtW3PLElJ0rD0SeFVbp7cM7KKIkpv0lRETh+EYxzBdyELh7
	 3dsIEh3sHYnoXDwhLkd1+AJ6OG5iyx1Tb4+ShWYTJK+bC0VkPPOJoFBTU1tKV2vZw0
	 7BiHQnS+0QB8A==
Received: by mail-wm1-f70.google.com with SMTP id bg23-20020a05600c3c9700b0034bb19dfdc0so449848wmb.1
        for <soc@kernel.org>; Thu, 27 Jan 2022 01:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ab1luuZzn+rKwB0G/H73SwnYANJP++VOjHTq7jQ19wY=;
        b=Lx0eP9sCHlo9A8IY4KeBMyZchh10cfEIVxLcqd8YrnrrwkIXo05URLgq7P3c3zIQaL
         d1hlJZVSH3tf4oo/ln2ErsyaooBjzbgWt8iX6jrjmUBfEfI2GIYL9B90gF0Sykl+7U7G
         QqCufHUPUpN/rvVBzMtbVfPRUQZEeuGlzLhyofxaIVRZ3kKlpl21pdtZoJ1FjqTCnhou
         gEhgJXEU6xjgbxH14ltlTeP8OvbD9fKYFq6zzqTtGd9PnnU3fSekf0kPV83t6yr25FII
         tjJw3zJVQZpEiEJGuaUbO08lpfGOHEqFLNeTjl1OuSQNqIGlkFkegpXfuISAtz7qHPXc
         HNTQ==
X-Gm-Message-State: AOAM5334siMilw3Hqjx8CkUCwuN6iY0kF8lmlMsBbksZtAEEdb3Jg4PL
	vPZv1Z/Oly9wrn6SrgJ6R1LLxruJwcqei8UQ/phSy3j7OshelFrqUiAvaJZtemMdOVosT3YCFcK
	NH/ByI5RZef3sM6xHuV2i3GI=
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr2301434wrs.410.1643276014783;
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwackDtjcmH0YUiJyk7XzFedBt6pMCl5S0pLhlnvxCHhFBKHp3Es5kkgM0yYe1bv2SYad+4QQ==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr2301414wrs.410.1643276014525;
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
Received: from [192.168.0.63] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p7sm1533601wmq.20.2022.01.27.01.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 01:33:34 -0800 (PST)
Message-ID: <cb11d2e0-dd03-9a48-74f3-0a22f49f16b5@canonical.com>
Date: Thu, 27 Jan 2022 10:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2021 12:29, Krzysztof Kozlowski wrote:
> Hi,
> 
> Second pull with DTS for ARM64, on top of previous pull.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
> 
>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
> 
> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
> 
>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
> 
> ----------------------------------------------------------------
> Samsung DTS ARM64 changes for v5.17, part two
> 
> Add initial Exynos850 support and WinLink E850-96 board using it.
> 
> ----------------------------------------------------------------
> Sam Protsenko (2):
>       arm64: dts: exynos: Add initial Exynos850 SoC support
>       arm64: dts: exynos: Add initial E850-96 board support
> 

I'll send all this as v5.18 material, so this pull-req can be skipped.


Best regards,
Krzysztof
