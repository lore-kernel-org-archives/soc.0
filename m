Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC945C54E66
	for <soc@archiver.kernel.org>; Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD74EC43399; Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B84C2C43390;
	Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710275430;
	bh=ztNab5cFbldCL+2ha2+LYH77VTYg5nxBkUxheK+5eno=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AZjmTPi0Ebo48wyew7qbu0VAtTwlyW7JYUZ1kqGyFOhPULMAUS32Ro3kFbcahcGxn
	 t7WB+aOIsgeUmoqkotfid8d/tGw/g0ykJQE1DA1GzlScp5EinPrQmeDps9hrXrvMF8
	 dj04mptjir9CrN5kw+TB8H3qwbVxtGqn/nBUvBYbB6t/A2Ob70h6IHlMiG3RYpKQtc
	 8n1pGzCnQdmAFKOyBsxUCQXyNW5gKEjRKmh27CuYrNkoFJTl4O9PlrNcnyibiY6Vpi
	 OjuiOLwbrwsp+iJJtmoAJR509MCReJSHBfVoEii9JtRqSMQ/YY82ziR8F9pfo3GR3M
	 84lwuqcfMVEmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99178D95057;
	Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] bus: ts-nbus: Two improvements
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171027543062.9906.12435761764987906802.git-patchwork-notify@kernel.org>
Date: Tue, 12 Mar 2024 20:30:30 +0000
References: <cover.1706083174.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1706083174.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Jan 2024 09:12:03 +0100 you wrote:
> Hello,
> 
> these patches were sent already before, the submission can be found at
> https://lore.kernel.org/linux-kernel/cover.1703527372.git.u.kleine-koenig@pengutronix.de.
> 
> No relevant changes since v2, I just rebased to v6.8-rc1.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] bus: ts-nbus: Convert to atomic pwm API
    https://git.kernel.org/soc/soc/c/8129d25e32b7
  - [v3,2/2] bus: ts-nbus: Improve error reporting
    https://git.kernel.org/soc/soc/c/a04a7da3982e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


