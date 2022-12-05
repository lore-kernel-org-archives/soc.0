Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF9CC4332F
	for <soc@archiver.kernel.org>; Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D996C433C1; Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71455C433D7
	for <soc@kernel.org>; Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670262015;
	bh=tPFMPn33NZgoM7AunDwB1AEK9gStzTFeyRWA8K3hYvw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KKvA8GC9LMs6nuJ0B5nNGk3YnN5WlgcyPmux2i7sKVvzb8tXUUGap5Y8jptvY4Ffo
	 6lWV4x2vMa78EA+Tg8OY+GETt13G7kFcVo1+PvmAfwsGRoKq45bWNTXM7LGsmSBXwS
	 EYuvzRgu4viOhI4F6VOcwJxrnJ/vqvJcJgPdN+gd8SjKdqYSElWjZizrsRzF4QYK2s
	 gdWWxZiuYBGCEXqyMihFPjd4cLTAmHh5eSXeDamH8X6Nqa5g75jF2Da8iznxEX+SzD
	 a29W1NhI5qjQCPPgtagy3F/Gj92JB/pwN6ggfYxzJRwussQP+kkWktwWSJajxqSK4W
	 DpCPTmt8DoFfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C025C395E5;
	Mon,  5 Dec 2022 17:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167026201525.16328.2226918331025040864.git-patchwork-summary@kernel.org>
Date: Mon, 05 Dec 2022 17:40:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [v2] soc: fsl: qe: request pins non-exclusively
  Submitter: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=701610
  Lore link: https://lore.kernel.org/r/Y400YXnWBdz1e/L5@google.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


