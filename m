Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999DDC64EC6
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C172C433AC; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E777C433A4;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=2kdudjRfIVVB+nsuUPeQS3zGDeFcn8flfn1MDfAPsX8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DyVmOSO+Ycg2d3r8JsF7DHXFhcjteziF8Fs31+hHHjGamAS1FytGXZGzBYpuI8i0m
	 aWzyW9nlqddPo4FJ6cErHIpqJvdBWIiN44nrKCAu8Bbb3YRiGIAFqIG3/+tyL0tBp/
	 uWf4Hp0RSvXyAglfK+/ufFDSpUa2UIeVwX9554VeVaG554x5jjYGPFycWKKIXr2iSt
	 Qw6Power86X11YBlh10ZnlJ2o2eAkBRXNrSlrnMZapF/7B220xvjOufkEZmsiN4YSj
	 gw5Fy4U6zXxuOffugwm5QiogmmMGrGM/n2XnKDHKsqoJu/mJZT6c2A5KjNXVlx1U+n
	 +In5UfmRQ6UKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A960E270CE;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: zynqmp: Xilinx SoC changes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902223.23236.14087018457154314009.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
References: <42be5129-3ca2-ddbc-ac3b-6448245b61c2@monstr.eu>
In-Reply-To: <42be5129-3ca2-ddbc-ac3b-6448245b61c2@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Jan 2023 12:08:23 +0100 you wrote:
> Hi,
> 
> please pull these changes to your tree. The most interesting one is from Marek
> which is adding support for older PMUFW version which didn't handle TAP delay
> programming for SDHCI properly.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: zynqmp: Xilinx SoC changes for v6.3
    https://git.kernel.org/soc/soc/c/a64c36b8b75c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


