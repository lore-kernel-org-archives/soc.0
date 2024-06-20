Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A043C2BBCA
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36D79C4AF0E; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E57CC4AF10;
	Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718919259;
	bh=jl2ilyI1J66X4W6fAs/snwcJvlPP7578oayaoQlsT50=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=klS8VSIsUwaXJh8CL1WUJ9Y5CrYWnXO7R3h7hPHz8TBgbFzGY+J9Ff3Errwwc5WO+
	 X5Al3E77tEVWfwfibH6Td11vxhpBo73UCaWM0r7C2yaPCtkVaipD1TgMpKt0/GzGnX
	 lhlX+rG2qWH8+BWuYXpgMRbpCEyy3AdK36HBJZ6zv+vLJ/37J/QYxoRnyVk3nYBB7+
	 HpcnAn6yzaxgykovSTQZyHvxTGJVe36gdcXQbfLY5hxr2kYbhqDjJCDv+dc8nIGbGD
	 jGU8UyAwG+P09zUAGrCnMGzeHIQbnna7Q2lk/+TYGKDKyzXzDXKuZpob4B0EZ+qySv
	 2JQRRNKdsg0OQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02DB1CF3B9D;
	Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND][PATCH] firmware: psci: Fix return value from
 psci_system_suspend()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171891925900.21354.16359165220171268036.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 21:34:19 +0000
References: <20240515095528.1949992-1-sudeep.holla@arm.com>
In-Reply-To: <20240515095528.1949992-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 May 2024 10:55:28 +0100 you wrote:
> Currently we return the value from invoke_psci_fn() directly as return
> value from psci_system_suspend(). It is wrong to send the PSCI interface
> return value directly. psci_to_linux_errno() provide the mapping from
> PSCI return value to the one that can be returned to the callers within
> the kernel.
> 
> Use psci_to_linux_errno() to convert and return the correct value from
> psci_system_suspend().
> 
> [...]

Here is the summary with links:
  - [RESEND] firmware: psci: Fix return value from psci_system_suspend()
    https://git.kernel.org/soc/soc/c/e7c3696d4692

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


