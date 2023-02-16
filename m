Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE615C61DA4
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92D0BC433EF; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CF74C4339B;
	Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676586648;
	bh=oF1IUxs3BYsHAzzZd1wSVHngH8xmGkAAOXwkXhrWTS0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VtqFgvJInf8Ay5Cn4aVpF5NKFnWa5XEHSybQeamtnNsaNKbM3iKmJ31EH5T8zufc9
	 5ybOVJLFqAJafBugP9+QhYJgXofHhML/wOtxf4haYkw2rM5LNGmso1t5dqnpfZkL7n
	 KYZys10IP/IRZZfS9pu5H0l4CWk7xywl8wL4Qu5tvB4HlDd+++LGR+x9pqY+hoxsrB
	 +S/2pJqwJyvFldyBj0T8GIa+rDJugFljUf2D0pSqUd77iGC0ZeXSsdRdFmRaWVLUr/
	 ESjKt6D2Nd3773ST4BHT03AxniW9V7KBK+8M9lHuoAXwlz4K+cVQZ8mylBaZwSlsao
	 Kuyf05CC5mATg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59245E21EC4;
	Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] dt-bindings: riscv: correct starfive visionfive 2
 compatibles
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167658664835.10028.1422372725708510360.git-patchwork-notify@kernel.org>
Date: Thu, 16 Feb 2023 22:30:48 +0000
References: <20230216131511.3327943-1-conor.dooley@microchip.com>
In-Reply-To: <20230216131511.3327943-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Feb 2023 13:15:12 +0000 you wrote:
> Using "va" and "vb" doesn't match what's written on the board, or the
> communications from StarFive.
> Switching to using the silkscreened version number will ease confusion &
> the risk of another spin of the board containing a "conflicting" version
> identifier.
> As the binding has not made it into mainline yet, take the opportunity
> to "correct" things.
> 
> [...]

Here is the summary with links:
  - [v1] dt-bindings: riscv: correct starfive visionfive 2 compatibles
    https://git.kernel.org/soc/soc/c/e43efb6d713b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


