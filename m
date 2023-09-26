Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BD5E7F133
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A18AC4166B; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E52BC4AF5C;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=BPdcs8+jRQeVz9pTpMz4+tWjKIztaDoI/HfyznZwT2Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vG0lX+M0s+Pq8PGrK0cBSlhfnsq+DwwX7ijPPGgx/u9MC3drTeuxbuFsaIKooSXP/
	 CZ5869oAG1i4PpCq85asXLYctvrl44gaU+sEKW5ScVXYSVLlqOlQGwD9RhwBVa0D+0
	 QZm5n5/MBMGbC2QC05+9vyiInShTZgdf87S+arzO8WYtrrdGn0QIKWsmI20WYsvGc+
	 ytdVI9iE+A8vpINbClOR5T1bhhRVAAuff8wPgJ76F7naZnhVBfhPucPc+g9fOat7TS
	 XOriqX/hQErB9cxPe/sT45TCEW2cQkxnfzJNRr0H2jeZlPe1/Zp+2InivHascVJrvO
	 PwqfmQk4bkVdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B3CDC73FEA;
	Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: Maintainers updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576328010.24546.8925908019352921447.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:21:20 +0000
References: <CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com>
In-Reply-To: <CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 Sep 2023 11:21:27 +0000 you wrote:
> Hi Arnd,
> 
> Can we get these merged for 6.6? It's not critical, but best to have
> the correct information in place sooner rather than later.
> 
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: Maintainers updates for v6.6
    https://git.kernel.org/soc/soc/c/894a88a03bb2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


