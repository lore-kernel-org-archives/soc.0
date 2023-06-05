Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06BC7EE2F
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD31AC4339E; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7402C433A7;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=HsAIcmF5W4zEYgXVMbTLd8pCITnj2HiMS28qxF0QdNc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ND21hUtq+N01fWezp4wOIgwy7bWtUqj0nl5Nnxy0Uy2+f4sCe8zsyIv527NZtgRFu
	 OAJ1fJvYeSc39O4DpX1yUCqHW54H3H9jSy2QFtIvKkjDnKPjh5XvHlxPptuI7ccy0X
	 bvlBD6ss/VSt5NAX5XdXSXXfAh6lveqVOITj2ilBO8J5tIjVc1BNIA7ou+iwbDviqe
	 x7rq5fGcu6lKSdGwUw8reijVDEtaOTnR1DHYQ4Hhu6WeeHLP1oOB/VlzewYtWHeZel
	 Po5ZgppKNTbipb9Lmcp2pxS49sPcQgHRx4PYKtzBKtITDKbaqqVAi4p1W6brFXn7IW
	 Ff7QyS8aNv/dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DB7CE4F0AB;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 fix for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024051.10098.571859651945326662.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
References: <20230601140347.2245680-1-andersson@kernel.org>
In-Reply-To: <20230601140347.2245680-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:03:47 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 fix for 6.4
    https://git.kernel.org/soc/soc/c/1c278f8eba9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


