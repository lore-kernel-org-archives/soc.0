Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADA4C43332
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3264B23B27; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C2A323B1B;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=rDjf7pkAFdzqls+4msExYSOIO4xcsC0iejEGlatwiBM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g1r7Q4ZifBwHvqNChy87BVwg+h0N5Vu3nfC9a/NvRWIGk7gO+mEWeszIsFKuYxdTB
	 QCF1tbdHLle2G3jGOOTJ2WIjxgj++oSvIgRxiPXN1P1EmFIbAIBRh4x+1HzAyaq/i1
	 TMXYrP890gHwX/wXaxuDjNYPWnfjX8eRQaPShnkbm/Fs+5sPEIYfrBeXo5+KbcWoy7
	 I4XuuasS/Obbu4wLxtISy+4eizX8SoYozl+VvKV39rYtkXNW/ijBwNZEe8MEb7uvKs
	 Nk7GRpk6hBlKBssWV8602TFIW/0DW3wQTjnkzEl05pSLmbd3fO7exgRUB9EgUJEeax
	 dBCU+rrU7JQCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 18AD2652D9;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE driver fix for v5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641309.29035.16460985067726678326.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:13 +0000
References: <20210122074234.GA1074747@jade>
In-Reply-To: <20210122074234.GA1074747@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 22 Jan 2021 08:42:34 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch taking care of a rcu_sched trace in some
> corner cases when OP-TEE is invoked.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE driver fix for v5.11
    https://git.kernel.org/soc/soc/c/156d02914b7d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


