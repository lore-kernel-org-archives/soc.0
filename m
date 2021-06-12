Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DC7C49EBA
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C34AD61403; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AB0F8613F5;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=onoUURoLY9xN5uJpwcyV6ESZ4IU9tPxt1vk1NSSmAvE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AXSNVm0Dq32wC37WOMKD0z104oITH/w+6oTQEKHGK+AtCc+jqc7mlWdBBGlLQuSuc
	 D2bvdHNN5YZbvYBNpPlOk2tArrFpxObX7Gnu+TCXwJ0yAunY03nRlN9f7ROKHhD1J4
	 O8oofPwAC1uXmt4lkE2yvKDVw3P/vdtiKUt1XIrOhVx+O92gHA+M6AIzrFE5eiRbqr
	 ApW2GUPIm2+cPDIPoBbiJ3/U4jVXDhYr+975P9H28mT1WxiL8TJA9aroWWR2u7uebK
	 A5RAGhLa2xFIZbHdDMbKnsIgz5cn/Mnt+Dy8Q+jxQwckne4P6FmebfyYYmyRh2pjh9
	 NAxpx5n1z1l8Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 99CA160D0A;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421662.27448.16884783743837676669.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <479ec9ad-95d3-ce91-8243-63596c4c6676@gmail.com>
In-Reply-To: <479ec9ad-95d3-ce91-8243-63596c4c6676@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 13:03:35 +0200 you wrote:
> Hi Arnd and Olof,
> 
> 
> 
> 
> Please have a look at the soc driver patches for v5.14
> .
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: mediatek: updates for v5.14
    https://git.kernel.org/soc/soc/c/97a566676874

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


