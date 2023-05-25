Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E25C7EE31
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57C76C433A7; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40D8CC433A1;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685030320;
	bh=Z0Ck52QQ8qR623IIF4Yy8MZLo6n13Y2vr4UIvmlxG9M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dlkoltKDm5uGsTtTNH2uDcS+A7+vOAS0T6DXkWqSkkhYfwSqwlGHUclD6dzwHNOzZ
	 aBmDgPZmB8qjyfZDjic2H63CJ5yUfzGAu0FD6QOfE4INMkc74GBxe2+X4Wph37xMRn
	 vc/Z4KMp7Bopwz2R2QsnCKbkefVBl2yfr2/JagvHKaZpxDDb/BLGuuyXg1za5GmCVp
	 xfBE5w1QdNjrgY/ehsRUzdN6nzeCaEPVdJ9PNYci7Z3JJ7oVV97sH08ivrYOVQ78Uk
	 hrc2kasaJR60CEry55T8rR7E2vPxysvKc/LymBKVAT0igygFKrjsAyAC5PFdItfBvI
	 R0CweMx3YHhgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2070EE4F13A;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168503032012.27102.16818852045716744346.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:58:40 +0000
References: <20230516133625.GI767028@dragon>
In-Reply-To: <20230516133625.GI767028@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 May 2023 21:36:25 +0800 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.4
    https://git.kernel.org/soc/soc/c/66bbb329788c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


