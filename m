Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17577C49ECA
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 76778613DB; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5E14B613E3;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=+9+uqfanGlsQqp0oDsFxzhaqqjm4/rashr2QJ0MUovc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ila8LzNV0r2J39w1vej72Wj7nQaRa/Iws5YjkU8Ma5sz/PJ6l9MBsPuXwkXp+j7MV
	 +fGuoH/Y8Md63zELBvgWHAnirQ6Ef1GB4pSs05Xr+HV7eDISt/ptWJNsxt7pw3iKxr
	 2WlNpcW+P/hq4XCKAZ+j/pigbFxZA3V22BMJbJRkBjcuvDgt2ipaDhMMRCf79hbQgl
	 27KKrzMo7yhlYANGhgIKXqaGOIy8RxpjxRLEEe04vQxewsNi7NKvW7uwtFMeUOcrt2
	 z64zokpDZbS4LHf2hJILxk7zB++kM1ctIoY+egWPV30ZKbftrAVJV08Ofk7wEnnQsh
	 5iC1LpYOj1+tQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 53B9160A47;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE reviewer for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241133.24025.9432794540255991469.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <20210622130454.GA2196996@jade>
In-Reply-To: <20210622130454.GA2196996@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 22 Jun 2021 15:04:54 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch which adds Sumit Garg as TEE subsystem reviewer.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE reviewer for v5.13
    https://git.kernel.org/soc/soc/c/048c958f12a2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


