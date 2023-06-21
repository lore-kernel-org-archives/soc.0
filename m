Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11F9EB64DC
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E53B8C4339A; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA246C43391;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=VwsMktNdO1EH14uVQs+26RloR21GLmTRp5m62NSNtSc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l0Py6M1VT9oDmKmgoj4lcnYeyInBoP7PCv5ps5QcLuXrys8Dhz+ts2NnCYmm5iv8y
	 lPw1TxK+l14RWQS5nSawPnV+PVylhqAbWhWo1eg7UulB4FzN/Ul2bgyjuMfe9osKty
	 QSa6DoOfXiK/dNQia4sN+q4yjjQ3aq9d2/6G8/7rJv3J0f5giGIcbi3QRe39+G2D2z
	 fO0MkUvEyp20nDXSeyfW4F/06FI6zaqOAwFytzdfsvbd5HHJEsSISrVgWZePFXT4rY
	 fAMHPQ6nvOuOKvvf93tBpd5u8VD3WXgvD9AjfsOPm8Hkth87wLjKIcmtybBXA2IXGu
	 S9KR1kCxznxfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6129E4F14B;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] ARM: Move dts files to vendor sub-directories
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943674.9834.8991614075860569440.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230621185025.GA3197738-robh@kernel.org>
In-Reply-To: <20230621185025.GA3197738-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Jun 2023 12:50:25 -0600 you wrote:
> Arnd,
> 
> Please pull for v6.5.
> 
> Rob
> 
> The following changes since commit d8ece8b832276756d32c310fdd76835f8046071a:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] ARM: Move dts files to vendor sub-directories
    https://git.kernel.org/soc/soc/c/a4bd03e7cb78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


