Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359D9C677F1
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB0C1C43322; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3EFAC43446;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=74sTEYdtHgsTayXgX4qQJLrP9VywZW2H47gg/6ZL1ug=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=n3pIE1GEMTZlfVF8jNPs+sMJWArFnxRAsRqREWvxdaXMn5dnd0Wwx4gbvnIWnGpUy
	 we5+vw7INoN2BgHKSCssTVBre5lalumGV8TglkC2Sbhdcc8/7uK5gIWIt/NbxCIxXl
	 5agMPiZYYzKbSJSn8uHSuVWsrPtRG1O1Bj/QUpBvUR30CW0jL+hXXh3IGPVy+uTJim
	 1pcJkOWvBVBlyCgg0eIs3kFaaoXFr2M1HvVHt2lAiPla18zaontcb+1TrIpwD9upK0
	 uJXZ18o/o11P83MX7UES4evLqGWTVcWCot9U4lH0sNHCyLPHVxM59hXQC1rwBLBIFa
	 9rJw3DcDtKXOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9AB2EC04E36;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786062.29049.11778671091620653907.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <ec9552d8-96df-a677-ab94-9723f5c30f1c@linaro.org>
In-Reply-To: <ec9552d8-96df-a677-ab94-9723f5c30f1c@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 14:32:09 +0100 you wrote:
> Hi,
> 
> Here's an Amlogic Drivers change for v6.3, with:
> - add NNA power domain for A311D SoC
> - convert meson_sm.txt to dt-schema
> - mark amlogic,meson-gx-pwrc bindings as deprecated
> - fix meson_sm by using NULL instead of 0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic Drivers updates for v6.3
    https://git.kernel.org/soc/soc/c/050bbd6e5822

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


