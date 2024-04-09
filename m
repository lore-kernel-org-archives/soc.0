Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC33BCD129C
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADBEAC433B2; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BF4C433A6;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678195;
	bh=67LnBx3LaPw2igKBgsjt6wN2F98q2PRaxLg77wHvSio=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AfNCpkoO4RWMz1j+cMncIzqEngAhK582jID6x+ZvVDrqsRPFF/fIOf1EEs/FF5NKr
	 dDo/dpanwHKqZlBA/TNLAwOcHrppfU1zYkaBxzi0O9M9Y3fIADYvDI9DsNea8fbsrw
	 HpmY+ymfKlLskpgQJ6uqe1DRp+8xn5lgad6hOiFJlq9re2kTQhbotUXWW2xKVlFmBK
	 9fGaBmQ687HxyzK9K5y0sc7RuhbUzJlLG0cwaoqiriuv1/1wkIClVA1Pm2yqn8Aewt
	 m8ukrExhbBTd32rwKBvQB3yARk8dHH5+i/gmxcOyFegd1A5/FsticOZvDCDmOfi5jn
	 9ahTEcmpvRugg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7EFE9D60311;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267819551.12038.5803692756082758092.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:56:35 +0000
References: <20240406-botch-disband-efc69b8236be@spud>
In-Reply-To: <20240406-botch-disband-efc69b8236be@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 6 Apr 2024 11:06:08 +0100 you wrote:
> Hey Arnd,
> 
> A single patch for ya, needed to fix boot on the JH7100.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc3
    https://git.kernel.org/soc/soc/c/01a71af381a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


