Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A6DC64EC5
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C23A3C43443; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB7E1C433AC;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=aRMEcdVsh6UCAwb4N/AmHqSqgvvkxZ/7kd/9UAI2G2I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=toIyRoHRZ3HDO7YgXljH3mnaBJBPRF8pXOHPsGPlMUMCCBw1eodrexqRI1VTYWFCd
	 c7l9jwZS9fZCtI6EUU5VV9u3bircPuEky9sFnWkoVyIIFWJqLL5bdNy1Th3QRQGgKZ
	 XBPylDTthUp58I7ftYsJ0UaVQsNJ9NDS8HlVZ2xgW1SiHhjMlGgoj4eZNzwnuWz8P4
	 I0SDAg/cUYZVYgSuauWDdB2JQC0lZGMlt9IyM4sPtcXZbUO8vx8pteM0lIo26YTn0p
	 u8NpEHWIj293GJZhAKEcYQV85vgW808wLi6uuBToyLOHc1c1Mo6jfMqziKUecfxxsp
	 WEip/2c3Y/fWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E634E5255D;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM DT updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786058.29049.7818069856017367338.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <20230126174725.3681745-1-andersson@kernel.org>
In-Reply-To: <20230126174725.3681745-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Jan 2023 11:47:25 -0600 you wrote:
> The following changes since commit 0154252a3b87f77db1e44516d1ed2e82e2d29c30:
> 
>   ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI (2022-12-28 10:46:34 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM DT updates for v6.3
    https://git.kernel.org/soc/soc/c/be836a16f422

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


