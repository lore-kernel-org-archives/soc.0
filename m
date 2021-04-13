Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FAFC433ED
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 05196613BC; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DF264613B2;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306210;
	bh=QH+/E1txI5IBRDyN8yq+D8wPej6y2m5lOjlHXErokuM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EsyIUI2e3howGH37WnrZkSPn+TvqUkuLCHcUt0+7j1RAGKdogfs4ez17k6BObHJf8
	 xEyKYfU/OG0fa9bDA+L37f7MAGCI1JTY6SkPc1Gu134gHalnLAM7Es4+zCM6VSYj66
	 13lWgwvXrfFfnAijoAB9szFHyd12eCb3zmTC7vphuf1w4er7tmfL07XGQMLfk6MEcw
	 Ta7ZZtruEEU/lMIcoLxkwvw+Cg2kf94vss4KEIYdo/K+c7leD9mHyu88t3PSahBKyg
	 ARLreQJpg+by97WKDtC+5LmqxWkpDxmMX9Vf1HqkVCUKP9kfqlraE36nlRtUSYin2n
	 zM3/0U0czhiaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC04B60CCF;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: Zynqmp DT changes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621083.20348.6217180353436070583.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
References: <e422fa9c-3e58-28b4-f6f0-65aa44254131@xilinx.com>
In-Reply-To: <e422fa9c-3e58-28b4-f6f0-65aa44254131@xilinx.com>
To: Michal Simek <michal.simek@xilinx.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 12 Apr 2021 10:24:41 +0200 you wrote:
> Hi guys,
> 
> please pull these two patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: Zynqmp DT changes for v5.13
    https://git.kernel.org/soc/soc/c/40bb91338a60

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


