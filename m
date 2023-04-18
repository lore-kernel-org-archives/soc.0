Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABEC77B78
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A28E5C433A1; Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DD0AC433D2;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681831220;
	bh=6eHg/bCruwuqs4icd2ALFDhZhXT4rudCpSnQXr4MdkM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=alMtIg8jAz2jQ3jsNFXrvfPZ4O9Z8+Ujy25W0jqbN4AhqDSDFY/MdQ375kmkkgfx0
	 6APH4Uqo5p2HHhMc5qUeD/ITJVKYxzvvLPxsLXhoQ2WoBUN598uJY9XqPXejscRiYQ
	 6qHz756CC+M76OakUyrNMzEavh+b/iznpmphkgOkM60UBs31/RNEQghqdO+YX8L7PW
	 6jHZNSITAStsTsBc7G+HVCbYbk9HxSUIl9cZZ1ywalN6RArFRc0PpPjqkv17agZjRV
	 7is6jCSLtcgy96DklWqX2zjBkvJhidy47G4ZHAGyXZG8njIiGyNSLRoO0aXVFJ7FRw
	 uC1dMPy8315ZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B531C4167B;
	Tue, 18 Apr 2023 15:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.4 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168183122030.6966.9927658924544545931.git-patchwork-notify@kernel.org>
Date: Tue, 18 Apr 2023 15:20:20 +0000
References: <87edohzfeg.fsf@BL-laptop>
In-Reply-To: <87edohzfeg.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Apr 2023 11:52:07 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.4.
> 
> Gregory
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.4 (#1)
    https://git.kernel.org/soc/soc/c/7abad3d3a91c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


