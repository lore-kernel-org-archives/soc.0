Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA9C433EF
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46686C36AEC; Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F737C36AEA
	for <soc@kernel.org>; Wed, 22 Dec 2021 22:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640210409;
	bh=YmGNCq1bPy1ELbRa7yN5TcgPUAh9CnhmohCDKQCFa/o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ub4XhxCqpGdHyYqtVCRjevBxaRUDaDbfUsQYTZbcfSjRmqkfkMdHbztAxIWGX+whv
	 XG49eF2/0QdnoDoAKKfhl4OErgNUyYtbvF50gJctvWdJ4rwFgKQ81YhAKioGvbDFSC
	 xXCMDj1u5dC57gs7+vyhaBDvPINzryHVTPMzdD7YukDMrYS43lAS0WBN2S/FZJY/Y1
	 RGYpHzPUAUsrcowcY+dsipZ2+fL4NX9qna67VL23fxBFcdkGVf1tDXEscztreCRofB
	 cA70y+ZtZpBpE0m8m089b2OJtEHmTBex0LK16c98p1YEzRGF/TsnMzOSx3u9EQN7jw
	 D28vHBc7pMxZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02A7DFE5620;
	Wed, 22 Dec 2021 22:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164021040894.6701.8041412725711173130.git-patchwork-summary@kernel.org>
Date: Wed, 22 Dec 2021 22:00:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: aspeed: soc changes for 5.17
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=599099
  Lore link: https://lore.kernel.org/r/CACPK8Xc6q=N6iFLnHt8RHhxvBhqu73WN9jBvitbwU3L6SJv85Q@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


