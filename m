Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C89FC41513
	for <soc@archiver.kernel.org>; Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2FFFC433CB; Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B843DC433C8
	for <soc@kernel.org>; Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691013023;
	bh=rjZaRKCEgHcDJ9DNMIxBwDU5GcWZTvx8JBSmzpgz87w=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PV/X9R39QBILHCl71M+pi1HCeRqzg3uwzKxTNVPxApBLVQoj+rU7jNzrNt6LcDAz4
	 vPDfHN0l74d23tIwmpB6O/GNPq3pqMH1f6HyqXZdbgTnVMSWE8J6ztxxOJ3XKCVdUV
	 INQPmWiKdFb+Y/Y3A+acO0C1/epwFb5MvTt/Z0XhNCmF0BK6YSNhZyldW/kiM2bFOf
	 GSPobbjmmBP7zk0xj3HQxhipq3PKgolRstJOwQriS5uOEKrG4edLTZqfYmkaqSOJxM
	 Aj2BuUIromxzXjq9fnaPNkf9XjJtiEEKzDKlM0DsciHqgehhXy9cHkejTyaWFuXCe3
	 IY0nbtFfJtWZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E49CE96ABD;
	Wed,  2 Aug 2023 21:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169101302352.13079.12249534719454253481.git-patchwork-summary@kernel.org>
Date: Wed, 02 Aug 2023 21:50:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm64: dts: socfpga: fix i2c signal property for v6.5
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768939
  Lore link: https://lore.kernel.org/r/20230724145617.887443-1-dinguyen@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


