Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8060C25B78
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A67D0C4DDE9; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D2F0C4DDE1;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=4VUuSKw+KFUj30SbU+S5qeScXtN63DJTkvSS3SYG24U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a0RwbTVE7JXhi19gRaTHr0L/aSeb54hExKxOIVf5edoM7ueywk033otY/irFROZXY
	 WBTtHhwFb1s7LKLerH5QIT30yDRgqkONdhayhnyy5b4TRebkN/kN0Hocz2XDHoT50I
	 nleLO2nf9Bs2D+4LaEVW/4bRWEYG5y5S2PsASqRfk7njKGUu/16OpDjquYSYZgY2qG
	 S/B/zShimNv7U3U8N5U9xbpNEg5as8KSMnS1f24fD0Dt9lYrh+YBcY4jKonDvH8Qat
	 mVF25jqd2QI511UAOOxE8YI1CRcrajyGNZ5Oxl1qSj4zmGlKkMtLvsjFGnsX1iQFma
	 o3lJIX77aNnLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81B87C43330;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483952.24942.15054196105017619747.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <20240427153817.1430382-1-andersson@kernel.org>
In-Reply-To: <20240427153817.1430382-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


