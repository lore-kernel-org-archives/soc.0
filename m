Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D968C43219
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12BC6C340FB; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2036C340F8;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646060418;
	bh=NuWo0estcohbjlmZxo0EY9jnhGBis/F7gATGtWx7IUU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vcff7O/yeoThTGjZTkc0Dj88S7XEN7ZtkbxX9Srb3ChDQVVPfloz8WpKG5nHPqNiH
	 8nYQOnrV8z9V7igid+fhjCMoN2VUjdyAAg+h7Cu4bjXRXBqvTQzYQpD66Y+4ALzKMB
	 PNZoCVMgBL2AtruujtqECdA3pwmYViAcn7dTEo6uuRV8NiEdIt8pzeuWA+WALL+DeY
	 yR5NYHZFt58s2dMSmyGWx0akxneMImR6huAlbRiIw3BpPRw6LOMJ8hrjIM0ILUGq+p
	 KoYQwjr4vBgmw38j+jQ5mkTX9tIMwUqj9BA3jpS4Bq2caewQE5EPggeCEmzFTDGaPn
	 ahY7bQ/jsrNxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D56F7F0383A;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164606041787.949.4775346080335649132.git-patchwork-notify@kernel.org>
Date: Mon, 28 Feb 2022 15:00:17 +0000
References: <20220227134431.908998-1-jic23@kernel.org>
In-Reply-To: <20220227134431.908998-1-jic23@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 27 Feb 2022 13:44:31 +0000 you wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> I have no reason to believe these boards have any more users and I
> haven't tested them for several years.  Removing them may simplify
> other changes to the various PXA boards people still care about.
> The recent conversion of pxa2xx_spi to GPIO descriptors for example
> had to update this board despite no one caring or testing.
> 
> [...]

Here is the summary with links:
  - [v4] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
    https://git.kernel.org/soc/soc/c/28f74201e37c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


