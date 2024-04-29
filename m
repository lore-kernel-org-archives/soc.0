Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776EAC25B78
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D4DFC4DDE2; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5790FC4AF66;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=8kzza7RBe9s6/mT5W5lrMhH57vTktkkzN/0CZayI9TU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vJ/0Oi48PxX4GtGY9dfi5KX+10BEkR08HVM6PVoTCRk9acTKmv48b7WgSFV36VRQq
	 8wocqAs9LxNu7kOw93J7TOwRaQBqoE+346rWId/wy1Tj8VA0+lvacJyYUdympogsVU
	 cal7g4VXhjxjDSeaQnr3jwqoFodXvvXELq7MVrLNP3N38gu1ea1CNPuzVk1cjztSE8
	 2/I1M1g2exFrvfn/tOjQPruZ7kihhKazkHn+Ge5ngjNgRKljElHFqDzMMP1m3iqakM
	 T072k3SIr0iUBe3kxvmx5IPHGeljn7nkZ4LaTCebF+ue6LBTykKyVUMDRKLkONZc99
	 Ss4rkdxa/8l2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E57FE2D48A;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444731.17402.566280539114627770.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240427160917.1431354-1-andersson@kernel.org>
In-Reply-To: <20240427160917.1431354-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 11:09:16 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.10
    https://git.kernel.org/soc/soc/c/02c2c1900feb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


