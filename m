Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C94C77B71
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A0E3C4331F; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23F09C43442;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=WN4GzoVIprWXU6r5Caj6ihq6966V5el9NIUqmFDkCa4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fUmmDczJELgxFvQ2T7xrtUlml1PprSs5IyslI2CSrFocIfgYmY2xs6zwikLBwhIIJ
	 I+WP+vLPFJwaLGYsW4Jy12Dl7qTGLaok7WarvHcStPyQmLephVxEHPo122/nm5khBY
	 9q68abXWdNuLZh+ArfP6lvVh6Ejpl85pEzyrqfsUeT9n4QSjQoGv+luscRFDvYAw7z
	 feyTjm0Wn3700iQ5SNp4bN79nxw9OUv/lvOfT/SYBgLDAjdvtN4CzHkw4WH4U+XSR5
	 TL1b3hmlNfztvocRXOA/eIQSLlyGyqb5dvnS4vq6O5kS/npmfwWf8cy9iRphMMTnzf
	 1rFAWU3+N84pQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F926E29F4D;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree changes for omaps for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928404.17322.13596749098487093431.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:24 +0000
References: <pull-1680180389-756753@atomide.com>
In-Reply-To: <pull-1680180389-756753@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Mar 2023 15:46:45 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree changes for omaps for v6.4
    https://git.kernel.org/soc/soc/c/c2f714150b7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


