Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43541C54E55
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28A3FC4166C; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 123D6C43330;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=EJQ8CnYYRJBav0iO+4D+ZkZle1j58OEUotPlPI9VIsk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fNd9MDUdKHD12hgeBUXzHzTA9yGEwMf1TEjcnw9L6dQsjzJzPwLFV3503+rYuuJyd
	 IRhFkXiEGmKXNyqm1wn1hUjOn5XUnKqFyWDOAPWbcVRYjot8lFEX+seQd3MBQ4sQKi
	 I06WTna/0t+zPYu/O7n1t6tgYvhlAKsOGSJO+IFpG+CBBqRx8eZsw4uTQxEMmIO3WZ
	 QAuMD37d5Dv7Yw3T/BKLNDcT8T7zuW+Mb3kvaetlXr9Qtpsbg7y7RmDoGvDG6fW1Mm
	 SEx240llWaK27do0lL28NW9f4dWNHcvnkN4hztIMG5NjvD996QZUfCvIGAUjf6qtRO
	 I3Ib5LawDR/ig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6756D88F8D;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX SoC changes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927493.27833.2231406157391271668.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
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
    https://git.kernel.org/soc/soc/c/911c87949c0e
  - [GIT,PULL,3/5] i.MX ARM device tree for 6.9
    https://git.kernel.org/soc/soc/c/a634daed6917
  - [GIT,PULL,4/5] i.MX arm64 device tree for 6.9
    https://git.kernel.org/soc/soc/c/06d179e31ce8
  - [GIT,PULL,5/5] i.MX defconfig for 6.9
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


