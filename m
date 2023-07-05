Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D3C001DF
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8063BC433AD; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66D0EC43395;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=StzZpua8splJK8UBORVDXLkznATgBugCaJee0DzR2QU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ddZWN+VUjJd5GrCjp86eqZSwwsMOFM0PTFdPsiljpGAsVr2V84cJXSZz8GVYNsc5a
	 FTnmmeTUNHNnIXoMpXlXA6tfEmdjl36RgqAnDHnKhwIP0b8jLkuB3K82sUSblYvxn2
	 5/sIWi5GJveiS5a6i9iELzAs4VFOn4i0qn9QZ9Lp4idR+JJgp7ZJNQxYJLWfYb+kaJ
	 4JWmrjiR98S7E0CadfxKIKtMjOjN+QdHlsdzdYKfXs7o58PyE8vJsBU+/57+pB5HFr
	 ab0LKtFziMhBnRa13QAWtiMfcKqOj3a+EWwsfMOJ4jdyKnVTPYO6dlUntdjUrz+tF6
	 miBJN74Qrh8IA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46247C691EF;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972428.10612.7788902033055552965.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230611010843.2482142-1-andersson@kernel.org>
In-Reply-To: <20230611010843.2482142-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 10 Jun 2023 18:08:43 -0700 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 DeviceTree updates for v6.5
    https://git.kernel.org/soc/soc/c/6db92533d6a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


