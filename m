Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAE9CCA485
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4F73C341D8; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F1E5C341D3;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=ehh0riwob8HtCisROtmfyrQk2ffNuCA7zcYgpamvf9E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PV0DbZW05dMVFqvIEnhgg6hdzh2NRsbC+fhOJlL8elNgZRns1DlVU0qJk2FbpU04p
	 jcwcfp9nsBsxfvPwTE0aLpm5XKjFyYeby1skU5kIy7zZX8IyBigirM5jx4DO92t5+k
	 bIGZnE292+Ga+g+isd4CTykSrfWGa9uEmKBSBDNZlc0fmyaLHKMsvWUsA64a7iedU4
	 oUpIYvGmxDWRYlsWMf28ocsqBBLnSCLMRjx/SMF4ZZEDs3/k2QAUkThnHc2suUsH9r
	 8HgRIZzAaH9fak1Ms7Ztfi6Qn8tWglPmTi9fhThycdpcQ45rAg9Zo3l9i6a0NxLx2b
	 NJo5P1EgKlm4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DF28E45BD8;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881844.23384.4018665972151583076.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <7723415.29KlJPOoH8@phil>
In-Reply-To: <7723415.29KlJPOoH8@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 Jul 2022 13:08:59 +0200 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.19
    https://git.kernel.org/soc/soc/c/3c5a4e6d833a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


