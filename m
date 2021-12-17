Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB68CC433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 939C8C36AEA; Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D896C36AE8
	for <soc@kernel.org>; Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639754430;
	bh=wrZMAU9kWcFY8R37KTRPP9t4n4+K8jeHRLr3CerJqO4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lJQi2KibMso0pSv7ocLY780oNQIl//rGSClJLat+vBKUKx6IoGQfDJ1s5EvNyXMsv
	 LrhbqT93Z4CBaSPZzrtW4ixTWXGS1WSxXbz5BqYEhnWulUoTmytDFBdohXk0Ohk1Wm
	 iNIzihwLKGICBXmmpcWQFta7Paz5qhUGTMQwONsAR25dGhcB9aEyfWCUKvIhaTAewt
	 1fZuG4e3uRqWlhIOuGxLauv2jTSCsBPFaWEBUDx7Zc130fOr5NP+PDeZerFAjE7ZyN
	 ZAtaxRqsVk09U+SlF8NXVRluLSh/tIyEPqHQls58QVQNDr4Lvc2VsxizqGy4oeVmP5
	 aR5SNmOh4J0ig==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 55E6360A39;
	Fri, 17 Dec 2021 15:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163975443029.14717.4968197105406795287.git-patchwork-summary@kernel.org>
Date: Fri, 17 Dec 2021 15:20:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] TEE and OP-TEE fixes for v5.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596729
  Lore link: https://lore.kernel.org/r/20211216150745.GA3347954@jade


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


