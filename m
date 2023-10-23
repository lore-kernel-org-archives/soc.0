Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E221FC25B45
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2A01C433D9; Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98C46C433CC;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698089430;
	bh=miAx5/zUuZW011CKj/SlfqsxX4NtWFP4fTzC563ej10=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EpnviaVU2jDM/OT/T7a4ahw7IgmOgOMnDO3jgxFaYhZUvG39zgPjZu0vhBI+Vb8Rm
	 FLNSf73MEfGUVj5pTIdz5VDoE1pSxYX8TjNpQQFYzMWOilUhGFhgU/UP+gfJk37IB/
	 6dTQH4A4y6VsTju4isbTwxqz9u7csAO6K6di2cKg+EYiIBhhqBCFBxP2RxZ4HdyO7j
	 W1OhpJDPbD1pFZXW0njaF3nuZDOqMJcp0bnIXACQr7Ri4oJDFhAZVSete0xB8I6gi/
	 3aJ+Vp2Dbj3Ne7aNond5/eonfRc8qGBqdwqN+gOPL5RCoc0lVdzQtmObNxINjIr9/+
	 VhIWcCDPvmdcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73181C2BBF6;
	Mon, 23 Oct 2023 19:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: dts: thead: convert isa detection to new properties
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169808943046.14534.10860012741158716966.git-patchwork-notify@kernel.org>
Date: Mon, 23 Oct 2023 19:30:30 +0000
References: <20231022154135.3746-1-jszhang@kernel.org>
In-Reply-To: <20231022154135.3746-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 22 Oct 2023 23:41:35 +0800 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - riscv: dts: thead: convert isa detection to new properties
    https://git.kernel.org/soc/soc/c/0804f3bec9e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


