Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65611C636CC
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 19:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 188CEC433D2; Mon, 13 Feb 2023 19:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02C5BC433EF
	for <soc@kernel.org>; Mon, 13 Feb 2023 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676316617;
	bh=LpwCkVq805YNQUdwRxkiLShPCNHXcIStSjOtH9j3OAM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=kO59c4T8eC9iM058f5EO86N5fHcRr7IiYVFxja479/ctVz8mdBv6GICrmREdoK3L5
	 woFtJfUSpyCGHWyb6cin0bOrYQTgyjdyndE0uzTKQ9NOFafD8Zve3ymft03BrO6Vvk
	 FHpZ4e4HoPLsVGC9vpbKGn9/NG5nyjnbGop5x0kqEmIrbkTpLMRh5HTQ2vjJ6aTQIG
	 DOkZuy/3BpUb3FR10yA1ZiA3UAVBUnYMQ985kmi/6+YAaZET1f/Fx5ObkkW2RTp8Ai
	 3fgvuuoYyitjMaJy5YARXrcyStgHMk5NqPExdWNPR29p8BvN02szuacWs/I6fiBubY
	 srZOL07CuwC2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0A30E68D2E;
	Mon, 13 Feb 2023 19:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167631661675.8138.17922338310858775593.git-patchwork-summary@kernel.org>
Date: Mon, 13 Feb 2023 19:30:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: configs: Provide slimmed down configuration for guests
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720807
  Lore link: https://lore.kernel.org/r/20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org
    Patches: [1/3] scripts: merge_config: Add option to suppress warning on overrides
             [2/3] kbuild: Provide a version of merge_into_defconfig without override warnings
             [3/3] arm64: configs: Add virtconfig


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


