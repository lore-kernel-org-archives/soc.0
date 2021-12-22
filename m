Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83168C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47C91C36AE5; Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31046C36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 19:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640201413;
	bh=VhRghoLBisxGyREZvDCNPkODd7rzPCfEaF0GljG4zFI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=q5DYaA6/qNXp04+Y3bjJJEIsDCe3taWw8LtC/yZD5eqk+uubL7rjyVgYrkmDBhsoj
	 fYgl/F/lc0uT5HqusT0T1mP7QOqHI5nksfrNDg6rqOWWlDztnmVflxNqhiGEZRULAf
	 pvR7qtnK/tbKyE0YKn/siODdv5R9ULUV+JVyhqW+Zxc0yoPOvBndXFjPA4m1Fx4Zpj
	 k9hMwNo3+UC/UBQPso/7KeecbLzsfqbPwBAhhwrvaA3iby+XHooOEidBxFsKGdX/h3
	 zYGhfNjAAVvG42Ok79rED5bdXb9Olu4ZeEeI4jFHx9JmUo8jTnzsspWaQFR59K76k6
	 UpOVsz8toXO9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3EDF11999A5;
	Wed, 22 Dec 2021 19:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164020141292.1988.8992852839721097701.git-patchwork-summary@kernel.org>
Date: Wed, 22 Dec 2021 19:30:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.17
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=599097
  Lore link: https://lore.kernel.org/r/CACPK8Xd1RfMLRbwBWqo8nm=w0V2AubmzraVW3h==XBcs21+mnA@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


