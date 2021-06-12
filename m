Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E3C49EA5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72C48613D0; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 58CCB613C6;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=3mST7YIkHkwB0HowLD2puApOQhwzxBjwnF5oy50EDWY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J6TeqfM/JMBX13VmRFH/47CiUBwGVuS2R5xVAX7jeCmFhdyhieRKerkD3mT7oK6jo
	 9xpQPoRqjTdohzjvrQ0Cn+pH09G9e7x3i6oQYz6hmSzpm04ft22O0G/4FcJSMSxTWL
	 84dxlGpdmTw4sGfi9ztHPdf+t9si54drgsj+s4iH762xwH6ExUSPsAfWCnqdpvEkAp
	 HvuZpWDI558feI2IRrXPW64LMmGc2isNSBrjT5qCqhB8kLDBtGCPMyJ2HuE6gLxhwa
	 ob7hGTndbEeodjuz93AeHeXzqRTSwm1Pq7Ke+Ns2hS994qba3mX30d6GBUkewcMv6c
	 /NoL+nvHF6pMQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4A39760A6C;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Cleanup for omaps for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421629.27448.8226037372870488420.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <pull-1622618286-677305@atomide.com>
In-Reply-To: <pull-1622618286-677305@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed,  2 Jun 2021 10:19:09 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Cleanup for omaps for v5.14
    https://git.kernel.org/soc/soc/c/8639a12370ba
  - [GIT,PULL,2/3] Defconfig changes for omaps for v5.14
    https://git.kernel.org/soc/soc/c/3082a78502f6
  - [GIT,PULL,3/3] Devicetree changes for omaps for v5.14
    https://git.kernel.org/soc/soc/c/2d08a11e2d26

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


