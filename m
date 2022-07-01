Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51376CCA483
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E933C341D4; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23D59C341D3;
	Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708097;
	bh=HxXqZG+Tmar1AKAjT5fxGBYB9BL8WUihhOotVdFeTc8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IhebHyvuJqWokUbX11oqhajm/H5whwX9zDNW2hxw8gPttxLswQOX/E/Orl/TYRor0
	 SCeIImjZZD4k2/fxWXVJEs5OF8gfRRjU7l6PHBFtLM9YJBQsNVqk8rXX33JDQCm6Af
	 WztIaK0XgLqEdi0why7mHYVcpNSqKjfFBIkcTWorN7zxRazDgsOLb7W2p8inRl/+Hz
	 oKFLlEQsJBvrTl4YH6zxIy3pjDRQjIIdCyFxR4RJJ3261rD7gTd5mz95HNiVJwQbu1
	 wBFRHuGg3BVAAVo/brK+qn7Z6ClvMqK/q05dp9lex0Vyc1B7aKKro5s1b/Z6M9tqXL
	 ZoNNQuKFppYfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F218CE49FA3;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: dts updates for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809698.26141.9097807626278208639.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
References: <20220626004437.1224820-1-dinguyen@kernel.org>
In-Reply-To: <20220626004437.1224820-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 25 Jun 2022 19:44:37 -0500 you wrote:
> Hi Arnd/Olof,
> 
> Please pull in these updates for v5.20.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: dts updates for v5.20
    https://git.kernel.org/soc/soc/c/3966af40559d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


