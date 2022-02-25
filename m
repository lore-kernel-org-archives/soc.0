Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54325C4167E
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 304E7C340FF; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16B82C340F0;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=fovd6z4CB00Sr1C6U29n0MAFLTG79A3Q/G8q62d01bU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m7IJ9LRFHCJ2VQBZK1ic1vorawmtfJOidB1mmnIsHvXUXqcf2oOl/xoRnH0NJX30s
	 VlpHJt4XCsUS7eOZ+x3nqiZWqWzRWH/XHAnlXFpy7fB71gJQPAGwIaNi9by5GMP8B2
	 c6JX67f8VjyX175SEngZWb/JlYBRfoufZ76GFZmY9waKLk7q0aqqBbAA0sYPTbxdVA
	 NVn5AM2Odr2UZMKRm4yYU7nN3Hs3jKIpmfT+bgbhBpWnxqbU/UWcZt7/rEfIYRlLi4
	 227GnynIHeXG/6iD0fAeRd7DVKhqqGTI5rExIFjn8uRk176ItFObv+LrNXKPe7soxT
	 R9D71D2kIbW2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3A93F0383A;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966299.15608.269906848119373544.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <pull-1645606669-127734@atomide.com>
In-Reply-To: <pull-1645606669-127734@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Feb 2022 10:58:47 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v5.18
    https://git.kernel.org/soc/soc/c/e03e97d5b454

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


