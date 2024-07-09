Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B433C3DA4A
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73CC7C4AF18; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D70DC4AF0F;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=My6YIaY/+CM9fWmhcpwkktHgx8oasSOsMGh0aCbbVLE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SUDq6BaMaC9NUHap29AEAlpf9oncwBOdRBsM1oA+xND0W++NmYkhgtAD6xQsO6KUJ
	 MAcL03Uu3caZCC0/mdctjoi+prKYSEOM9TtA6ACdILEfMuXb0zaEM24dHwPwccS9cN
	 JRXCu/WEoOfDxxkMxQqpA6yoHpwvsyYJch0dL2VwJVKee/KUKYZKMcHCUw2t4I6WRo
	 lXq4xm7RRngaCEitaowIX1ffw+AxNGlcYu4Hqbg0PdrR+yHV2bzMnfxCmTxxqMAIcR
	 E64bcRq64mu6XxQH4gmrIo8cylEhpOMA9pxNJyhOaH/syMIjicckkdhHL9ixBcAEne
	 qgFHqiri8a3bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4ABDEDF371A;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743830.12156.14126999188782642348.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240705034410.13968-1-andersson@kernel.org>
In-Reply-To: <20240705034410.13968-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jul 2024 22:44:09 -0500 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.11
    https://git.kernel.org/soc/soc/c/ee22fbd70544

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


