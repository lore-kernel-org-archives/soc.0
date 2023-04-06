Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5FFC77B73
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44BBBC4339B; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F1B9C433D2;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680816631;
	bh=mMJsXCo3T06/E+HWXOaPFeH10/xq0h20jWAKA1Sc8Ow=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=l4hQA9PcIRLFu9Q1SQMnWZjNItl4U+LjtJ2+/X8ZLqK+s2tiH+4dMnIfpUtiu+qdQ
	 TlyezFTPrm6Z0Gr9+V6zRppb7kjIPhWvntxDnqHdc0AD1TfIDK5LiM+6n2qhatHtgO
	 aWLBOfg+PE2sYkJp2ntOoBFsBdnwSYllvZkRDzAbqRFhJYu8jW21UOzNVboqAJ6n1W
	 vJSdLhi9MDNMaypiI3ojw7gpM7C69uPCCW1n4a6AZjMgx6I4R/hq1fg7Y47mnW+xFd
	 Gnf92e2v/g6PSyDx7EONH7ujTyombaiaHN/8eWVNUkNfh+6zMeDoNMxXyg0n2QGPVe
	 wyKkCtkD2GGQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18ABCC41671;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE load for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168081663109.18696.5634796864130222720.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 21:30:31 +0000
References: <20230405062701.GA3391925@rayden>
In-Reply-To: <20230405062701.GA3391925@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Apr 2023 08:27:01 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch to enable loading of OP-TEE by the kernel.
> 
> This feature is by default disabled and should probably always be so since
> it requires a quite specific security model to be secure.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE load for v6.4
    https://git.kernel.org/soc/soc/c/283480f0ce9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


