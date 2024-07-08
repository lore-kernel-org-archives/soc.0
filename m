Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF816C3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6597C4AF0B; Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0244C116B1
	for <soc@kernel.org>; Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720468236;
	bh=9ByHtzxxOO6x5+QFAvnJN23ndvFFR5RCvwOepX+T50U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Mmh25QUr54twYsU4T6U6+DfJUaVPfZmNQlRmShLkopqoZABCJH4CAEbAn+THK0DhY
	 fteXMQQvJgL/w0lc4GQwXQFNkJ6aPvMNB+Up2S7CRN+1MIIbtEPqWCLebEwK3RWIfc
	 mkZlU9pcpu8wVdhMhpKiIZFNM+erVLEOwO8q98v5s9tbI8BPpygjpeVbbyZ3+y3zDl
	 ENb7+y6f6v6JkTUYGGVN3zahEi+bMSv5WL3muiqOKDJGXuSebAiFowd4rPLpEwuZgr
	 8GsEk62d8dl9brlaLO2ITiPHaZCEYIesFR6dWFbYmB6c571jbFeRQT/3DC2pNGUq7T
	 gx3oDj10yw9Vw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8964DC433E9;
	Mon,  8 Jul 2024 19:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172046823649.24660.1563797262433791567.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jul 2024 19:50:36 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [RESEND] MAINTAINERS: Move myself from SPRD Maintainer to Reviewer
  Submitter: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868720
  Lore link: https://lore.kernel.org/r/20240705091133.3308539-1-zhangchunyan@iscas.ac.cn


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


