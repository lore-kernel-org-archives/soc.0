Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8709C4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C458BC4347C; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE83CC433D7;
	Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667424016;
	bh=fInHoYg/xS0/JChjdptITSZskjpIz2WeZLLL4dI4c+M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e+V/EoEwVqjGrbz6Af8SqwqLgBT1ws19GLuYWtisa14P8LkiPzyQfxdDhsJrjc/RL
	 Me8h/onRARjk7yeLOjr90pbAyvyUPX8nH7csWNtombBK0chLDanY5vAV2Qay3gU6BP
	 OX7jUMHfIBLaQBtV+NNIfUWdOLA3e/4iQY3eNJMJ7O1JWhvs7WjH1EYB7Dw4zQambW
	 RlnJuY3i9AWcAWT7HtLQb7lmzdb1dVUPUrwZ8oJuAK+WxNF218T6jZw1V3FLrXkerc
	 rgQ01I9rX3fH5Ajk3BDVw7TctZG1WWbz5nw7Z7f5aZW94kxopofgZ6mnkE6obHHjVx
	 cVCKAPNGMakEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E329C41620;
	Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742401657.4857.12777672227073652756.git-patchwork-notify@kernel.org>
Date: Wed, 02 Nov 2022 21:20:16 +0000
References: <20221026171354.51877-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026171354.51877-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Oct 2022 13:13:54 -0400 you wrote:
> Hi,
> 
> This includes pieces from late (3rd) pull for v6.1, which did not make that time.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.2
    https://git.kernel.org/soc/soc/c/9e549c7637a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


