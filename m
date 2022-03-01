Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B5C4332F
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB56DC340F6; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF98C340F0;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646148613;
	bh=MBLsVzhAe/Ei1egCrMzAliIAV6mOc9XCYVb8kmRvvRc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tPtnEtT1Unin7Aan8ZACghZEzrtIpgTm4SMklDU/7dOJbVl0bx4v9nhXSBfSlILet
	 efT1Y5qJ0zkM5wvmUaHfHldbTWzFe2I+cSYIueAIRao6Ij//03pulCZemPcr1qznII
	 B9u4avf7YNBxW0IDWHhFJxhWPkP+bS6/Wn8/VRxSux5h8YrJwlhhSBHPXGk6ZlPWKG
	 4BxFX/SoV41hMyQyQJtSiZM+ZEn2+xiUvTEMFw3vBWVLfcIKM8jOGcvShFkclBaRvj
	 SGjNR3NqugADfDdeh5cIeVWZxeg/S42zRPdSm9g7x//gbFsNf6wh/AM/elT+U4P/u+
	 +DAil+4nbWYzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 769F9E6D4BB;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.18 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164614861348.22804.17316980014117416134.git-patchwork-notify@kernel.org>
Date: Tue, 01 Mar 2022 15:30:13 +0000
References: <87sfs1zrfn.fsf@BL-laptop>
In-Reply-To: <87sfs1zrfn.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 01 Mar 2022 15:19:08 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v5.18.
> 
> Gregory
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v5.18 (#1)
    https://git.kernel.org/soc/soc/c/a483b1b232e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


