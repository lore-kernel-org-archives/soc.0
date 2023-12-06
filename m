Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC71FC10F05
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1DA1C433CA; Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9309C433C8;
	Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701880825;
	bh=C0W4Cwi5woymfS7TnAwQFJpwTXa/+OdWAEjP1+7I6ok=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SFge2vUaCmYhscn69WHE4kE+xtGcC+8RfKWVS8ueMNd1cCHY95p9RkTaGth/D7eMX
	 luGzkN10ub3CjiAniHwbmrJiQ+7wf3TZ1EOfnqtxoJmD5uqMtdZfaPTLTf+h7ySwrZ
	 yRafSqfS/XuTPVQ9O0NFglvmxlxCFAP6jM6+82Vawk8tf911YO7qyFLUgJvrAZtPRW
	 5B/lMyh9HBKTVG2Q1Zt187fgOUi8u4m/TRH4HpFvlHV7VU/mi15K7n6s9qBiMEvkdT
	 z9zwiBYc0SpdnLFPn7yQ61Xag8/LV2FZkzf++/h/RgJk+1bCV9yGZ3EyOcNxdq9+s3
	 m/UqQNgcd14lQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A41B5C395DC;
	Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188082566.26007.17272141751527447912.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:40:25 +0000
References: <20231116191603.929767-1-sudeep.holla@arm.com>
In-Reply-To: <20231116191603.929767-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Nov 2023 19:16:03 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v6.7
    https://git.kernel.org/soc/soc/c/b0b2981c49ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


