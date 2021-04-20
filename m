Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29440C433ED
	for <soc@archiver.kernel.org>; Tue, 20 Apr 2021 09:53:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BBE9D61077; Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A497B601FF;
	Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618912426;
	bh=6U3S1sAsnunv6sqhOCgua0hgkkPmKQidKGcIK13Nl3I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=E103vls1PUoVuN8QGZjN1FiBa8TglIkux3uAaw8p3UeX1yu77wamy5wnLzO9cr62p
	 Nf2PVHksfFZVq8hfeJEN4NtcnjmWORYvIUEvEq4dRyNc62dVQpF8+dI7x3Hav58M4v
	 pC8UqShBD0q6HDDd+kUyXcqzvc9RgUNioeAIoLH6xhEZ09PRMrR+RtbUhTfBTSQWck
	 RDrdrUOEALpAuhIWFE7UETjvfHcdBrEcZKLwXa7uANVdG3fGBoB+VrFSKT+1sf9HM0
	 QS7aRj9wR22btR75l2w3v+q8XqI/2/Nco/XJulnrz+0xvn5QCN9e/Hvi6tXewxsCfU
	 7Mfal3u+fDJ3Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 96D2560A39;
	Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161891242661.23262.17537098228220826749.git-patchwork-notify@kernel.org>
Date: Tue, 20 Apr 2021 09:53:46 +0000
References: <CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com>
In-Reply-To: <CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 20 Apr 2021 07:14:07 +0000 you wrote:
> Hello Arnd,
> 
> Here we go! The second try at a second set of changes for v5.13. I
> think I've sorted out the gremlins, thank you for your patience.
> 
> The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL] ARM: bmc: devicetree changes for 5.13, v2
    https://git.kernel.org/soc/soc/c/d028b508c112

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


