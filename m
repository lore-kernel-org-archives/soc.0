Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B6BC433FE
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1FF9861374; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 08FE561372
	for <soc@kernel.org>; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634847608;
	bh=c3W2PZqaUgEx79jUajbQXUr1MAwI16RMdlacAQMO8uk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=sl0AV48LymkRDTCKVlP05RISLDsK/booKaBXwKErLgRSyvL9JkiIMlY4yee4VaKs/
	 tlHPJshgoR6Kl7p0b2Uppq950wBtbsMXY2hdg9OwFtVSTPiY0G+Cix6V5LFfSJ1P+m
	 HbKmv7bi6FhKwzClMxgS3/cXLrnNrIV4/A2e/fj9z5Ol5/ag+f4v2JZbizB8Qr5its
	 zJht/AecAWVaKIq5DUl+6muq30dynSUkgFHQnWuKWfxHlD/5qqQMtJ8cYvwByqd34A
	 bWD9HYIyuuaCbghy9crx0pu5PHYyH8Cx9v/CnfgvZRCoz2ya6kO0XoFgfvyUSkThVl
	 ZP5LUgS+vbz2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E94F360984;
	Thu, 21 Oct 2021 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163484760789.31591.10440954919198597472.git-patchwork-summary@kernel.org>
Date: Thu, 21 Oct 2021 20:20:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: optee: smc_abi.c: add missing #include <linux/mm.h>
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=567797
  Lore link: https://lore.kernel.org/r/20211021125539.3858495-1-jens.wiklander@linaro.org

Patch: [GIT,PULL] ARM: aspeed: defconfig changes for 5.16
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=567485
  Lore link: https://lore.kernel.org/r/CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


