Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5521EC7EE39
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18620C433AF; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F176DC433EF;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101828;
	bh=x4TaP0SIYkO9LPC3kG+noZUdRCHqyCK9I8RxhdsLgys=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=t21uMUMzU8E3fYQG65vEcQ4E5BrV/j2smwacXMFDv4ILVDNB0tIgmlxp1K5ojHXVY
	 Zz3OxAPUkX5H8dr4c2Az1JuKLeH03zp/FCJu90aDNkbWoxtHHdYrOGZfYaDkHGrMUh
	 5d3Ns375/bQ9V86K/tXu20KeRGm3iw8PLPJLPnWxcD2L68b6dJIrcEhVP3liZyQR/E
	 hE9qHH3cpXZfFZTV4YfYwADJgz2kFHZoVAcg5bFDlDnNAbtzqx9eLRR9iTFi94D86C
	 QPjP2AdWHRWZErsy/6hbSIs3O6IyHNvJzN7KCu+DQrRQD9W+GQvdSt6jD04GuTvOiq
	 B/14SCnFpKBvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC28DE4F133;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm-cci: add cci_enable_port_for_self prototype
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182776.28560.18086249203886738020.git-patchwork-notify@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
References: <20230516201218.556437-1-arnd@kernel.org>
In-Reply-To: <20230516201218.556437-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 May 2023 22:12:12 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The cci_enable_port_for_self() is called from assembler, so
> add the prototype only to shut up the W=1 warning:
> 
> drivers/bus/arm-cci.c:298:25: error: no previous prototype for 'cci_enable_port_for_self' [-Werror=missing-prototypes]
> 
> [...]

Here is the summary with links:
  - arm-cci: add cci_enable_port_for_self prototype
    https://git.kernel.org/soc/soc/c/db967cf828fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


