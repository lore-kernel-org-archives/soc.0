Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D8C7113C
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15899C4CEC7; Wed, 28 Aug 2024 20:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4020C4CEC2;
	Wed, 28 Aug 2024 20:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877794;
	bh=D8xgI81DpqoVtilr5lCKKm9VxiC/66iCitxB2XQlqwg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hXzDdz8sF9x+g7hul4+BBT+UHU5T/7AR20Fzy//6O5GKQzv+cp8VMHp74haonQx/Y
	 3GA+Ykv9EgaVfZBhd2Gz3S6zxu72qrXiINYbo9cVsvkAgXODWtlaPBjU2oIsuSFbmX
	 O2jTw0r+I77sSmtfGLMwodrAaOfNj6T01451yv+DC0s2ay2C6jaoBQSmp8qcr9wwBz
	 oOGMj6afyWAaes9mGS1Hf15Wp3iy8UQ/RXV8o3krKTP0c0S9vRMqjwjAPiWcs4WaBi
	 61bNWpJRsE5obewDf/IMFXiULFxzEDiQOAJCdG7uYWFVkVPnt6+zogVlzDq9tubUpe
	 tpubO1dx93KBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C003809A80;
	Wed, 28 Aug 2024 20:43:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fix for 6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487779390.1420116.5278605721110558185.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:43:13 +0000
References: <20240826145736.1646729-1-andersson@kernel.org>
In-Reply-To: <20240826145736.1646729-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Aug 2024 09:57:35 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig fix for 6.11
    https://git.kernel.org/soc/soc/c/015a00ef55e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


