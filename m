Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F89EC54EED
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 473EAC4339E; Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31FDFC433EF
	for <soc@kernel.org>; Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595864;
	bh=qcdKIRwr+YmrOXfUTfSBUWExKdppkXD0irk/cu6sTxQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=r0zAKf5XWxmzRCtE1exrEhupV4437wBfuYPFDNCNZHXmtx6ha2i7NPruZf4to20eY
	 /I7Si52DHG/I9Jv7efIl4bbJs7a0t1DWZ4Xuhx75xu+bZ9JCtbnPAdpnu7I+PkWBEI
	 tO/c9XQk9jWzIYZZ4MMmYB03+i4OI0P9uErdp1cNSMVHQ2KD8G626oY6RT8vm3XbkD
	 00YkJxId8TrvCw4W8yptB1OC+JB+dDOLRMT/uiCnl/oqRWqEczbOyjQNXo4FOd3Uvs
	 WG+bm1o9EIGgPn65d2biHbSLEEpIAugPh+YAGEbakTDyKxWmoVZsOVDuBWNNtDTa7v
	 C3JncmqnbeZfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C226C5C7D4;
	Tue, 24 Jan 2023 21:31:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459586398.12731.12249584247140461799.git-patchwork-summary@kernel.org>
Date: Tue, 24 Jan 2023 21:31:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: aspeed: Fix pca9849 compatible
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=713060
  Lore link: https://lore.kernel.org/r/20230118051736.246714-1-joel@jms.id.au


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


