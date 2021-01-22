Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD02C43381
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1751123B1A; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 003F623AF8;
	Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356413;
	bh=5JtWli4haAPzN1HweX5jyKQZz3/xljVL5ezPgMwTbfg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=r48KpcmCFYva8VvfQK4OOlFgTm6Pj/YW1lCqp4Enm6d9/WbVucDwUf/BGsnQMmYQn
	 Wh2ZbQtPnMD0wNmeYjOcQonzSJA7Thl91/c8kvMpXYfsLiHf4s04kKlnhAIHKwJhz/
	 VcYhjYjy5ZNedn0+ma0TeGClAsWSl6uNqmaaOl9aFND3vYsRjlv6iTZlbmyO087CB6
	 sFVfDy15TdPgwuyBh/JM9GM85hnVuqIybFVq1ZQPpZQAJFsCfdLWMulykWpXd2liKE
	 HPtBwLXQHiidtKSC33BKOkpWts/MJvXf/g0H+rpTAJyIwUFJZoKtkoY+/DgrRQ0iVw
	 i9mU7j0ox1QjA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F045F652D9;
	Fri, 22 Jan 2021 23:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641297.29035.4110821958792262645.git-patchwork-notify@kernel.org>
Date: Fri, 22 Jan 2021 23:00:12 +0000
References: <20210120174356.cnxopzjjpqo5e3ws@bogus>
In-Reply-To: <20210120174356.cnxopzjjpqo5e3ws@bogus>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed, 20 Jan 2021 17:43:56 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v5.12
    https://git.kernel.org/soc/soc/c/e6babd8dded3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


