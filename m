Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA1BC54E5F
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F770C43609; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72FFAC43394;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=5oVLm88hl+TyvXrHRhm2QHHksHT87S07B4MJCmdkKUA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hfgQj4VMmBa3al6H9FU8nrpGYfLxW8+4dv9XZZnkdxVPgmVejCCd9Y3rueXsrHueu
	 jIPzoRHqGEbXDBM1gyN8AkdesRKiN7+s7IMF7VAE5KYvp/Volc5n4YRDiu+dpLzhVn
	 1OYq2OqqHbAHeTj3hbWcUZX3wvDcLnuFiKE2QeNEG7VRRruFNXji/cI7QCXsMjWdmh
	 /sSSYWtfi2s21Af1PEwF3GEtbLZXdAjq1Ad7El34zAURwCdWpX4wCQJankBhRxQbNT
	 0iEyIk2xtrJgmY1xxND18XyYdHv4voeoyaQJxxlt0A8wFk/EZB2+hZxrZYcyBKqIaO
	 u/Iw1elVCYf0g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5B633D84BDF;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few Qualcomm Arm64 DeviceTree fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843037.7525.84526657996184898.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
References: <20240306031451.4545-1-andersson@kernel.org>
In-Reply-To: <20240306031451.4545-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Mar 2024 21:14:50 -0600 you wrote:
> The following changes since commit f176168bcb95bd1fdd32f5a794e68b7a36ac8740:
> 
>   arm64: dts: qcom: sm6115: fix USB PHY configuration (2024-02-20 11:54:53 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.9-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few Qualcomm Arm64 DeviceTree fixes for v6.9
    https://git.kernel.org/soc/soc/c/ce048641769a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


