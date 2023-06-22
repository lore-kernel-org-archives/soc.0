Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E4EB64DD
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3386FC43391; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B81BC433CB;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=LrgTRKdYDKSYAh45ksqZkKJHLpZQGq+13sEQjr7t/60=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ef0+P6gMWYH0yulOl/7kyVbI1OMo8KaT2+KHKbgLTMWiKroh8aMn9+z6xQoLLENLK
	 PKizbeBJKgsJb9d+bNrxs87Iwf/cmI8+eA4LtGqo6Pt/KxJqy31L39CFLX+u8w653V
	 OBmUs0KJqSw79uez9b4yT6yEob6vQe3Ii18pLK7mmXlL4Iwg9NFMbAoDcUtXaKOBF4
	 k+II1apMRp4spvEjVX+YDei4u6qxHD+/zsnLUNGaiOBs5yi0fkOzleaWZe7zkCqTwJ
	 R8PmIqpkDM4PE6e0FEoVezWxJJ6uSGVziLc0SJpkp+M8XabKb4Qne+hl4OfDtenBIx
	 r0fbgMT86jVlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5BF8C395F1;
	Thu, 22 Jun 2023 16:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Use kmemdup() in OP-TEE driver for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745022992.12309.8523589012717581871.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:29 +0000
References: <20230615130049.GA979203@rayden>
In-Reply-To: <20230615130049.GA979203@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 15:00:49 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch to the OP-TEE driver that replaces
> kmalloc() + memcpy() with kmemdup() at one place.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Use kmemdup() in OP-TEE driver for v6.5
    https://git.kernel.org/soc/soc/c/3f711c249032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


