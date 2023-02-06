Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BDC05027
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3554BC433A0; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F55CC433EF;
	Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675714819;
	bh=LBGhP/wXlZfclkVerPc/0dklUsamTc6mpKVe1+AbO1U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gdQSaBcWLIxJIMKsu+u7Cv5dkzoBBsoLdkifL/5CFbVYDHeQ+nMyrdIqSPAZqJUs3
	 sBS4ztNe+SR54hW2OafMMbSCws8OfKiYj6G7q+KShnD1mIjzDD53q+EiI9RoVbU0pm
	 pvEjX6KW6ohibQBAvM/XOEAvHOv59r60QyH/MPf+nRIA5WdaJqpJGJg7IhnsI6QnbF
	 1NdgXAUDS0m2SmiCGit6I2O4ZbsSCVLX+2yBNIxJ06gTdtU5QyGj2RzWYYPmvJvqMq
	 sNkU65bFHxcr0QTL5CKljRY9ozjuk/PBqRJn1ZVlbEzx9OE1Yf90z0jPQhwfe7Y3yi
	 6seBPpWqUWn+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F20C9E55EFB;
	Mon,  6 Feb 2023 20:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TI K3 device tree updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167571481898.10318.17373590637962575773.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 20:20:18 +0000
References: <642cf238-43e5-d6fa-68b5-a9dfbc0277bf@ti.com>
In-Reply-To: <642cf238-43e5-d6fa-68b5-a9dfbc0277bf@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 Feb 2023 22:20:23 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TI K3 device tree updates for v6.3
    https://git.kernel.org/soc/soc/c/f7401f6bc7ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


