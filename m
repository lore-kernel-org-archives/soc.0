Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634EBC4708A
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 552EFC43157; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3537FC433B5;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=K6O20F6kBFELE4C83nbo1gmnaYSbpqZt0FXLD4fpZxs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lbSfO3FwZ+S1cfe1YxhDNmzBVG7KtFJW4HLWVRs4m4UHAlbuvqa+XSFGFrgfKrJLc
	 gWEDZt/copFhh6/YgOHq9pG3mHMZrQWKVhMy5ibrW6VAtHIX4RQ7GnSaeLT+p5lc13
	 XxZfHyfk8VAvKG4c8PmK9RQaDDrOMWADg9h7eK5EPJsdS4J+k8fZQeJuKVWdaKGyUQ
	 M8xToWB/nt48TQU325JrsszbXrjTCiB8yTTWbOXRcXspYhiqZluDLeTMbsyCzc0KE7
	 zfSBUsXrJzjPX5oTruJj4vapgpgcsUZMNww3cvdPPvyPGSnyBr2oE4IQwtBsvrF7wH
	 2gGLFK+vIBZyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 165A8E21EF7;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Devicetree related musb changes for omap3 for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826207.9936.9821955450100740887.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <pull-1669364566-84575@atomide.com>
In-Reply-To: <pull-1669364566-84575@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Nov 2022 10:23:12 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Devicetree related musb changes for omap3 for v6.2
    https://git.kernel.org/soc/soc/c/799423ec5a6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


