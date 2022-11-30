Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D8C4708B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2222C433D7; Wed, 30 Nov 2022 17:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC40EC433D6
	for <soc@kernel.org>; Wed, 30 Nov 2022 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828235;
	bh=6Vk4dzUNWIZGRj176xUDV/7nIwaMWRuSnx3KUYhGqXs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=mU3lILGnB6WAxHqBFOk0sSMBU3i4OvjVwcBB1ZlkML7uV9DdbZor5wSiY2uK+ALF8
	 iTA5ij+Vsdd2bNhSIB+VO/DRWoRCzvbkjVmvTLFJSEpeYBJV+nG92+GXslNqbIA1V7
	 CyJcfVf2tvK9bgdIbUEVANDXYCI9fqV7fdI71i8s9U8ge/YDwqEeQgdwb0/TsIP44y
	 lo0stJ8ToeykO/m2B4uCtsHR7hKf0fiRYt3bA/VCOUskLdh+NOfGNv7P3ha2uKi/n2
	 t1hkHg6NrIc9Wx4xrAFDklOjw7kWQPS0GCuWA7+c2nWlw67dJ9pV7rf8wKd2ECo7rQ
	 6rl067wDviFbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A63A8E21EF7;
	Wed, 30 Nov 2022 17:10:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982823553.9936.18187039978524951474.git-patchwork-summary@kernel.org>
Date: Wed, 30 Nov 2022 17:10:35 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] AT91 fixes for 6.1 #3
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699083
  Lore link: https://lore.kernel.org/r/20221125093521.382105-1-claudiu.beznea@microchip.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


