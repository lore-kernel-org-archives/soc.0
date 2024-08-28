Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D9C7113D
	for <soc@archiver.kernel.org>; Wed, 28 Aug 2024 20:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2F22C4CEC2; Wed, 28 Aug 2024 20:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAB4C4CEC0;
	Wed, 28 Aug 2024 20:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724877723;
	bh=94ujW2cEYFJxFEh1dTFxxEmVewyH4Y39PoB90oA2Adc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=raTP7QnWyvXh3ZBKehERxnLPVOAERfofofIr00DBpW9zDGnt4pxQmeeLYfH3iJkJU
	 r1QpqZYjX9CeD9l/5wiGlfWQq/nzeqbVDOCY/qjg8TgDrwA4QFl3rYqDjMIjJGNJvo
	 Rzhru7CU2F8lBtF8/MPfKeWIswPClBOWr9BuMwx89bL6FmK+vwMluSW1a2ybOmUHPF
	 Q4fcsJm7nLUFzqXjLNDYWxP9EC4MNYnQhX4DbyX7PfHz94Do1SI9ukUaHQ7uqWZFM2
	 5AHfNGELJgDSs4jZZaC/wc1TJ7Er6gRPVoDfckOSO/FYLRCn5uise7OgDzHaOlfSyN
	 CE0zu9lzoFYdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BBF3809A80;
	Wed, 28 Aug 2024 20:42:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fix for 6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172487772374.1420116.12084812618563345786.git-patchwork-notify@kernel.org>
Date: Wed, 28 Aug 2024 20:42:03 +0000
References: <20240826145736.1646729-1-andersson@kernel.org>
In-Reply-To: <20240826145736.1646729-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


