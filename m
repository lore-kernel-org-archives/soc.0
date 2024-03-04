Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D976C48BF6
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41167C433A6; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B3A1C433C7;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=YBzZI/vwDc9HrkMBgiVOSckmR7zwlmjlCUcNkao0lUk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SX9bOPmWCMA1fyM3g9uDerqgJ153L733LvvQJfOMdE/YJ+Js9zrsjGEAZefntMvcx
	 19B/63b9RdvH7DR7wvgEGo2Trpb+nzqCx4eRVgOHsoiXmHfg2JLtU+2hrU7ZBRCSjd
	 0g9rx2KaqwdxUXwce0yXN08iWZ92Q/D4Esk3uUhkAZq3S/msDlEKbGH7nJZ8qCLDD3
	 JaR3EYm142No7Jvh8HJhcgx/ajPQ3JtJb7Nb4Nxcud1wFFXMg41roYdRVZNDCmy65P
	 qZdem0A/JpYH4oNzjAAhYPg3UdMhmpjG0tEeUE9yJoq0RV7ETRDsaSeZpuwZ+8LbFO
	 /fqu1IrF4lFgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0BE23D88F88;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX SoC changes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403204.23732.5602913013306421613.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240226034147.233993-1-shawnguo2@yeah.net>
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 11:41:42 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX SoC changes for 6.9
    (no matching commit)
  - [GIT,PULL,2/5] i.MX dt-bindings for 6.9
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree for 6.9
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree for 6.9
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig for 6.9
    https://git.kernel.org/soc/soc/c/e333d604a6bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


