Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2200BC46CA1
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBB59C433CA; Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A03C433C9;
	Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491223;
	bh=2JmrevuobY7DJEKuFB73KBrvwbWMlcRI01+3gQ2MRcQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZqoiI42Wm4nwdbCWUCPAheMnTJpTO/2u03bep4vADpsp1s85gwvIooEk2c7B+p1M4
	 o5OW5V+C2IYsnoPgQUKNezocyLT7b4c2WPdwOkQ1kRZaaztUtgXaeqkIXdZLWzj+IT
	 FMJkyu0GZgCsgZzqhtA+WtE7x6hZOhgKcxQ+qfCP3dLW6CBNhQozauPP81j9H0bZHo
	 6sVygoWV1nBwjOyERPjwc8PS1X4moOvyZLJeSy2ujGYuW1FObcVhR5dV0j2uipwJCi
	 7YCdy2rFwLL0Y8bI5S4i1nnlBWOvm5ZW3mSUTIJgvZOmM9T66j8HLiV8S7sUcZ7TXD
	 CYKQKYRaTJOhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A51CBC43170;
	Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.6-final
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749122366.16729.12006326578039670849.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:20:23 +0000
References: <20231015-outmatch-tragedy-228f91d396b5@spud>
In-Reply-To: <20231015-outmatch-tragedy-228f91d396b5@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 13:26:47 +0100 you wrote:
> Hey Arnd,
> 
> Just a single patch for you here, been quiet on the fixes front :)
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.6-final
    https://git.kernel.org/soc/soc/c/e4078ebbddf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


