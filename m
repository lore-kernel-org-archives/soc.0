Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E67DC49EB7
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EA58613CC; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EAC1A613C7;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=mNgTRDlAmhTLBbSLhlkWGvpTZs8hbqW7zLTITyzrlew=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fXkYpJUnKifATd8eNkbA2regmTBcJi61rVVYgUOnefr/4t9paWtJGywhgV0UbbJnS
	 FmTSbhOgFUsEbhsmpmYA0Mj7qLeberNI/u6nkma/WYZ3g5TpwzAg1cY+8gZU4KDn8E
	 EwuxWI6vEUeCmxLWLcCCtIO8H4+Wdkm4piEVf0XpStx69H7jpFEEXfHGBmKEzCSLsH
	 VQ7KtCxLYQRM9cwsP3tJ3ol0KpsiFigSebVnwNHbnsk9morcJiB1wTe7OG0M9Jd0rn
	 q0lqi1RxBmIF6V6iAKn4Do/vMNYMlUG73hlYq03rY7QrLGPOiFBaoufI4lXWGJ1H0x
	 Nxx6RbJpX/ytQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E46FE60A4D;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: hisilicon dts updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241093.24025.5364751974190086501.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
References: <60CBF408.7040302@hisilicon.com>
In-Reply-To: <60CBF408.7040302@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 18 Jun 2021 09:16:56 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: hisilicon dts updates for v5.14
    https://git.kernel.org/soc/soc/c/79eb3cbf02d4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


