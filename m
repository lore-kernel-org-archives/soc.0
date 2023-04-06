Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4E5C77B71
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BF70C4339E; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3637AC4339C;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680816631;
	bh=gCR6EYfecwWEVrPu4EKMWiWEwcWW4dEWWV8spPf/pu8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jINVi24n9cGjH2pUfthJ9rMBRqa39s5BGiJf8FySf+ppfTMGyaCkgQU4UBMxTsxgN
	 7q5Z0y8IyV+Kl79X3XFNWBIvAtaD+5QS7iICFpqEkIbue09EaMWEpQol/XMkc4KJNU
	 AvjWXuUSLvqtoZx5kpdBAFcDRDAtmRes6ixSkaNkvDzh7pDtUlb2a+9xMMnUXS0zen
	 a+8oro/EtuLgQ2WUZMajeJIpQL/D/eXyxNjz8wtBigHfvJP3Seig186e3eRVhkkiJw
	 30zqAZXwh5ci2t5bHSXbvD1FhDzFAH+nEyTyZ3v1/R5oYH6YHlYTn6bRR1nrhvSe+4
	 XW48yQlAfajiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20184E4F156;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.3-final
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168081663112.18696.8209555222598882400.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 21:30:31 +0000
References: <20230406-negate-octagon-0fc2e47dbde5@spud>
In-Reply-To: <20230406-negate-octagon-0fc2e47dbde5@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 18:36:56 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a single fix, it's been a quiet window on the fixes front!
> I don't have any urgent fixes on the soc side either, only fixes for
> behaviour that cannot be triggered with an upstream kernel that I've
> put in for-next.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.3-final
    https://git.kernel.org/soc/soc/c/4f7e22b8b634

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


