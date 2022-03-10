Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA118C433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1A90C340F4; Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AFA4C340E8
	for <soc@kernel.org>; Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646923210;
	bh=DJKFuZsJ/spjjfoM7TzdGrp3kbhGGQMVJli23a6OuVY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lsGmls2S/Gi/WlZdTlohTVKwCYY4zB5BmxTJdJ9bEytU1YzC9qZd9CVhSACL8ovRt
	 vrzpalvlY7l1ij5vae/UkjWSPDF95y1Mo+MkFwV/LY68OI4ZyjTuF73EtekvMAGQ0m
	 suQhyHT7pTVq42gAxedElhE93igKHHAL15oucboA1U475/MpBHrsGrZGoxvmaNYs6P
	 fX0JD0rmYtG4M5j6dum8V5LTzBO9+rwABfzDFDITP0xKImdlrN3fiwSE0SOkZ4Uugt
	 p7P7iGuGoaiqYvqYBCtIoTghqajG1y2gfXOrHxA89DJ54nYZ0c+oUrSj23hk4qU1xx
	 ecM4/glzD3p7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C1C1E6D3DE;
	Thu, 10 Mar 2022 14:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164692321030.23312.7830126708443941258.git-patchwork-summary@kernel.org>
Date: Thu, 10 Mar 2022 14:40:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: mvebu: fixes for v5.17 (#2)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=622259
  Lore link: https://lore.kernel.org/r/87bkydj4fn.fsf@BL-laptop


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


