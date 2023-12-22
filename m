Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15FDC47DB3
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2548C433BF; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9F55C116C9;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=2GA3Y70mFQZlU+6jn1406m/f2vRMuStjDQiZXyMRBf0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fBitugnP5f/MwTNb9Ab3Uue8Cgdl9CMLNsoDKuMcUmGh2Lz8ZsAo1WjMMiI7CMmTj
	 rmTXxZYRVN/HU4neBvAgOV0pdKoinN6NrkGEtMCjSsaUsAxLkDrh9Wt+umz4aJ9yM6
	 IZLUrhUwIGCciDt2ZSvTmjd39639S7xi/JtgwTGHs4ku90uESln9SwHSlA65W1Q2eq
	 ZnOViPFeXf3DmPY1uDnEdlSoCsXZRMq9XlebU5YoUf4mMcYtD/G6YRNaF0tTlcvPb4
	 X3Vfm5TYmqwLrrCyqYqqDTsU49dkrQV/39BIo93T4YQkj+W4R9fR8Ef8en0QJ1zNCO
	 UqSpHElFWH0DQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9715DD4EFC;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable STM32 DCMIPP media support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646769.10550.12606270648441240466.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231215100656.729094-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20231215100656.729094-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Dec 2023 11:06:56 +0100 you wrote:
> From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> 
> Enables support of STM32 DCMIPP V4L2 media driver.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: enable STM32 DCMIPP media support
    https://git.kernel.org/soc/soc/c/ed27e15bc490

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


