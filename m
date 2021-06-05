Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC54C48BD1
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 471536142C; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3077961428;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=l9jX7hHy77jlZwFiuc9frD0TVjePBNuA7SbaxUw0Jis=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M9DL7srMVWmqs2Gl7Xe5jPZfYbXHAsKVjNsK5TAN4T+yrr7tSwF88h0ad4LGngbHb
	 owH599m/DVQW7OlctcDTDJcn9HeIjsPVrEzkMOm0A43/CmAphj2n6jsQCtpLsDMdJJ
	 dk8meNQXoxjBC1GYj8OwA3seSob1RtsqXNCeL2jMXrYhzX+mocpv9e9wbJylAiK9jh
	 JRfr2QUip27CmXcg0wznhHOZ44T9WehGb9Py+DhR032W8afuKHqo87sre6A8gXSuCJ
	 tPFZ0I4vzg5CTdfgGeCL5fixow5u8ubk0QT7J68o8UNuX6YUQ3ZzdjTLBu+FGHBaVd
	 R9lzcBQGAA9Qw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2A9DD60A53;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402617.32315.8496115685197821881.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:26 +0000
References: <20210518100712.GA449561@jade>
In-Reply-To: <20210518100712.GA449561@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 18 May 2021 12:07:12 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix which uses export_uuid() to copy
> the client UUID instead of making asumptions about the internal format of
> uuid_t.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.13
    https://git.kernel.org/soc/soc/c/7468bed8f850

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


