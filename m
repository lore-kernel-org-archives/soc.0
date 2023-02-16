Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E96C636CC
	for <soc@archiver.kernel.org>; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8918FC4339E; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6998AC433D2
	for <soc@kernel.org>; Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676586648;
	bh=ypQAx+KWU29p9MTEzLxUhjImXD0vdjI+/PxehKSc3MQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=O+EJKBNKVWibj6wHfuNpA+FvqVOb1wHJkP0T2W98GxDecV5NthkHJ7r4HHwDEx/Fw
	 0At2Wb57Ns5cnS3xFb+Z0fdhzTbZpmjTUz7Wt31nyzPD7fJnvGOlPwgB3gE5W5EVNY
	 x4OAdSSuvs8EIw7OAfmEcsf+vrcV5fatDyawzrwlg+vw9+++OODVeGLIRJj287LGGs
	 GL5rXFi/1mJcq1d8J3r6IkFEgs2PQv45i+zVROI45MmkpckEJ/dhdgJ5EX6/h8mbnv
	 8a3cg5RwuWwMJ4GbM1gAi3fnKBMXFW/GCcWWHI5ps17dFXTEasD9HWyB3lWUUJNWT/
	 2T67QxmIz4cOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46E41E68D2E;
	Thu, 16 Feb 2023 22:30:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167658664820.10028.16076918216144750245.git-patchwork-summary@kernel.org>
Date: Thu, 16 Feb 2023 22:30:48 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm: dts: socfpga: dts updates for v6.3, part 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=722607
  Lore link: https://lore.kernel.org/r/20230216160910.509065-1-dinguyen@kernel.org

Patch: [v1] dt-bindings: riscv: correct starfive visionfive 2 compatibles
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=722520
  Lore link: https://lore.kernel.org/r/20230216131511.3327943-1-conor.dooley@microchip.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


