Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9855C04A94
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C645AC61188; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B09E1C43142;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=qD6vrvsF5pJQuU+ldvU2aAqma2XbLCc86Mx55Rh75XY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V5rUJhzPP3gQkj+ye9iEoSUl2TthMwWnyvz2PgjdNcvFlhqo5GYgDpzpWkXfuVDMY
	 7M8TPuyw6j7+qhX471lDFUdwYddFzKnRFMRRAr2w9nAY/EpOJ6VMryBn/oEV5IAzyt
	 Y/7JY5E0LKVP2DgnNI6I1BN+xbWrl5cW0IAoJUt9i04hX94V1dLfet8H2wTAiVt14k
	 8NeXlD4hUZbAS7tlpVSCDyIjX0KWZXIYC6b4Asw5YaDVJDK5Fj+Igd9rELbE6WBDiE
	 PWmu2o83Hr9o2YiYQ//SXcK9TP5vl1RPSf4hBH6PUb5sUHuhwQDO3LXtPrpbnvFNBZ
	 +XdCTvvzLhe4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E28EE2A036;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611264.12258.15408982405445353723.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230611004944.2481596-1-andersson@kernel.org>
In-Reply-To: <20230611004944.2481596-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 17:49:44 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.5
    https://git.kernel.org/soc/soc/c/60c2f542a7ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


