Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B365C6377E
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0BA0C61409; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E85F761407;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=FxQRqn+b10icur0FVHs7qsyOI3zyL1zD/VcMbaXXWtE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a+F+46OJ4kyvuVb8Tmx1Vzkyt72Bj+zNPfe60x2qMlFFOyZ/di3XS/SYje7xsU/oa
	 pjQm3JjHbYYwQgWERPgl91j4h1s75XLwj6rvrSPxhb9mYVNEAtL8r3OPtSiUrDTNTn
	 83/Cf9MLWs4g8UM+luBtP6mA8hzp+5Kb57GRPDKD6BohIrNHj3T5589mh0Tv54lrw4
	 4sEbJ365YwZsZWxAnTf/AaQfehRn+VSu1RlfOywRshcs9wXVhUDxUwwTD41H0MH+4h
	 SIFLngZp9RqN62aLNKjjuJF7SzYe01psjoyyDMWLFHJjy8NAqB6Of1FwkILMYteqm5
	 Jd57U8TWpi8NQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DFE2D60963;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: fixes for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052591.25202.16102351316860475062.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
References: <20210714165806.2617325-1-sudeep.holla@arm.com>
In-Reply-To: <20210714165806.2617325-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 14 Jul 2021 17:58:06 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: fixes for v5.14
    https://git.kernel.org/soc/soc/c/d28912d6f0ab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


