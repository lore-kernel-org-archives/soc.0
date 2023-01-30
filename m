Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D817DC54EAA
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9725C433A7; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B95C4339E;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=zFAF60e1wW8TKaPtIP7pHYOmnKPPnOzpjZ6OI1iJ7jY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RjDjgrLamkYuzZfCjL1PWasvtIxjstlavPfxLGdDfX0RF5BRSx3avzzSrt5JEesWF
	 x1pSQpvsW7WSfwaMrAnpDxOndXTFWNYGRjpQpC7JLHTmO3701sHZDQoDbDfKdTkhtb
	 nr4ih810hCBImGEk5FlNXrQzub0BKXGIoE8YlYbwXhFRFNp9aG7uj8ZpP7KPmB7JaQ
	 1Ta0xBb8qJ/k7HhdwQAEGNtJrTfRqyBxIRLTi34rBUvgHd1hy9potgPe0Oyd/hIfTS
	 mJhJm1v1mqJxiWs66svcLsTlG/E58D/L30Rk6gnbfuQy86KcLJJHV7wKuSjatHWrzc
	 agrBuEGte2tHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 695CBE52558;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786042.29049.15012710628697040490.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <61700737-c226-1c07-fba7-6dca896fdab4@linaro.org>
In-Reply-To: <61700737-c226-1c07-fba7-6dca896fdab4@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 14:50:39 +0100 you wrote:
> Hi,
> 
> Here's an Amlogic ARM change for v6.3, DT fixes and L2 cache addition for
> Meson8 & Meson8b.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM updates for v6.3
    https://git.kernel.org/soc/soc/c/551413fe9388

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


