Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E139CDB484
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F9BBC433CA; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE06CC433C8;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=32QgZvlsqAL1ykRfDMFsmnwG1ZCfjPUOHPcijErj+jU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hj7f0zM8unjEG2pLi+7tCSPv4TzF5CV72wTah/EQ8K+ZjAX5U0552S3HnrstNtxfh
	 ortkPhj9ao/UvfSxEfaUfWNgsJk5fK9vmC3AxOl2FjRr6sZGSHu85qP2LYUme8Ll4v
	 Zq/T54V7dxQHCUl/CwRs1Sf0HUZbykkcxxz4Hs1V2GziQXZXe+58midNtsn3+HVFqN
	 slvOW1lllJ8FlHFcWxHRn/xCTCj9f4JNR6zilwkAYpqd6yPYcMmdsOK70TtwAd4rST
	 l6mQrBXYkp4ftKF5PzHZ5UgPeMtlFTRFKhi9EWDuSAFq3BFujLur7wu/VsGRx+hFx3
	 KHOiDkhjX084A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D897AE1F669;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: minor cleanup for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083788.14185.3946019517782608894.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:37 +0000
References: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231006092823.94839-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Oct 2023 11:28:22 +0200 you wrote:
> Hi,
> 
> Few patches which were acked by maintainers or slipped through the cracks.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: minor cleanup for v6.7
    https://git.kernel.org/soc/soc/c/9e3fdca114eb
  - [GIT,PULL,2/2] ARM: dts: minor cleanup for v6.7
    https://git.kernel.org/soc/soc/c/78857f7fe37a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


