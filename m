Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D00C6FA91
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AA4BC433D7; Fri, 23 Sep 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E70EAC433D6;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950026;
	bh=cy5zbb5yiXNK8o2ZK3AkJESHY/tpmYlq+B0PQxZrFXk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CjHMyFMNT+h1G9geM/+oxPIiy5Nf5kHmG2no70mhONhEYPej9NWE2vCg+jRIkph0V
	 IHqN6b2O6ZiDNDQdvfABtFPNta1pHzlAhpjmUXBHrexDg1ZdvnMICaIFxr9jZFEvCf
	 fjVsFgzeb9hK0mRj3dK949X82jZTvho8WLQ35K2Dm9Vh7F5iEcF/h1Fpp2B1VTstEX
	 aoJLVHjlf3EOxe4LfcTKh9G/fN0djCwmeCbhH+gjPVMMPC9FQIRoqJGGHJv2dyOdL9
	 aDAGoxTne7Cg/2POhxFgmJp8GxA1BuP3v/f2bCK4FCb9ZjmOnT183LI76O5znEqsXU
	 aOnig18NBKQHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1F82E4D03D;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM defconfig updates for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002679.3905.11582555879817080828.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
References: <20220921153734.1314952-1-andersson@kernel.org>
In-Reply-To: <20220921153734.1314952-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Sep 2022 10:37:34 -0500 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-defconfig-for-6.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM defconfig updates for 6.1
    https://git.kernel.org/soc/soc/c/15116bf66724

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


