Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24911C52D71
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 134A5C4AF0D; Tue,  6 Aug 2024 20:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03E2C32786;
	Tue,  6 Aug 2024 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974902;
	bh=54tdhlDwH/k8ei5lQcatq8IkabzCRtoosAMpvDgbBLI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gxUqdE4n+kKCHjrVet5u5kAVGCw9EffWSaCmKj0sqEjcK+sgy77idCYx05klAWe9M
	 Uf51IxQvvgwV0eqwU3vooQEgGpG+o+CnVNGiftdeLvDyihuy3nvGPbu9Fmkxu0ygPF
	 OlCO8JFvu0EKy8WMVJHF9cJzZEON56Hgqn+CGBCFCUpKSnbtm5ic39ZVswDtSfVu60
	 g/2zwlY52cHYcJ/3cpeYnCQvNIJEqI2ZsuHuroLrVB0KUVsuq8tzCxkd2YEowm98yH
	 CCpfa3PHHHz3+t0vMyjzeRIpud+zm57s8mEZ5933pNPu5Pwjtfdp6upWr0sbMjqXQ3
	 WXKwpYhkp9Jkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB03D3824F34;
	Tue,  6 Aug 2024 20:08:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: TI K3 fixes for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297490050.1692635.15122786707954650004.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:20 +0000
References: <20240806122659.vmasq2qjy6457bbs@peroxide>
In-Reply-To: <20240806122659.vmasq2qjy6457bbs@peroxide>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 6 Aug 2024 07:26:59 -0500 you wrote:
> Hi SoC maintainers,
> 
> Please find DT fixups for the v6.11 rc cycle - This tag includes the
> previous late PR
> https://patchwork.kernel.org/project/linux-soc/patch/aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com/
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: TI K3 fixes for v6.11
    https://git.kernel.org/soc/soc/c/d50a762b62cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


