Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFEDC2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FAFDC2BBFC; Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A469C32786
	for <soc@kernel.org>; Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501630;
	bh=3HGdNTTzpSrnD/q6cB1l/AaBtjtEydYou+gg4SgGgAI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=CfQotv7kozOpPMpI9jGLUkzSOhJ+EiydQwYU4wq0aajNM+Y0KYPqk7nqfc6vad/yE
	 vQQlzqiq9lpi7y/1zQuiHqkaGHLwZ36j5MRfEA7CkgIu+GxDmN0rBWaqZ9hn+3ABlo
	 W8Ygsgp76k9Zri9GUT6kkZyCweXc5GlyR0NUsttupdNVzTl6v3lu5hwZ0GNkksTDhL
	 0yy1qX3GcS6bOJY4PrPoIaKQyoWLqlCJOkkVEh6qG0ON5YVayZ2h6OTL1e4zbw2Ux3
	 rg5gOj/5+H/m3TfKjyjDy/gsztO6vKwGsodjKSvB8Z/f1WsSCOEg0/BepGIxuT2s1y
	 I0gXELDb0dMVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CD0FC433E9;
	Thu, 27 Jun 2024 15:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950163031.12878.8857351166367674493.git-patchwork-summary@kernel.org>
Date: Thu, 27 Jun 2024 15:20:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] OP-TEE fix for v6.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866146
  Lore link: https://lore.kernel.org/r/20240627125112.GA2674988@rayden


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


