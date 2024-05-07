Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EFEC10F1A
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C29BBC4AF66; Tue,  7 May 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD757C3277B;
	Tue,  7 May 2024 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074831;
	bh=sEV7DvtJw9VQMXWMtjDO7bURY1CcLsPz+S4aNVD8fzw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aeXZ52me0GbLLW/gwij4z0kQEqYmE9dFu1MF10quhovxCOi//kTa9jitE+12NzlB8
	 TDzz1iWxWE4sjuw9x5PVyY11qz50Xt7qAri8CEaQiSSvyC94VJ8vgdcKLo1RuAucxh
	 aFJkcHchLnboW7brFsqQlrM8FcPGsc9WZvugOwqo72HOVDpHQVbHrWDyK6U6kLNQ6J
	 i6dJZFN0wtd1RJTDWU5WkJOiIgpmVAMhU/e07YBvt1C2VpO6RFS5xyPKLj7yvg1nwM
	 ChWjku0s9w/hHfG6Wq23dRQ/AGXMdjNOAgRTohv9Ge+iD71T49RTg1eTl/DLh38i1F
	 uncgaK16vF/Cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97E8AC43332;
	Tue,  7 May 2024 09:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483161.24942.1085828100324250335.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:31 +0000
References: <20240427153817.1430382-1-andersson@kernel.org>
In-Reply-To: <20240427153817.1430382-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 10:38:16 -0500 you wrote:
> The following changes since commit ecda8309098402f878c96184f29a1b7ec682d772:
> 
>   arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller (2024-04-12 12:21:47 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.9-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
    https://git.kernel.org/soc/soc/c/5549d1e39989

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


