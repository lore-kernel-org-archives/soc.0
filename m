Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB79C46CD2
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1A52C433CB; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B768EC433C8
	for <soc@kernel.org>; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180434;
	bh=rJ1YCLp8t8wvZKkhJv1v8md1aPAay4VD5trwpKryILo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jxvSE9BsyfONah1Yofqbqtc7SIsUI26ibgWYOJOsrIg8U77nbqEC8T51wJ9Emadem
	 N15+YY5k403jd68Q8HBT39kiMe0Rv2CiNl0oUYoYtyaF8PBxS1DGQ17kpjsoqrFGNv
	 imWC37REufzBjE1bNOaUbp0ZDySrgz5/jwGeLPv7VrMBAXyOOTpVNWITxGZJgqjXqF
	 ZOJztqlsmWJdSYXMKTk0jW/3PK+KwTAt/4lyPjRGDlJtKXhizfxvJL4T/IB+GFT8AI
	 3MCW/S8x4xi22s0/52mce450lEUUxTODEZzk4vwU3L1maF7dsuUiryhrif5yj/TWUF
	 TJz8AhgxP4Kww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8DBBCD8C98B;
	Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318043452.3302.16886704569637365016.git-patchwork-summary@kernel.org>
Date: Thu, 21 Dec 2023 17:40:34 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808237
  Lore link: https://lore.kernel.org/r/pull-1702037799-781982@atomide.com

Patch: [GIT,PULL] Fix for am335x usb boot hang
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811786
  Lore link: https://lore.kernel.org/r/pull-1703071616-395333@atomide.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


