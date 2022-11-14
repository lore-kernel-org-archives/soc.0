Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C06C4321E
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0721C433D6; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA5C5C43470;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=BxJDHUqQBrPPd/9j8/z/BYmV+n6AG3I8QIZdMj/Gv3w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EZwGyMEflTTAa4HEOIS7yQPQ1JaYzL95VkhxwUBZLIq1Bqm2/pcVu7fWawLfMIYl8
	 S0HzyXAc4ZcG/YRgAMJxqRgZFu19KA+m+6wenzuxZCqH1mBnZ7HxGPzLCmJNLmyAwq
	 RK6VW9vOkW2mW/g14L1qdhsSUGf28so1imHpzVGAETiL6/OBRwojF92PcAhcn9VfIj
	 odQR/RDDT+nnjJLN/tuJ3C730OOrLkbj4JtNDA58XWRSpw3OB1AORJYItto2J4WUuX
	 Wi7WugIk8au2Egkv5AUWuXuSb7cxOfGC1bi4qjWbL2nq/kqGSDYWac54+ueSxqQxSt
	 XwNqd+1SJ8eoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80D4CE50D60;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982052.12382.16413660985483195826.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
References: <20221110115431.180908-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221110115431.180908-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Nov 2022 13:54:31 +0200 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for 6.2
    https://git.kernel.org/soc/soc/c/6ef881e4462a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


