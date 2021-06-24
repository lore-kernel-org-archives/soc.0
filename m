Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C48C49EBC
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4F3B1613E0; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2EC71613D5;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=Do49/hKCBvMiJJRfO5xZQDWpxlLR17o5t1N1SxG66b0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FIEEHQMj6wd7zvWLNQQn1TbMUavEpHT55W/aAy4IZO1XiM/tf8EK9F4cP1MVBxelp
	 DZ1KJPn6vjcxdpK4tMwQjnSMl79GD4QVlhlF889+a3aS/9a+9hAosnHSXBjW9gzp3M
	 9XWuQ9Pz7jKa5se069QVNi2v1DjGfqqgzxOye1e8+QHlAl55noZVJqEqpqL7mGVidL
	 tzX8y9CVA5NMWP8GqzXNYeBjGruPKoIa0YhELpSeSG8/x6Mp90wQ7qLQQdmMMU+pqK
	 kFgSH1A/4dlsrx8gf63Sw1h0icp+4Pdc9b4YaBMzFx3zEnNW8uiQfJmqb/2QUR4lia
	 fClnUdj1Lb2hg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 263006094F;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241115.24025.2184996735208107267.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <60CBF4AE.7040301@hisilicon.com>
In-Reply-To: <60CBF4AE.7040301@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 18 Jun 2021 09:19:42 +0800 you wrote:
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
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v5.14
    https://git.kernel.org/soc/soc/c/def0c98367ea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


