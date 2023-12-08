Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51718C10DCE
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24D29C433CC; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08596C433C9
	for <soc@kernel.org>; Fri,  8 Dec 2023 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702026026;
	bh=7NbTfE3Pte9IWDR8M3XAFKSYg9GVYBTqCgxuKMi/NAU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=k/YDSOkGueM0mE+9O84Kgit4olyjXqbdmkLn6q2Xugm46rN+5LBo1d+qFjkNh8x/G
	 Hgma4E+hKo3pebytzzdLiDodciV06PWBpx5HwL5CzIkU+NgjhL9B4IIhZ3QBM/4JD8
	 dfR8XsGcPg15mriDV5Dji8k4Xo4EPdbn/fc8NlOxeYSSPsBQiDdjCjS3XK60lffK5l
	 +fATnHZIpA/b5C19k8VhkMaxTzMc8DLC1iIMoSWfpeSfkqbiVKilfOazadw536hE57
	 XSaj9m2/lrCdGNInQnjNnW+1NgXNpfNxaGjnXifakUF+sQz7f0kbYJaYiaKjg/06Vx
	 Bw7T6/TsvY9Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2A06C04DD9;
	Fri,  8 Dec 2023 09:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170202602575.9233.1269801438386851605.git-patchwork-summary@kernel.org>
Date: Fri, 08 Dec 2023 09:00:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.7
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=807664
  Lore link: https://lore.kernel.org/r/20231207005202.GF270430@dragon

Patch: [GIT,PULL] Rockchip dts fixes for 6.7
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=807995
  Lore link: https://lore.kernel.org/r/2709704.mvXUDI8C0e@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


