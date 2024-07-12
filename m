Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694FBC41513
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B935C4AF0B; Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25B61C32782
	for <soc@kernel.org>; Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720788031;
	bh=dSNJ7uOJ5ajS4oEiqo7+k7hzCsL2Sfcp9TuQ3JuDR+A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=AqTQOFQioIhTXmp2N0tDDwltgj0PTp9UIMlWzrPJuFxYHnTpyEfGr/eSk0TYKahV9
	 6SX4lNkkAPE79sg7t2henb47qCWv3eix+EVkE7tOVCSkyNsvOJD+PX9waETy8lGaTS
	 vF3RGRmh3wZVXJDF5s+C/pZt8JrnbyKDJDoR9PXMcNN80mF3RtswNYo8tsN6lzgSWQ
	 Jnf3LzsmUQOsKrp/+ZHgPuLDFu8HDry8TqGO42KTPvXWjF9uHFIcHSih9ySkuD/zOt
	 nnBCX7jArpYGAU8nfpVZAhvP6jJ11IFtKSEry8K9mgSJ727L4/YzkqEE3mDy+zEKgl
	 349VDonE6KHnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0E295C43468;
	Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172078803100.14799.16097023537020493335.git-patchwork-summary@kernel.org>
Date: Fri, 12 Jul 2024 12:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=870791
  Lore link: https://lore.kernel.org/r/b8dfd52128dfc916e9eb917c24f9b36e0b96bbd3.1720782462.git.christophe.leroy@csgroup.eu


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


