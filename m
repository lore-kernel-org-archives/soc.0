Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7058C54E71
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACA50C3278D; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C78C32784;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=Jbu3YyQBHLEZJrE5AHxkuJigSILUurbZJ+RqS5A2xZw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=M+VG17Zs6yM9rk3EHwKi3ackAYTDSVctka02lffwI1f5M8o9828+7/rbOu0LkNxmb
	 BFvIJjil15qZuIVCp+rJktCSWel2y4XfPv54LfFFE3EiW3HW4rFHA+5ccEixze8Av8
	 DlAbPeYh4qeQ8ch2nGYWYQEICGCIUang+IMBud/e7AYPZP3nTwLQx4QaqxOWuQUu+z
	 JdrBfKxC6jlMfa8toiyzEksh93iwTQGzi2fQwhKy6+Ll22LP55Ek1O3qCE8T94yBM0
	 SBN4zgzeZD/+Y/L/5++jdTWy7WZKFsNEdoYZEx71+awnMcTye6TiQoumwZ0jNIjh4W
	 46xrVAGz7jZ4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83666D88F88;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree fix for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872053.25915.13436869809869641635.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240223205450.GA8881@jernej-laptop>
In-Reply-To: <20240223205450.GA8881@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 23 Feb 2024 21:54:50 +0100 you wrote:
> Hi!
> 
> Please pull following device tree fix for 6.8.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree fix for 6.8
    https://git.kernel.org/soc/soc/c/aa8bb984f786

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


