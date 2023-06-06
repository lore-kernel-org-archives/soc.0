Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF617C87FDC
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBEA9C433AE; Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0DE1C433EF;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686084024;
	bh=4EYpokBUKsReseSw5NY9TkbLilsr0jU2o3PqFBYB+U4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gJVPIx12R2UokSDgTNm6ej8GJOID021btbuF1GXuaZZ7E8cfL9Ju3/+OZuzavbd/z
	 0PwlfzMzuoIHrRfo6MRc2elZxK1WUDiOAnbPpId4YqAweLrK25ALCucvpSCEu26xx7
	 dC0sRCCCnjOdscVpX2VUPBrHIpnW3wawmKbgA0hqnXpXlbntXV/i0ZERiFBpoja9IH
	 JJ0Cs/T8oBCN7bwlRLZZaqZHrJ9yrAGnkCKKnrVJ1lHzOf0O1OYQ0XYTvCFJx8lJEb
	 s91tfeDZqxd/yaP+O0n2ipyGWoP/NdO4Y8SiwUT9Wy1Five6tEIhsta4OF0QJxtJv3
	 3gIkImuQnGyew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 987EEC4166F;
	Tue,  6 Jun 2023 20:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 DT updates for 6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168608402461.20407.15754288298396812069.git-patchwork-notify@kernel.org>
Date: Tue, 06 Jun 2023 20:40:24 +0000
References: <20230530105945.11638-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230530105945.11638-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 May 2023 13:59:45 +0300 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 DT updates for 6.5
    https://git.kernel.org/soc/soc/c/4d1010ff173e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


