Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960DBC54E58
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BE83C433B1; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64C1DC43390;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=qeWUQhAF2gR+a9yiMTYWRQInlnrsQ9Cl0yCdtWJhvv4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XZpi7gpgYEBgBnQ4VeqFdJckpHwEPq6x3H+9sYgHsFbp3iYZfesj9YhO9PqtswznW
	 FACCToWD6V0PQY8IiNoqS7ZLW78DO/5H4NgvzpxWRyshV4evEMNlhRdf6RZaRqT3Ww
	 ChAiUyxfqC7Z5N5v9rEpbjuRIKU5odooXV5MFNwrZuElak1qJly2LqStsV+7e3ji8I
	 Jgl04dvDgHB0PvcOBst1Ne7S9pvAtbp3rRW7j8C7j1blQMZ5FgEAa9TR5+89d9rHtg
	 sxdnVlO6fUjWWsqb4PsNHeM0j/ukzTQ0kxdE6vjkOzrTI7tfcUrMwcFW6my8H3U95z
	 Lwc+5pW01ujMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F43FD9A4B6;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843032.7525.5937758138688048738.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
References: <20240306031208.4218-1-andersson@kernel.org>
In-Reply-To: <20240306031208.4218-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Mar 2024 21:12:07 -0600 you wrote:
> The following changes since commit cb0bbdc4cc327ee91ba21ff744adbe07885db2b8:
> 
>   arm64: dts: qcom: sm6115: Fix missing interconnect-names (2024-02-03 11:37:47 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
    https://git.kernel.org/soc/soc/c/415ba4ed598d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


