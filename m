Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B64CCA486
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B17CAC341D3; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95514C341D2;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658239815;
	bh=JkcBo1zqYCxixfeL1isuAKV0rpIZWqhlKXBeVbwvvy8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=U9P1rBmg6CJWuR6+LjSIWxa8oQLGscg9Y6XsfazC6aAh3mS9Dtiay9/qLrbSXGgGd
	 ukihhrutKGhFr4IgqH+44NX+bIloVs2JMPhk5V3ccJBT7IRLy9FwyMuStt5TAh29tb
	 QMgpeb+Eo0ThjTND2rj4wfsF+dUUSzZnwVvrVJ6CU/5tD7/E1l7KzdtxHAur7pyRkN
	 S7qAyZyQIpVCLrUHioucTOUgg1GAQdNSPb8YxxtSXbZrb13gN2/eksiWnrqWledtb1
	 5pF9E0s7fJLVTk6ze7wMX616CRphSM4X2A8xD81X33B5Yza+IccPJPXOLM0dpv3aHf
	 lgbBR5Y+hKZYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7124FD9DDDB;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v5.20 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165823981546.7750.8652799438078615476.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 14:10:15 +0000
References: <87ilntqn0v.fsf@BL-laptop>
In-Reply-To: <87ilntqn0v.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Jul 2022 14:56:16 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v5.20.
> 
> Sorry to be late, actually I've just realized this week we were already
> at -rc7.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v5.20 (#1)
    https://git.kernel.org/soc/soc/c/7e0b0cc16ba1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


