Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF20C47DBE
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7364C116CB; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D15ABC433B9;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=KBmStwyKHA/mitO5GiWNR8nnHRfnU9ADf8Hp3JLSIzc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gRxvitlbL5iMXFI1MojydyqJIRIwy8QM1PIEJvnNMdq8+CwxclsCF/PyuduJfFLNR
	 4YY8VSRBVP4G5XR1mrTrOCLM6c6vnQcJvE505me3nQ4SkPDUnElj7/zK1zdZs9WXRh
	 AhXdRDiPJjHS8eFzBbxST2wRKa0q363OUIGKpGjq0tAxO/En+6JM5EF9MMX6gv2oCm
	 +kkDF8hKwd3rUQ/G1n5gkYLOeBgHtlZNIljagHk1F1WppuBQMniLUUzEy0qjuEd1t5
	 l2zpy0Ij6Aq9XE3NGWf375nBvEvfUJirzVvQBrWZrcoMVhicRLMm/R7pMucO8DAGB4
	 1AWG9u/EOgeqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD2B0DD4EF3;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646777.10550.9150745099060463183.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231219145402.874161-1-andersson@kernel.org>
In-Reply-To: <20231219145402.874161-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Dec 2023 06:53:59 -0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 updates for v6.8
    https://git.kernel.org/soc/soc/c/2d7123c7e167

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


