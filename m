Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CC2C433E9
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B5AF564F9B; Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E94B64F95;
	Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612356006;
	bh=7iE5IXKxYGr/ymK9B9KJ9boKQzbw7GX+ZaeV7FFW2W4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=W8LC5Pln/DlkmIp9rTsBul4QElGAm4X0a6v0rKsS1YpWrmpITnBu9la+PNlFQxGG7
	 /olFTIYT7xI4LVquv0+qzyIhI6CXp6n0c14TUC+ZyZbSBde+b02NOmxQxABHNlehB7
	 hvkQCl4MHFQ0tayvOULZNoPXAs/tcfsUgavqSlEkT45T6ijRkT9+9w6Qwze9bwfznN
	 OkKisFRFIfvZBtKHxw25Bhrt5fMSdp6Jz6DBPALv09uZlnC0Pg8ypxFyKtZf0RcYiC
	 yuGl8Yw5Kw8KM9ENZv4RTedEL/+4wWvbb2pik/plEp27xQzqTF7hJhOJ6CHNSFgQz3
	 2kWOx6d8lHZQQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8CC3D6097A;
	Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE housekeeping for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161235600657.28451.485980527664267011.git-patchwork-notify@kernel.org>
Date: Wed, 03 Feb 2021 12:40:06 +0000
References: <20210203120742.GA3624453@jade>
In-Reply-To: <20210203120742.GA3624453@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 3 Feb 2021 13:07:42 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches fixing some comment typos and also a larger
> patch syncing some internal OP-TEE driver headers with OP-TEE OS.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE housekeeping for v5.12
    https://git.kernel.org/soc/soc/c/719bc64061a6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


