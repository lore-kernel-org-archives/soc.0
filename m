Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B5C00528
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87E57C43395; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72770C433A9;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=YMrOr8DZEQKopEp/0NELRaKy/e6m3DXTGtl1w6ocZa8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U1RyzTQLAu9QceNXcxzu2I/HmDPY2CkyQMDgvSwsq3rc481GnLGnVRFVIXhtQgs2I
	 kUgIethKwixToXH/C/NiX5e/nR2HyRH9FI2MR7xDDK4O93+310uQ2gNa1QB7pTW4T2
	 8U9zYn2ohZgkYXYq+JOd9O7zPh0RZZID1bIrExK+JBDZw0/Lk55a6qbfydZEKbqKGo
	 +AeanrevwggWsJic2mUVITHQh+bFSdnTmncDiiTPftKTWikzdQ41grhzE6Pd6Ubc6v
	 8nNAuDAPxxDlNQi6WLBCO1z2EXLZW7iI0EiulHdKAPOnQ8wPxrjeHbEcJ80reIGBjU
	 Xg0l8sxyH1Sng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F45AC0C40E;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972431.10612.4955360869904654611.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230610170955.2478831-1-andersson@kernel.org>
In-Reply-To: <20230610170955.2478831-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 10:09:55 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.5
    https://git.kernel.org/soc/soc/c/c0ab597fa206

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


