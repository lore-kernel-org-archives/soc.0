Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56887C46467
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08AD0C43470; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE52FC433C1;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828261;
	bh=B7vVAqzi4UJn92skkDoMnrWmNZtuJ1CuLWaf7xC6xwk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VicCcMGgRZUJ4TruQsQbb7rvFYUf3lmi8+Nr8NvuWfZniAxfKD2KUKNQCQywnG6Ot
	 tsrYr9r2omXbuwHoehCIBbYemOCGgKsT2n6CTxbRaqrrCX4WXHUMOdz6b2fRvejyMV
	 TxN83pGzfq73EdVnP/C8edZa++jtd6Euuu68CjQYhW71pwvionWYcnztTrywjmcX1X
	 86z6Ye3NuPAz7moc11zjPDgkI2dy8r8s3RvRETrGWRqrR4fiNqWqpGKBecdH/UJCRN
	 MuYFdZ/qJ+OuKxvqDbKrRo5iouA1dmK+xP3RwRk/VcH2DUZSf66BdyXcV5u3semzpI
	 mZmOdVpx2hzxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CAAB8E4D00F;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826182.9936.4785839894893510830.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
References: <20221129191755.542584-1-f.fainelli@gmail.com>
In-Reply-To: <20221129191755.542584-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Nov 2022 11:17:53 -0800 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Broadcom devicetree changes for 6.2
    (no matching commit)
  - [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.2
    https://git.kernel.org/soc/soc/c/9490ae741db6
  - [GIT,PULL,3/3] Broadcom drivers changes for 6.2
    https://git.kernel.org/soc/soc/c/69a485191b00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


