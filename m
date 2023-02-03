Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69736C64ED6
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17DDDC433B3; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A5BC433A8;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=yI+iTx5SQhd6HSFh5xHLMItjCSDIAr9tOkl6a1zUvUc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cFqBWZMo1LRUmBtayoMVc4t9PAf6W1wyMSEbhQZU9P3OE7R5V0mqokWcCcP7QCBmW
	 5KmadZsMsS15Bsz5sB9zLG1iHld0nqzwNpBkKLSKiNIz2fLv/56pzoG+U/LWwA/HrX
	 0VNC9sXuGK4FqyzbYKatPbTVVtSSo2qq1qkJ76gc6ex2c05xEbUFYrr0wNzSH3uP6M
	 T7wBiUCmG9q1cF+JDCqTjmDOCQsk7xggqJMiwj58SK9p+YGclfSQ/jSTZcEJkxncef
	 StlhVbc6wuGS73vFKWWE78VL3TEY0NazDsGlHaUFV1pcLaOo5VzK3O8Od2SW5VgrM4
	 xC7tU6V57CReQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2312E4D037;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] defconfig: mediatek updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464485.16250.2026727731368749658.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <2330b914-8a8e-8bf3-e98e-88d713c5224d@gmail.com>
In-Reply-To: <2330b914-8a8e-8bf3-e98e-88d713c5224d@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 1 Feb 2023 19:01:56 +0100 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look at above commits for the defconfig. It basically enables
> drivers needed to boot MT8192 based boards. That's very useful for kernel-ci
> where Collabora and Nicolas has put quite some effort into.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] defconfig: mediatek updates for v6.3
    https://git.kernel.org/soc/soc/c/40445d093e30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


