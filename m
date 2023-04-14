Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B478C7EE23
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D77C2C43321; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFE08C433B3;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=z4YAFcTJHTz5annkeEGPcNZzgHTkFt/JdFDKEjDKBfY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ULNN+dAB3c0VflYP5SLEZ6Iy7kU4aY+lUovbL3kbrcyzwaMOSeERES/s6XSEeqXx8
	 CFkEf+Sn3QRHMdaxtha7HvMuZIbYzGCpye4LDIPX+ZEyfgxI0EzfnKn8MtMRUfFxcd
	 0FapwvKPJW4DIHkTbsfi1f+5XLwiTl6zUvzcy1sSr5OB80ElZ6JRE64d/XKmtJv2JA
	 4TD6y4JMj6+XiIhECwdizOy7E1eUud8Cujx182sg4rhC5A8+iFtWhbZ02dzvth7Xlx
	 LfGXnRq4yEMshIAEzzu3G8/6+n8rB6TfX45DM5p6pAjoCZhgcY5fKG94M2hzfCESNk
	 st9CSZmTuiXDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0E18E52446;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC drivers for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783065.23940.12659432237225494977.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230406-islamist-mop-81d651b8830d@spud>
In-Reply-To: <20230406-islamist-mop-81d651b8830d@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 21:11:23 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some updates for the "otherwise unloved" RISC-V SoC drivers
> for v6.4! The bulk of this is my fixing my own driver, and there's a fix
> in here to make sure that we don't hit randconfig build issues once !MMU
> is enabled for 32-bit kernels.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC drivers for v6.4
    https://git.kernel.org/soc/soc/c/3d3b32a6dd1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


