Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC61C433FE
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9647961260; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F6DE61354;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=XXlqSV8wPbk8Xf80+Kf9ead12CrtxvVjF4eBjJrRaBA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dgmHdQfEX6KPgzDdKbp4lu6EGg8NmaTO7C9QtxUyBvJ+KU+4MRLtKGuAkYU+iSquR
	 SS+sZi5HWA1nlKE/RAPhxywcTXcAPV8IvaE/wgy1HZ6wUuLTkFRO5eqO5mbG+Y085q
	 KoWbZr6MQbm1gMEnWvzbCK3S2DvwvOkcYO2R3SlHbK+OqyJk3rOI04to8/26+S8Y9u
	 twyZVDgzuIPhzNrrH0U30gl1iN/+07mDf7+GmV6Mhmj40kM5QLjbEYvuYZsoM+Or09
	 sdKS89pmbIQ40wg0j5V9CiPfRdU6lKtsX8+GT7dKWp0V75svnNXeOZRYb6EurqOguN
	 IT3d2iu2xY98A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 75176609D1;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v5.16 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781347.13902.16008515275389106879.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <874k9imeel.fsf@BL-laptop>
In-Reply-To: <874k9imeel.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 18:38:42 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v5.16.
> 
> Gregory
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v5.16 (#1)
    https://git.kernel.org/soc/soc/c/9b9a7ea8ec88

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


