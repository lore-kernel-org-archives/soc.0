Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F50C4708C
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B7D4C43152; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C6A7C4314A;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=1TA8R4hehwdkXg+LPKLmoyYChq8Bi6xQ5HSYb6+tPo8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sFqEt38wQPlc2EpFuq45w3cWnb9zRJzdyrkusIIjDiQ3c4KhTSoTI6b0NjCPr1EY1
	 JTj+jEjFNSbEto/+9s21GZn4Av/ytqVftw/Hh06mHh4m8vTacrIS8KIuwUZUFw3tG0
	 wQ62eaK7jgWprGIsbhJQ4BbCinfyrVdIAf86tx2lsvSFo+fnDTBZHDOiytDsRPzA7D
	 yasrXoTIeEmpKea8F+SJ4YW8bLuU9RI5s2yXNrUiN6HzhLcVmefRwAkZx5ioNmmUhg
	 e6rTVC8cRNcOzc/kUTPg1LCblF+6QbXeEAeT+r1HsWZTcChR/gpUqWLDE6E3YFoN88
	 ZhLrpX0ASCKwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03C8BE5254A;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v6.2 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826201.9936.8772925530232002457.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <87cz979adf.fsf@BL-laptop>
In-Reply-To: <87cz979adf.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Nov 2022 01:43:40 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt for mvebu for v6.2.
> 
> Gregory
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v6.2 (#1)
    https://git.kernel.org/soc/soc/c/c93a25d77592

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


