Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31F5C4167B
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4020C433CC; Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEABCC433C7
	for <soc@kernel.org>; Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701880825;
	bh=FMCDGABMuIHgy8LuE4H3b3G1BGD6H/m/GVfan1dho+U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uOPk74iRWJ+BgVe90GswZgokLSr9HyHjf3d7RABAJazE5ZBySFrOe2XnCGsa98q7U
	 nzTYpTHlYkccDOkPcl/Jet8a1i9+1f/xXctsl2mP4g07c8GYpZHv6reBF7XLVJgNqI
	 ozB9eToiglsLEj8rc7Z7Na8MB+qcCukHqgA43shdMWJPAyUZ+KFBqLrGyWbnlsketD
	 IJz2JMWxiE939YGGGe7egRAGJoi7JG9ROZJQWx9WsoTPRyaX5JdlbfCj9GSzOVE/Mh
	 OlFM7J4T/5q41XpsajzBGLZuoANSkwwB+y+9F9lyYwAMUWkSQFH/2aXR5LmgTcse4/
	 CiV53GAFPbOAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97706C00446;
	Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188082556.26007.2618142173024937287.git-patchwork-summary@kernel.org>
Date: Wed, 06 Dec 2023 16:40:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v6.7
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=801725
  Lore link: https://lore.kernel.org/r/20231116191603.929767-1-sudeep.holla@arm.com

Patch: MAINTAINERS: change the S32G2 maintainer's email address.
  Submitter: Chester Lin <clin@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=801468
  Lore link: https://lore.kernel.org/r/20231115234508.11510-1-clin@suse.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


