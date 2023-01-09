Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B8FC54EBD
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0B48C4339C; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87E96C433F0;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=ks3+UzSFBj2X2xaPtDZscufkgA+XRFnVi46C/8MIU2Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hzCPck2BUcV70I0+gBEvoajJ7psLVB8+R2hkqPtPjE/MijPlaYFbBpkBZqdNmq8rP
	 9W+JMfoMC6I08Wtmzea/dg3li5xWqtiYijD3Aj/HXUizdmPmKXIvtOq/mBK3oBYs3h
	 wR5fEatp4DJQFcDETjhgLCd01U2hBDqFFKU0SasGOWF0vPAgC2ScBc/XZqkoLeNQ7d
	 T+Q/YWA+x/Tn6B3/ahl2XSPVj84rw925Jy5ivihjfzXfY52iTb9b+6roD5TdQc19rr
	 xIcuf0OlVU07wLRmK8wy4PTl3Y/34tVd3tz9pXIHF01iEukKPIIZl8rLEwlsyuZ1o7
	 pK9ZAzOTv0nMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63A9CC395DF;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: Fixes for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408340.13717.6276035483674441718.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
References: <20230109150322.329614-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109150322.329614-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  9 Jan 2023 16:03:22 +0100 you wrote:
> Hi,
> 
> One thing broken in merge window, few commits for older issues.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: Fixes for v6.2
    https://git.kernel.org/soc/soc/c/dc43354cb768

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


