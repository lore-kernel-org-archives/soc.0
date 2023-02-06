Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82173C636D3
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46BB2C433A1; Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 285C5C433D2;
	Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675714819;
	bh=GtS8TrmR5ZhUiAePdHxh1NKPcJsRd8blfAwnVWXhSt0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o+SQREKl8UnxKyKKN8ff69keMsvLlYcBqLoklZ9DUZkVkRwZtbJWlZmW6a0MThoy1
	 c7lf6bJY7G/vRBI7NEXV+0TRBdLOQTlnT8e3gTDOHyJB0v+sweJXaucFEgYQd5nmIo
	 7kIoQzw0Zs8Nrtbagki5mVdL2u9BjN1icnqs81OTUiaoaz7lKJ2aX3zOMd17A4gkXt
	 +w2q3xJGIW8zulMV1NU2E9uGq5kTjpi/IoIrr8Nxl77McNSifipLnRZfx7iFVuwJQK
	 821cn/I63Ovsf3l6XuqEE8CKR7JXLtUEGfodtCmq2Bs2mPLuYPsP8ZTY7RHeyT7QlN
	 YUNF8K42Bc5eQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04F6DE55F08;
	Mon,  6 Feb 2023 20:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STi DT changes for v6.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167571481901.10318.16874906623628209780.git-patchwork-notify@kernel.org>
Date: Mon, 06 Feb 2023 20:20:19 +0000
References: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
In-Reply-To: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 Feb 2023 14:52:09 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STi DT update for v6.3.
> 
> Thanks
> Patrice
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STi DT changes for v6.3 #1
    https://git.kernel.org/soc/soc/c/89e5dd41c444

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


