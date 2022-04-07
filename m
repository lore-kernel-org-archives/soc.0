Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA27AC433FE
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0598C385A7; Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 890C1C385A4;
	Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334899;
	bh=sJW6gvQ0WNNzgF3tOH9HY+elb4WsAxRP1lELAyeC/S8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VsHgKBHOE+p+GnpYVDNd75PFH7QdpybT012Bh8s1nQzlTyyhDOdHDRKmMdRDy89sY
	 8Mak38FjGgu/AmxgPybAzlXOG6h8QMY26UMBTcc9OS1A32/n5Gyvuh7KR9IkVR/rAx
	 BBd/P//KV5mqh4OQnMsRWakLeWQXRpNjiivVcui3LVbH2NLEYJBmkC+YZQ+/dFsUAw
	 O2+BmAOZWVzgFLIcKZIujp1XzdO7dhC1T7BPiqJjzc+wX57OeBYJ1b5b7x4fdMSXsY
	 tftb4VM7sdB5IVcMZC+To5iGmqQwKFn3OUXGc98nq8FsQfviyXTNs/9fzJTsCZOZLn
	 4ljrWkyk/U7tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6CF1DE8DBD1;
	Thu,  7 Apr 2022 12:34:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933489944.10369.11037745580002148898.git-patchwork-notify@kernel.org>
Date: Thu, 07 Apr 2022 12:34:59 +0000
References: <20220407110818.1436181-1-sudeep.holla@arm.com>
In-Reply-To: <20220407110818.1436181-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Apr 2022 12:08:18 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.18
    https://git.kernel.org/soc/soc/c/f455742ae2ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


