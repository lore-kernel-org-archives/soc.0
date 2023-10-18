Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38762C46CA1
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29337C433AB; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11FCBC433A9;
	Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643634;
	bh=y8dKFLz/VpIrhN9xxVuDxRfcFBFaTOlBaGS63pn39ew=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qMWYAPn+3FqiUr3oRIIYSSWMVKhCZnQufu/tzsag9LRoPsKFOpe2LEY6pRluK8kXr
	 7tbiQFEElKIo7sEK9ZwI9Utvm6Tny/yAzC30Bk0l7yWXbGY/t15yRwtpCTK+Vlqa9e
	 VfdLyoWJdPbhayDjEMjFCK6LRN5UdubI5mOo8Q5y4dMlcUkaYS3nqN43ZvCua0JSZE
	 f495QdbZ1zQnFx1+zakta7+4R7dA6lKk2ZBjgBEBbPassl/sbQH29q9uwpWG9ZHFKV
	 yuLPK69mTWMxkFiH4DmqiPWxccweoVPKLBDiiDjegnKXzPEMwFcPxEw396xD+HYsda
	 9rofXHiUv06IQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFAE1E00085;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363391.8197.17530583895096617219.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
References: <20231016-filing-payroll-7aca51b8f1a3@spud>
In-Reply-To: <20231016-filing-payroll-7aca51b8f1a3@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 16:34:34 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some DT bits for 6.7, summary in the tag and all that jazz.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.7
    https://git.kernel.org/soc/soc/c/79384a047535

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


