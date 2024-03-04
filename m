Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B67C54E66
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 867BFC4160D; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7073AC4167D;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=rrAJG/wtz586k/roD4WL4ZOaA9UOvm3Zocp6SkNlSRQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iLxVhEnqjxaIRlMTDXvK9P9vBxtFUMF00N7qG1n7VBuhxBbVSuwg1KRtneIx1gHmh
	 7PJ0wdtNPeDEoItXK6Qw649WMd/dgAuGKyrB68B6sYgL8SHs6wac2rr5ZmkW/K197+
	 MnYV0nGTd9CciCT2JWY/SgdL75/x7ARnzxH7mijLwS5sLJ2EevyjOymB3frh8dZdU5
	 vpxW2fidqwKxYrHWrl6qSKjFNmA4ufBJts58fVH1+n6S3onrGL3hfQ4Bbp7xz2Ibn1
	 aW44qfezAXR84t+OOSkrzwfw25+FP6nHO5JxwQdBu0km18qHtAz89r2FWrHc3uHLHz
	 ElnyORl6Enx0g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CBE7D88F8C;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: ZynqMP SoC changes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872037.25915.15751277290093065086.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <CAHTX3d+NGUJhKXxGwskSOf6U9P0Nd9rnroFczD8X2mLhFgcm0Q@mail.gmail.com>
In-Reply-To: <CAHTX3d+NGUJhKXxGwskSOf6U9P0Nd9rnroFczD8X2mLhFgcm0Q@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 13:42:27 +0100 you wrote:
> Hi Arnd,
> 
> We discussed this change via the side channel with Abhyuday and he is
> fine with this change but he is not willing (after discussion with his
> current employer and for whatever else reason) to even ack this
> change. Listed xilinx email is no longer working too. That's why based
> on our talk I am sending a single patch to change the maintainer of
> Xilinx event management driver to unblock this situation.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: ZynqMP SoC changes for v6.9
    https://git.kernel.org/soc/soc/c/1618c466c41f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


