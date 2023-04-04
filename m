Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEB4C77B78
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C326C43443; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AAF5C433AE;
	Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619284;
	bh=W45CjZzk1KCiuKaQZOrCtwSFqfRweeuN+jC5CGhDKzc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lun5y97BYB9fUoD/U0sHWDMul7dFzrvmqSuV5LKHmpQZBWG7Sg383k9u10CbDEJSP
	 EXc6Plq0+2yW4S4AYeBl/c7NxxraAsI7LDx/chrUxdPTu6a7nupHm4xlA8BZ8n3wWs
	 5pagX0j3h6Jxnq98492l4JQGYYyDX9kcio3M4hYA3fnoHLA3ltV/FIUyZndut13Rzi
	 1b3FnSDDU1+fy35iI4kOtdVnRnqVfFIqnvsa/rYivCCAUP1vl/uVZdNRukZJ9N05C5
	 QF6clVVuC0HI6BvbGb7YMLL1dL2kybhTn1o4Qg/N0rKzCbN0WZYS54cJla50whr9nr
	 yBQ54oj1T1OwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED807E5EA89;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree overlays for omaps for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928396.17322.11000532656635125701.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <pull-1680180448-508978@atomide.com>
In-Reply-To: <pull-1680180448-508978@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Mar 2023 15:47:42 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree overlays for omaps for v6.4
    https://git.kernel.org/soc/soc/c/8f9abca2f4a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


