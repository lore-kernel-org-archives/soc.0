Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A35E7F134
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F0A7C116D3; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40AEEC116CB;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=KywSzeB5+83fzraJN2IN/FNHB+xXmxp3PE2wy16h99s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Pnfs5ibEAvLsHBlCDdVHAQqWnVa7PV4AChqASIuNmhMoEzy5o6q9y2qF+5Fs/00zX
	 eEQMDuPrIYkgDrTCC8BerttTmDjPYmv3PwtZ1WLLoNYn7PRZODia7AtalylGPHJKmC
	 WS8w8FnP/gB5NynYIoZOMvGidXMQsOF1kKsaF19p7K6cUHjfx+fIp74JjUnt51xx4C
	 5mEFyDzM5VZlK+z0xUgAtYzL7A+toto519B+gx/T+Jod+kkdwgV1KA8MUc0Ua/O/2C
	 YdnnWZr6qMpplNcNzsC0cnbVbSBU/5Ra48CKQdTcdYFt/ZjeKikd7KRNeuNc7aZ13S
	 mtRbsGg6y97Uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24792C73FE9;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps and ti-sysc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576328014.24546.14896156586194986240.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:21:20 +0000
References: <pull-1695715881-95183@atomide.com>
In-Reply-To: <pull-1695715881-95183@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Sep 2023 11:11:47 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps and ti-sysc
    https://git.kernel.org/soc/soc/c/e99e2e8d1b12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


