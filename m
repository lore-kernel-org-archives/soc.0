Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3816C0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BB45C433C9; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85860C433C8
	for <soc@kernel.org>; Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835621;
	bh=0641p+G2uYksYSP1F1kyFmgge4FopuZ6wTxWj3lnCXE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GxPqxsq83NBU1Mi0rUeiOtyIq+r7jlYeuk1HtZnXbPw44Dt6pCOKAxdFXLCcpGXlQ
	 shn7SKhL2+PHtGuaGM+suhBkETUgKkFVbHA1k0toJ24lMDfh+knHEkl7p1vJgphEwt
	 H2vG5gkhVDBzEw527q7uaszlpJQHairqZBsKwQf70tp8ryc+4JbgXSRovzt4/zk1fS
	 2G/EZ44QiDqSM4RfXZ/wLdJcaWGId96TES0xQUffFSQiIgzUxxJt247/KzHp932pPe
	 3fKvEruFQVcKqQtGp5Yg6j4GDrrvVJSGm/rfZW+hhpftLIPVF//CiXDmLVJz7u/Z12
	 tz9wNuPAqgvMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 650D5E505D5;
	Sat, 12 Aug 2023 10:20:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562133.32343.7481631775202826130.git-patchwork-summary@kernel.org>
Date: Sat, 12 Aug 2023 10:20:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: soc: aspeed: socinfo: Add kfree for kstrdup
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774965
  Lore link: https://lore.kernel.org/r/20230810123104.231167-1-joel@jms.id.au

Patch: soc: aspeed: uart-routing: Use __sysfs_match_string
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774964
  Lore link: https://lore.kernel.org/r/20230810122941.231085-1-joel@jms.id.au


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


