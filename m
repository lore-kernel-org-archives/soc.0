Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9565C7EE2F
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C181AC433AF; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D5FC433A0;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980254;
	bh=FrBidRZBec6H9hBy0f/HrCqzJ/+DMg/z3g+lZZ930DM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fAl5+T21VZhW3hweOgWwivd3HOkVVSJZ6WJnNB1kTl0AlIY1hqO5T9I78BmBBn6nK
	 JXOM7I8XFEmCBr2bX1PRL40JCW7bTQ1VO/oS+eeGsMGGFZMRvOKd1DEz26U54XisZR
	 g5sOlbY4457GsfWmm8jkBzpcrNOcnE6dqrcAPrVDrVWxihMukG0e/4K+8+yJ85V5f/
	 r2GSDpLFKWuzNwvBR7voinUvrw12+S1XHugEeVx5HDzr7mHAGRKhkYWA18kAaMTnou
	 Xc6yS1+bpjysDsbaEu7UjStAu6Qexh7qAU/XTGxKdHpWETlo6dhWK8if4hsHyDg/89
	 I2Vs/QXuHd03A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8CDC9E4F0A7;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598025457.10098.4074143675566396056.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:54 +0000
References: <20230601141058.2246039-1-andersson@kernel.org>
In-Reply-To: <20230601141058.2246039-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 Jun 2023 07:10:58 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for 6.4
    https://git.kernel.org/soc/soc/c/be02e1fc71d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


