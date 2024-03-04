Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B3C54E5E
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B88FC32785; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35BE0C41674;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=ApEv9/HaCaEXoWOT3nl4ShdyIFX25Mc+h+RpeIzIEVE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OBkGkbxayrcfd+7fnrJpN5WGUmqGfv56tlpfOsaR7igTJNGf3+Sa2sDhYnifAPr7p
	 +X0+ZVXDaBCBU+kBXdvdkOWSSVp08lSnwSzbmfrlcWWkmLxE0hdcpygGcfZKtpIFT8
	 W1TherkgPtDlrBV7C/8cDXr8hXxyUBrK87rM+zLT9ju7EU7wRli0kARE9Bq1pECOl2
	 Bw0PrxjAtSHaE50tziMhGK0CKDHgg76T/G9ddKaIUbrYmZLsRftAA3cqjS+D+OTWPY
	 Ci3tRX8YF3YC8exE8bFgiBcMktqtqCycuPttc1+F7tn6B2ahV/ubgGmmqXoHYAUmog
	 vYzrLy4SvojBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1DF8FD88F8A;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 DeviceTree changes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927512.27833.12463510040698454081.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <20240304033507.89751-1-andersson@kernel.org>
In-Reply-To: <20240304033507.89751-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  3 Mar 2024 21:35:03 -0600 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 DeviceTree changes for v6.9
    https://git.kernel.org/soc/soc/c/b3c6f1ff32e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


