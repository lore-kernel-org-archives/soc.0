Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1AAC2FC14
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC6C1C433C7; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6BCAC433C8;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276625;
	bh=djXx1cxSgUFLzh0jwQOttazL2UgHwfT7LguWHqOHuvw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RYLrSdPVvz+qXz7W0x0hhstn+cTArCjiJzp0DYMl9DJWyGypcSwR8zqkr+8zdkPxl
	 OH/LYGiiOWsKkWY9wFu+vmESYiSYBl6cozb2N1ZC1pl8CoKNxHuzGEoOWgv01w9/hV
	 drDOKDbQ/UcZmnzc+tGpCd8dR33mP3WbShRhFPAQ0Mti7u0w6EiDp4vDorCnRRiErO
	 xQkrP14KgU+SOc2wGYqYp5qqnrCR1YH4g91B+inWpyFKdB/Cy3JoD2nG8LkBQLF2+x
	 QdbU3pHclieHWuo5qrIlKadxn5LfLFL7n7HSAFciW9p6NgjImxHzpoX6jnC2OZg6ep
	 fgUuXnyiqB5mQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5256E1F65A;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 fixes for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662567.28155.15027852846091856519.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 12:50:25 +0000
References: <20230815142042.2459048-1-andersson@kernel.org>
In-Reply-To: <20230815142042.2459048-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Aug 2023 07:20:41 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 fixes for v6.5
    https://git.kernel.org/soc/soc/c/3c78dbf25135

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


