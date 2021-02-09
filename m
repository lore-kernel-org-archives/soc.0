Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96C6C433E6
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8094B64EC8; Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 67FDF64EC2;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888861;
	bh=eungwK1OVC1NuNJtH/4nnE7Cigc5le1j1qtouSaEj5I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RZTL8KNJB/z660ycF99CkN8TlC86+aFs+iP7TOiEo8nNKAgGlHWYlWhZW/k7CvPfH
	 HGFCHv2kW6sltqpNqY+d7oYG/8tOulKW9mTGY3di2odDVIU0/ihEvzVqjJcTwsDZu0
	 gnRHfVU4zLVMJ1JzNe6Rqu5N3xuQO8gzfhp9PK4pgcRihn8cKHwEflfk+l0148jkix
	 gO6m7TDxmz+YSJM3rh3VGMJ670vWlJDzxwizsghKVSSpV9Yy+D0xqepDXZzjomhD1L
	 os/dlY4vx0hzQV1ai3FUG8WxcucDOoydqy3Wb3UyJOzyc5H3kprn39MpkKmR365s3Y
	 pualZ9cJrJsLA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 641DE609E4;
	Tue,  9 Feb 2021 16:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE I2C simplification for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288886140.29773.11318358473803667417.git-patchwork-notify@kernel.org>
Date: Tue, 09 Feb 2021 16:41:01 +0000
References: <20210208125853.GA288348@jade>
In-Reply-To: <20210208125853.GA288348@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 8 Feb 2021 13:58:53 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this fix eliminating a stack frame size warning and also
> simplifying I2C access in the OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE I2C simplification for v5.12
    https://git.kernel.org/soc/soc/c/d0236f17c319

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


