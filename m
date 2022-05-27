Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B48DC4332F
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0487BC3411B; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2793C34113;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661214;
	bh=5RTlgFj0TAO+wdi8QVaDDe6fvpBG4GAe+35LRMn0Tio=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hd81FfAkpnWfEkxkEmaIYcpksp+PlRjCDZGpSJodgLA4VK6nDQOHrucAqtDQabCV6
	 6jtjLrxzhhJ+HSyURRpdRnwIa9OEdHqec5nwT48dRtas3q7f0dGmKuAKM4glDmZWz3
	 s3RVtFlhhyfPs7MV++5rBEoKCTVGKNiBc1FaC+NJaw8jTKhvf6vnhOwKArSik3ZHvX
	 091CJlyvO5E+ukSphvtFgezbaJnDD/tFcOU8e+qjukVxxPSzGRQl++iqsJmme2rrRu
	 g8O0OSXaumj5joINegbjMlhcnbFpPxtilBk8ITUestG1mkUEa2zeV8Ivppw2v8wP68
	 KtUW0F3ShubJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C44C7F0394E;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL / PATCH v2 0/3] arm/arm64: dts: cleanups for dma-channels
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121479.3919.15670362978175129456.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
References: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516142857.6419-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 May 2022 16:28:54 +0200 you wrote:
> Hi Arnd and Olof,
> 
> These three patches were sent on the lists previously, but they did not
> get picked up. Can you apply them directly?
> 
> Original sets:
>  - https://lore.kernel.org/all/20220503065407.52188-1-krzysztof.kozlowski@linaro.org/
>  - https://lore.kernel.org/all/20220503065201.51818-6-krzysztof.kozlowski@linaro.org/
>  - https://lore.kernel.org/all/CADBw62oQbc4a9HxFFmO0E-bDvVvPnUo=raVOaSXZpLkKsNo-tQ@mail.gmail.com/
> 
> [...]

Here is the summary with links:
  - [v2,1/3] ARM: dts: pxa: use new 'dma-channels/requests' properties
    https://git.kernel.org/soc/soc/c/286b8073541b
  - [v2,2/3] ARM: dts: da850: use new 'dma-channels' property
    https://git.kernel.org/soc/soc/c/22a798d7b234
  - [v2,3/3] arm64: dts: sprd: use new 'dma-channels' property
    https://git.kernel.org/soc/soc/c/6fe1953e008d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


