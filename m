Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453E8C3065D
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C39BC4AF11; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06973C4AF07;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=gJu7VlhfKtDVWgGi9uXsNbPDqeryAt4rtZnlk6kfAHU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eP7YJzEHv8g6hVITpVyEOl4rFck/ETZFkzqi4bT1C7iQvMJ3782O+DhUZb8U+lbh1
	 083DeUeP2Q2/O4U0iMZsoIu45Hfc2Dy/dPCdEZCAexGM015/wthcOm9f7rGeXPxVmp
	 HsGVOkRJZN3lytuhIQWUw/RJMBUotw0/Tp7h2/b0H2vBTB5bZ5rkSuqpzNUXTMjqad
	 SRHdcrqJtgPgcRmW2FFlkIfYA2sNyA/sxB/U5SxkOCCnpF9GBGheNbk+qS0rCpVFHQ
	 zITFsh9jIWDRZtTUE7VEEwc2Xi98fCJ+ldQbH8CUUNEqPlnmUcdpwpEHQVeH7QzlsL
	 S6beZJKogZtrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EDB72DE8DE0;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046397.29698.14210496367516702730.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:03 +0000
References: <20240620093924.375244-2-sudeep.holla@arm.com>
In-Reply-To: <20240620093924.375244-2-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Jun 2024 10:39:18 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Updates for v6.11
    https://git.kernel.org/soc/soc/c/c02138cf7cb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


