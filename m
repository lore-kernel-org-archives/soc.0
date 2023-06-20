Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6564C001DB
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA79C433B7; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6501AC43391;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=X6/5dh3mHgDfOl+qyZqrxJ+rSlekt94GWGMf55ZneT4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aWUbAqdOQGDHP4froSmiDE0oH0T/tYCIIDwh/y11dIc7qHaxtyf8sOy94OH1ykuH5
	 5Eye1786S4OEZuu2mWXMgAzOxiIXaY2pif/Sx3IbsJbS1KFCl2lfA5L28qF94QQEKI
	 uf1VSdp57mDOR5B3CaHinvkJHFYIFGy4Imt4aZ2OpMLHOBUN33P3qPsJGhPrZxjbSe
	 ooafhi5MbGFBqGHK4OTP6PjCWTl3q/pjitO73GmZxewC7ocWSLatAeuR/MPFreueMp
	 bmFUt3xWYmgYkMJFBX5/7WeElEaQekxU7SMVkb1NFDXsY1iHg1/4iYbAi0t9QbL12W
	 w5ETGSSEX2VcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D2BDE2A035;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.5 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611224.12258.3075981056412788981.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <87a5wzh8b1.fsf@BL-laptop>
In-Reply-To: <87a5wzh8b1.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jun 2023 14:59:30 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.5.
> 
> Gregory
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.5 (#1)
    https://git.kernel.org/soc/soc/c/e86147a28a15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


