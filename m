Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E1C54E5E
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 601A5C4166C; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A580C43601;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=hcfH0TX8KTyksUvMP75L2ieC/ZK0Qy/L8ScgOagQsek=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=efLfcxjKPhKfp6/q4H0cA9W2pEz6HyXSV0cGsC8mBotSinFLtv70O4HO8nOIOEMEk
	 +e8BIBs24Mq2JfkWnrDbTgU6GAtA4qgbXkX0SpIEwPN6wj5ipZGLlY1RSJO47I511B
	 6BqJbgNQpERyqVsd0yVlZNjekRcur9CdvdxNMwSI7oqqtTEW/g7JN2tMeEYHKVq7pG
	 sIZGMN72WlFux4uEWY/uX8DMQ9f7EwNBNd3QXrWE9zk8sNdwf5VpCj+zYrf2c1xXxk
	 MBZFfAc6iYyBnj6jR04FUukpU75lhNjo9U74wchezFwVivsSOWz3TOSNlKL3vsGcm5
	 XI0H85S/ITwVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33FC9D9A4B9;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872021.25915.11060658275967921902.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240225030612.480241-1-andersson@kernel.org>
In-Reply-To: <20240225030612.480241-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Feb 2024 21:06:11 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.9
    https://git.kernel.org/soc/soc/c/daa0987e1f8c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


