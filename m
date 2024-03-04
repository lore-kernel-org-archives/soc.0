Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71529C54E6A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6295BC433C7; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CC0CC41631;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=5JxRjLu++lzYoXNyGP4QEiiqS/9bRg+Qqoq3MgAQVjw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lWQKoB+j+lSwyq7j3YYtwaTPWpDfV/EwIvkx6WBvRlC5iR+JGYGBLUNgpjw1aff6X
	 DnhhO0homRDCgT9LW8Xodesyi7n/TbxUimmDwrT/ZQ+FBNKswS1t5e6UmsSk/KFOTO
	 JU5/8Wydf0ILFAVqrHFT1unXPQiGr25YpJqSgyvFulAc9hP91ZuBPFKBTp79m9nBIl
	 UpG5tk6LNM7BKRLDPuMhy4G+IueMluE9tusn1C8Ugyh51kafyrpEuv96xdDd6dySrD
	 E1HcNdHLeLzQIXRbTB/+BCIMDSROuExDQ5QA+Wi6vWKgjXGL98TGWQy1nVoDtiyg2E
	 h8vbkhBoJafdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3840BD88F8E;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.9 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927522.27833.17818974856897831948.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <87a5nihr8g.fsf@BL-laptop>
In-Reply-To: <87a5nihr8g.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 01 Mar 2024 17:05:51 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.9.
> 
> Gregory
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.9 (#1)
    https://git.kernel.org/soc/soc/c/3a591d5f44b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


