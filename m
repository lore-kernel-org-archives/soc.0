Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E1C43334
	for <soc@archiver.kernel.org>; Mon, 18 Jul 2022 08:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1DF2C341CD; Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBE54C341C0
	for <soc@kernel.org>; Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658132450;
	bh=HFTZ4Ixi8RR2THFyJwGAtVQvMzYW1hf/QYw3b3Io69w=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GtP2PFneaehd3XFYOEmGWSBYjRC+FC1CR+W2ZX0i0P+ALmA2Lk/QzBNtAfyR/YHFU
	 ewJsxiJ8VzHaFoifEjEKOCudsuHYjhHxETGvqWEE4QsVaMjXZkoYlIQYb+6VCiNlDc
	 Xs6lV1dtOpjPhgK8TdB/p5SNRR0+f98eBXNbjVR5uylWu0ebRa8RGTgupgR7rwo+Ic
	 JgpwnrP9xte4obWaFUrJ81+eyT0DaMULKYZsQmLRbkLw6mgMya1LSZ42bIPn5/DGvZ
	 btG2WRpbftltlySOhsN4RbiCW7NM0FmHOl/WY3pqQcTW+H0G0pQ4DbZ4gzlcqKZEAf
	 cQbgWw7OiUEQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A39D9E451B0;
	Mon, 18 Jul 2022 08:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165813245058.27582.11579089531560963566.git-patchwork-summary@kernel.org>
Date: Mon, 18 Jul 2022 08:20:50 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: SoC fixes for 5.19, part 3
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=660074
  Lore link: https://lore.kernel.org/r/CAK8P3a3jSNJfJxkbqJ4Bfa0bkhNsF0CY+bGJMGKJOaFPm_Me5A@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


