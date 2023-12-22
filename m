Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC378C47DAC
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C46A8C116D3; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB872C4AF5D;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=/YK3fe6QnRiuszTLBLATSeNXzKkCRAC04OZ6OtA9zt4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=X4PzodJ4HPfff5RmAstjhUzpZNgmzCmOUx6l+10JL+2ayDgq2eBvP2ww9b20fzyzu
	 VLMRk4ot7nCESyr/Xx0pcaHzeKkchjI4O1OcHATnLcv0xp8B1rZzrRHPN6KDuDJuZh
	 ctxqmpgYJXEgUvZSECJHtthxQBOgEniyjWpmYHuLLTyJa4ijWzm0CK87CwOZb4kOU/
	 jZg7zMYbQQ3JHuqJvNI/vE0Ehe/yLVlMNE94vKgCHF0aTuxVXCLQC3lEBKGSJFqfhB
	 cd4zTmeNxtMsQfVP+0B2wNTQ3xcMNL2qSRsUBODaEWE4n4AFH2YLVk9UtXpwGOBPpT
	 ez1sRGx5n6iRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 983BEDD4EF7;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v6.8 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646762.10550.17501441778055071691.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <87r0jgbyz4.fsf@BL-laptop>
In-Reply-To: <87r0jgbyz4.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Dec 2023 17:49:51 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v6.8.
> 
> Gregory
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v6.8 (#1)
    https://git.kernel.org/soc/soc/c/64704ef17d0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


