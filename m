Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D83EB64D8
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 661A4C43395; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DCA1C433C0;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=0K/XpHsJoem2GuYEP9wkpcIU2tegR4C4henZnpa1KDo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eo4z3ZyT73M3oJzNk4ai3utKn9wv+BeoawnWzYSUe5W4IizfoeQa4Mt5IHE+yrw2T
	 fwJvvvTAqJczLDrtHq0fSooXgF+zJHZIX4qFvUabIrVAmOJCIFCTQQPcZKAuPT4U/r
	 xl81MeGwZs9U5Vcc4nQeI/wdwwDDdbLnBdkMaA6w+G/R9456SPvsx+71v6McR0/Stj
	 4B8hkKqjcPNoBeSDiKHrcjShRVsf0MahGOobZwdYHFvI9lXL9BCJRx0r8BENg2aqum
	 zElpAFkd/k67FM4M4zV+hPpnBRiCiCZB8et8YeWZlWXw32EJlXuYsRYjqJdU79m9EH
	 +kVITUmATjcyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1FA35E21EDF;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 DTS changes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611212.12258.12330681337995847719.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230615162043.1461624-1-andersson@kernel.org>
In-Reply-To: <20230615162043.1461624-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 09:20:43 -0700 you wrote:
> The following changes since commit 20dea72a393c6d5572088b8ad01dbb9e9aca64ce:
> 
>   arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G (2023-05-30 10:18:30 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.5-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 DTS changes for v6.5
    https://git.kernel.org/soc/soc/c/055fdcac930b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


