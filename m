Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879BC77B79
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE8A4C4331E; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD4AEC433B0;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=zg3gIlDdWSo1tnT0EaNnEu6JRlW02yOM+20DwJ7mYkg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rlyArQuPllCYoNoQ/Nn2fTz3pYvIgdi0GUE1h7qmm3jWvCyc2q9UYhY1CKJrfTLKa
	 vxsueMfJsRoYt/AAfkoBZctjX1g9Fr3ck0SYbySpqBbo0TN50IKrJO7CXvZ+3PqELs
	 nYRJzjLFGtG/hHYgJysmTKW8okLDjUsYwooqVnOcH179F6ihLtD60Vz7Bv3jIDF19Q
	 mqjIK37J+f5/pthfTVbWuDH32PtBQoiZ5E6UIy8pJsgNYedEjJ/jVMxynLQ6FP1TkP
	 03uqGx4ls+CWsiTJYEf/+mtX7TeV2zR46F8OAPM02xtNe9XYFqv2+cTGvvhPwHAxAy
	 gVDnU1jCyPpnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 980C9E52441;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783061.23940.9231036715280935858.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230410155955.5329-1-andersson@kernel.org>
In-Reply-To: <20230410155955.5329-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 08:59:55 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.4
    https://git.kernel.org/soc/soc/c/2425d7e3f1a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


