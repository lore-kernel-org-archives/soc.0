Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6227C47DA9
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F377C41679; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43399C433BA;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=S9LlaQChgXMVCx19oEVWi1cgB6cZD0xfiDPZbrVucKE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XB2gAYPSIB27zS+QmYoo5R2tm6VZoQ+4tQqXb0i/XA6IFXT72Xpon4D0IzXJLQsuZ
	 Oh7Z7waimJa9YRDXPaqSNq3OXykLOVdld46dYR/w/q+hUqFau6lg+BceqPIE+q62ao
	 iJyJYfDqRUzj2vntazz4Lz78mQ0anjyEUjcZCR+izOtjAMJnH9QAQJtSi4kKq3Vmty
	 RQDNxOJG+6zMDRwVae6qRM69kgDG8px1JSA3XccIvIhzrFN/iQDwO9XksLco87H0+U
	 4wGesXzTvv+6fKq4wwzAnEr/wvxYwnefclSm20vU9x6uReSvfKG4agn8q8nMySczXQ
	 K0u8COUmwjWgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 238AADD4F0A;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: samsung: Exynops and Google for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046614.3302.18012657882538182661.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231212093105.13938-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Dec 2023 10:31:04 +0100 you wrote:
> Hi,
> 
> DTS and bindings for v6.8, together.  Explanation for this is in first point of
> pull-request tag message below.  The bindings are still kept on topic branch,
> just in case if any other subsystem wants to pull them.
> 
> I expect this week to take more Google GS101 changes, so there will be later
> another pull request on top of this one.  If you have any comments about GS101,
> now is good time to say.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: samsung: Exynops and Google for v6.8
    https://git.kernel.org/soc/soc/c/2dfe48a85a07
  - [GIT,PULL,2/2] ARM: dts: samsung: Samsung for v6.8
    https://git.kernel.org/soc/soc/c/9bc75fe58d69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


