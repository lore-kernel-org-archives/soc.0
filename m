Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1231C001DE
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8D5DC43391; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2A8CC433BA;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=APSr6ZE/I4P4fxKs3k6aUEROZDT162o9uf3V3+sRXwo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ATynxGlZ9MA11/ZHVSBAemHZ9NXgeI6y2rjjVAivk4KdnBy2mfQubTCsPzjl28GYu
	 41UozIPJNLfvkVNHaCcxwuTOkk3kcV1TJBlaNYgMESe5YyD3OPi/7u7TsnXbHayaaP
	 ujLC7D1ZmYiVzthm3U38EkQBv9jXQONQgMZUhbRa1jxFLGaeGzxp3jyZ4gycVe6aOY
	 eqq/mzUrkoDQmzFhtRk54Hy2U72CHLFMSCWtRqZvV3CJ9SZgBgAgexHt9K1TYrI394
	 ZW8Hc2QcZZvPAXtH4pgFkpLy8gF9k79CZLGZ6rpPgWIQ2/eLW7MexJir7+OjYTdvxU
	 vZoj+hPevs46Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BFBD0C395FF;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943678.9834.10078588015248894554.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230611010044.2481875-1-andersson@kernel.org>
In-Reply-To: <20230611010044.2481875-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 18:00:44 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.5
    https://git.kernel.org/soc/soc/c/a08000d5e04d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


