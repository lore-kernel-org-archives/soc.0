Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC662C7EE24
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99DCAC433A1; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82507C4339C;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=FsKye93NxCwEAVteIQnA0/xbqgJWOEnLwPl4zEMPBh8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tomVXitGL1QMNDFr9ySLgCNIQqzlDKmZ1WuV1W0yoZW65e2ejZKO9e37nekJHTb5Z
	 wt18k09wjN77B3W4086BJ4l1r2E8NWVO7A+2Eqts7U4dVQ8hBX2M4TyIAhXTINJE+G
	 Lq2FzqdDCZS0tR01QD8A9cs8WGSG6W6fAfME/nMlABA+1RKzPA4NCm7WnLKVWw4MQE
	 JvwHm9twA/ouB+wOJrfju6CmM6U9umZ9tGjzZu43L8vcHTfsPszmKLmDALlLPx+t1v
	 E4idEyTojKICb9ACeQPUHLNNAH63uFYmwlKMHHgfawRU06Yy2qQp5cS+W06CluEQbg
	 jPKb94qvrGiUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 577DDE4F0A7;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024035.10098.9678040061097186230.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
References: <20230530105930.11621-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230530105930.11621-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 30 May 2023 13:59:30 +0300 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.4
    https://git.kernel.org/soc/soc/c/eeda0b71a700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


