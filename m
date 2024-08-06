Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BA7C52D70
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 477FEC4AF0E; Tue,  6 Aug 2024 20:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C7EC32786;
	Tue,  6 Aug 2024 20:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974896;
	bh=JtaUrKNtO6tUW4ed9b39e+tgCgwSSq0NNjSNAO6D434=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=osRwf5adRYC7TY6YunDnMW157f6oGJCWLtFSNwTzi11/2cFGlH7kmcucURdepXHxb
	 1aiA1c8sWnS8Ba8KQwc3eZWJjwdxZxi9pCzEVDxH47ZMhv+CKmGE5xQzYo7gR8P+2E
	 Nz40z32DJTWQ/RU8US+nzms8PwbRcLCPSmTm++AWKauJFArav1HE57XJG1ZRoHLrCO
	 dUfJ7KL6x9P06Ekqa+pQ+eXnOph2TWcSPhyKmMkcssV2x+HfAzoaCa64WkZzLO7pO4
	 rmOVbijMBY8ZTWUOtkhlqNqpJFMDHlKGF1jGAOXar830cwruQgtqFRt4h1tLszLSLE
	 lNE/DHzK83Xdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345863824F34;
	Tue,  6 Aug 2024 20:08:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/19] Updates for turris-mox-rwtm driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297489483.1692635.14624244489320090653.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:14 +0000
References: <20240715104723.17751-1-kabel@kernel.org>
In-Reply-To: <20240715104723.17751-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jul 2024 12:47:04 +0200 you wrote:
> Hi Arnd, Andy, Gregory et al.
> 
> this is v4 of series of fixes, refactors and cleanups for the
> turris-mox-rwtm driver.
> 
> Changes since v3:
> - addressed Andy's recommendations. Some of them resulted in 2 new
>   patches (08/19 and 18/19). Im patch 10/19 I did not address Andy's
>   comment
>     "Actually you may do that without devm. There is a lookup method
>      or so in debugfs APIs that can be used. Can be amended later on,
>      though."
>   since I do not see how to use the debugfs_lookup_and_remove()
>   function without devm and get rid of the driver's .remove() method
>   at the same time...
> 
> [...]

Here is the summary with links:
  - [v4,01/19] firmware: turris-mox-rwtm: Do not complete if there are no waiters
    https://git.kernel.org/soc/soc/c/0bafb172b111
  - [v4,02/19] firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    https://git.kernel.org/soc/soc/c/8467cfe821ac
  - [v4,03/19] firmware: turris-mox-rwtm: Use macro constant instead of hardcoded 4096
    (no matching commit)
  - [v4,04/19] firmware: turris-mox-rwtm: Use ETH_ALEN instead of hardcoded 6
    (no matching commit)
  - [v4,05/19] firmware: turris-mox-rwtm: Use the boolean type where appropriate
    (no matching commit)
  - [v4,06/19] firmware: turris-mox-rwtm: Hide signature related constants behind macros
    (no matching commit)
  - [v4,07/19] firmware: turris-mox-rwtm: Fix driver includes
    (no matching commit)
  - [v4,08/19] firmware: turris-mox-rwtm: Use sysfs_emit() instead of sprintf()
    (no matching commit)
  - [v4,09/19] firmware: turris-mox-rwtm: Don't create own kobject type
    (no matching commit)
  - [v4,10/19] firmware: turris-mox-rwtm: Simplify debugfs code
    (no matching commit)
  - [v4,11/19] firmware: turris-mox-rwtm: Convert rest to devm_* and get rid of driver .remove()
    (no matching commit)
  - [v4,12/19] firmware: turris-mox-rwtm: Use dev_err_probe() where possible
    (no matching commit)
  - [v4,13/19] firmware: turris-mox-rwtm: Initialize completion before mailbox
    (no matching commit)
  - [v4,14/19] firmware: turris-mox-rwtm: Drop redundant device pointer
    (no matching commit)
  - [v4,15/19] firmware: turris-mox-rwtm: Use devm_mutex_init() instead of mutex_init()
    (no matching commit)
  - [v4,16/19] firmware: turris-mox-rwtm: Use container_of() instead of hwrng .priv member
    (no matching commit)
  - [v4,17/19] firmware: turris-mox-rwtm: Use EOPNOTSUPP instead of ENOSYS
    (no matching commit)
  - [v4,18/19] firmware: turris-mox-rwtm: Use ALIGN() instead of hardcoding
    (no matching commit)
  - [v4,19/19] firmware: turris-mox-rwtm: Deduplicate command execution code
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


