Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE4C04FDF
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CD9CC43397; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D1F4C433CB;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=kae+DIRIXrtr8iigMifojPUABaAiSgOEm9p9KyY+Mlc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gCgRMa2GnDQGtvv8r3Kndsqdxx70rQ7uod5H8nIjIULsLobid/NJUizbwWTv8UkZE
	 1oaE8KuAeIY53pwMh6yfDKWpNnvfOW0ucQak7nwPRCC/UiZ7lTpJ+a2X3jZyVVRtK7
	 ArvE93l5pJi/3jOTfieFuHhHGTt/yUoGRPkv7vo/9ty3Zq8HczDp2jVnOtJgsu9Oft
	 OTjlxtc19+GwPw/lwiC8T/xBxZMi2YBXiQAX94WbZI1BkZq/5Lf7qcfDCi+DWqIKnw
	 sR0rk7pyhxb83bRqCMEg1ENEiXdG3Z+3lhaS+zM0j7KJ2d3rmJBdr3Wn+6db/et9PN
	 +FeIuHArIjBlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 133B6E1CF31;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc/tegra: Changes for v6.6-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168907.30475.2474139576931494289.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230728094129.3587109-1-thierry.reding@gmail.com>
In-Reply-To: <20230728094129.3587109-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jul 2023 11:41:25 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc/tegra: Changes for v6.6-rc1
    (no matching commit)
  - [GIT,PULL,2/4] dt-bindings: Changes for v6.6-rc1
    https://git.kernel.org/soc/soc/c/e85a757dd400
  - [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.6-rc1
    https://git.kernel.org/soc/soc/c/caeca8a4be33
  - [GIT,PULL,4/4] arm64: tegra: Device tree changes for v6.6-rc1
    https://git.kernel.org/soc/soc/c/d64f140476d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


