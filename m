Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B9C3065E
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4529BC4AF18; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F012C4AF16;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500464;
	bh=2Z/EivEKGUdG9tGMEFXoqGSyWCd178j/wXAG2SiylY4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=te2DyfleOohu9C0p+wLC0Y4tDc5ybkO7TySHECWQ3ffFunvLL8eLDP64UYs1HL4Ql
	 a1pN0SxwNXoQSmR4pOALMwESylARQsdJPBXrnYFhkuf29T9PgpxNW8qLUXXKXM8UrH
	 lcbg3mcmn0OM2/v4/cPWsbomZgiKXcyQFkTx4YoEPnXSKa10l8OhdCCAcG8LZcKC5a
	 7uU1h45sEFbBSmiqIQMoKC5s7TEdUibnf6D7sFFkv9YHxT6BFV7YKfoq0hEHCg6Aaw
	 2vvUSVjFK9iUoBioiaTVCXFpxUkF/Ti5U5Cqf3xJ/9wYtP8lyYjl+OvGNX08EDYqls
	 y83Pk9SgayOqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23C8CC433A2;
	Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE add notif wait timeout parameter for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046413.29698.16595239502677808247.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:04 +0000
References: <20240627095325.GA2585076@rayden>
In-Reply-To: <20240627095325.GA2585076@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Jun 2024 11:53:25 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch to the OP-TEE driver that adds a timemout
> parameter when OP-TEE is waiting for a notification via RPC.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE add notif wait timeout parameter for v6.11
    https://git.kernel.org/soc/soc/c/30c577a852c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


