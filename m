Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC0AC46CA7
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF12BC433B6; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B96A5C433A9;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=feNezHdk1CsW5JdvMF13Cl5vH/qQZa7Y1U2GDkXjpfw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TLQ5Fw+gLn1gYiGk2qcwP9numkmuc1yQKCoxUNtLFTR/tJghw+RXFWRHsBZ6RIHZu
	 zbeMJOSY6uvQvxfSr1zYgVpJBeNRtHv+8JORh3y9cOoGDzW9tvMZjyHDhUi9nDxgOw
	 ycu5sAii/7Ky2b0AVgP4a2cz2Yls/jkuI7SElZwt4iT6NxfQR9W3Qp3TuEd9zeOnAI
	 X1PswP4XFt8Er0XOI+f9fbOAc2CeYGa4HhMZVu9bV/5u1IV3iqeY+zwVGZwR0LYp8N
	 YYj3NuH28yXy+G936fQ0UuZO6bbl819zz6CmIz8KYuzLoKWzjpN6wOiuQbfWmj+Yud
	 4sV89lD24rk9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 990A2DD4EEE;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.7-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954162.26038.10528504073354665224.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231130-maternity-majestic-dd29f0170050@spud>
In-Reply-To: <20231130-maternity-majestic-dd29f0170050@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Nov 2023 11:54:43 +0000 you wrote:
> Hey Arnd,
> 
> There's barely anything here, but it was annoying me seeing the
> dtbs_check issues in mainline so I figured I'd send a PR anyway.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.7-rc4
    https://git.kernel.org/soc/soc/c/437c99c25627

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


