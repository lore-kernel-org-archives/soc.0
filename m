Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CE2C7EE20
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBF6BC433B3; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5997C433AE;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=Xlr1h10+2Ju6N63WNnhty97OmUrzHDOa+UGH6u1irQk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hbKe1dAKR99C+F+tuSjmIPQQU4KZHlvxW+czzvOOsYWuJlbixOkVnvgigGwO6EQH5
	 bceKpxxcxZfEWoiAiZ8WWbM/+H++ovLFGFP8d3CIpQHQ1TZpCsdwCxEri/n34wpFge
	 jHhwXpc17HQ0cJtOjSVULDnJTgIs3+lT8ZKVc2rNYteFb3r2klYloC7rOMpMgI+/X4
	 h23LDmWJroSVJ2Cg3f9fMsX2+SDzgcWPNL07bgx8c37nSGoDy9JkwoxEIWpjt2XBoC
	 AaCC9L31Lmi/NZ/pohMaXkWq7FqZBX1Wv0vfBcbxWh1dEH+eP+y8aRUvb/7d0UwscK
	 W2ExCGZ/X9qwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B2905E21EDE;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm driver updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783072.23940.17188333426704190362.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230414024302.2411985-1-andersson@kernel.org>
In-Reply-To: <20230414024302.2411985-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 13 Apr 2023 19:43:02 -0700 you wrote:
> The following changes since commit c78ad8597ed961e822bf86ce7f1916dbfba255ef:
> 
>   dt-bindings: firmware: document Qualcomm SC8180X SCM (2023-04-04 20:23:56 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-drivers-for-6.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm driver updates for v6.4
    https://git.kernel.org/soc/soc/c/126c6da71fc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


