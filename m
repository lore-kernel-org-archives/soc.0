Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BA4C25B6F
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0E7DC433B6; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B98F8C433C8;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=0iROfHPMlhmi+rd6GZ0fiIVlXOX9OjdQ/Z7fWlVvt5U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZAEvxtHHCAhQ71c1rfjd9S/4r1A6jOmWoyygvRDMW5ILNx1dVdSu5Tt1teV4SPVYN
	 PDZpHIOjop6wBZLR3cB7R6DtSLwD53chO+RsaQr+08FzX4UE+lK5RvhfaM4Q7cZZ0c
	 oEJjFXmjQrNMFaP3s5l7xf7VHGpMJO2akJZdVrLGIsI/eCgSOYJ24BzXk8e8SiZATU
	 TlohxwX7Qzl7+amobCQUniTq+90TyiPIAvUGKoTVvZln27L3nje5c8zMgDvA40/ED3
	 Vn4lpbVu0MopA5Bq8Wd1qnsdEogrMFaakf+1lnaPnuW5q81MHJnqUatTduW3sQmqg9
	 dHiNHp1X7QjSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C255E11F5D;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.7 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882857.12441.8140534577857283693.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <2777623.BEx9A2HvPv@phil>
In-Reply-To: <2777623.BEx9A2HvPv@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Oct 2023 21:43:12 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> after the first pull request there were some stragglers left.
> One new SoM was submitted and the DFI driver changes were merged
> into the relevant driver tree.
> 
> This pull request adds the relevant changes for those.
> The commits should be in linux-next since the 19th or 20th of
> october, so did get exposure and the changes go on top of the
> previous v6.7-rockchip-dts64-1 tag.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.7 #2
    https://git.kernel.org/soc/soc/c/c505e1e4b10d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


