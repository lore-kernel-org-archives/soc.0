Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996D9C6FA9C
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A0B4C4314F; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 240F5C4314B;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950027;
	bh=gA/EF4FDGi9uvxU1GFbVNAK11MQXyqDZYbNUuDSIegA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=i16G5VuCarWLHvncz9j2NChU60ADu9Oa8kRus7fxb9bDOU7dJzGKaIYEgcOPgOVwi
	 jj7H41OqYAaxJQDugd9Tl92OhctBaFQvgS1ugs2AneJK0pslNERdmvrYFKqbYKl58L
	 B8OOa2gpgdy9dGaqSN4mw+qp85l/qnNh4LATvr0kQ5rDtGeeB/tcc2hd/0zj3QcfdF
	 84ve4ljP/yg2P6wc4EzZ5JkwegVOkL9K+DEqjkZ+GKnxbNEyC3S2jrWbLhJE2RFKUv
	 EytJbozgyD2WCY/cC//pQQjUv2w09gEfrW8meN/5H+XZEM9hJjoldLlP5Wl+1mvEfe
	 27Zser5KWWsaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 115C3E4D03F;
	Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002706.3905.6098810120504532578.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:27 +0000
References: <20220921155753.1316308-1-andersson@kernel.org>
In-Reply-To: <20220921155753.1316308-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 10:57:53 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for 6.1
    https://git.kernel.org/soc/soc/c/37d49c249cb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


