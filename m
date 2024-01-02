Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237B5C47DA2
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17D08C4339A; Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 020C9C433A9;
	Tue,  2 Jan 2024 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190301;
	bh=aZJfWwrj74s7fLBA+fzQrf/9r2OTCVJsMmWFsLZNlBE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MhciCvbFvTHDZUGXdUQjdZpS/JKZ6TnVfEVDzZRsf3tPRvQN6N/fkR+CaMvi/eUAU
	 40MwAjwtJOAhh2v91/JAX6lB39dB/62Bn71bJOoTcvJOyJEBt3HCpxDCuwXVprnhxY
	 0OKMf17jnVl+vfXP88/oBa6Yj+XQVbIAuvW/Tb6mHzX3kyaHQICnVJOfm6Qc6NkwIk
	 hfC1vla2f5Q/rS5gTXuge3hZhEu8+FKetBqxoXphh4YQ8HF1XHoAosJ8TPQKlqtTgo
	 TpcKSDZ0jljjQI30AxRqncHeslV48ugI+PHTiYarMvi9JXo5a7EPaC7Ak8Rsf6Hrod
	 dcrY0Giz6GAfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1ED6C1614E;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm Arm32 DeviceTree updates fr v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030092.6407.6287275621389288410.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
References: <20231231033153.3262575-1-andersson@kernel.org>
In-Reply-To: <20231231033153.3262575-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 30 Dec 2023 19:31:51 -0800 you wrote:
> The following changes since commit 648002a27c6b3ae293cc415e1fbf20aaa6af8bd3:
> 
>   ARM: dts: qcom: msm8974*: Re-enable remoteprocs on various boards (2023-12-17 12:09:42 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm Arm32 DeviceTree updates fr v6.8
    https://git.kernel.org/soc/soc/c/2f5ed2cacc11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


