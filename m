Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D83FC43219
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B216A6136A; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A4A36115B;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=I4MyLYjEmLUIASRbe2d8hVSCP5vjTemI+tcZJAr8uEE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cy/nW0zoEIbzLe4QESPmvxCIB2e2y/kB5LU0SQBBDQydVpNp9o5Tib8kVnYTm9ZSc
	 SAGz4f4gZEmnG7jUQBmJQEtm11Kgr6qne31rc6Mu+rnonuA3wEXql4M8Tui1/QDH2u
	 xlC8W9dMLWi3pbd9Kr4BBuRxVdjUYYbK31DDCATUx9LN24oUhaFQYCNIx1VMRrYDY/
	 HnGxEUKPDOGQbeVw8L3tlQgLZU3KIEUxRKXyBxG6BUkYPizXY1IVfd6BiEgbZHN9S6
	 JJ+FJwH2cDRjdhPinbn/iLOTGMUszslINw8j/WP3PsVu3z8+HESsVSb+3fdOs0nexq
	 g3IFypntAEMZg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8964160A47;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v5.16 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201455.1188.3170584160397217110.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
References: <9d52c3e2-a3b9-89f3-1896-7cd3560e7010@foss.st.com>
In-Reply-To: <9d52c3e2-a3b9-89f3-1896-7cd3560e7010@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 17:21:11 +0200 you wrote:
> Dear ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT updates for v5.16. It
> mainly adds the stm32mp135f-dk board based on the new STM32MP135 SoC.
> Several fixes are also pushed for DH, Odyssey and ST boards.
> 
> Regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v5.16 #1
    https://git.kernel.org/soc/soc/c/ef5dcb1bc2d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


