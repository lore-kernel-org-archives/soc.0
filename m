Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C39C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBD54C3411B; Fri, 13 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CC8EC34117
	for <soc@kernel.org>; Fri, 13 May 2022 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652452814;
	bh=B8+gtLx7uXO6pxb5sN6/IsrY8EALW8PkbBOAs/3IV+8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=RfEiGzKS33DxvGID0TUkpBX78tdqsYA6Vbbw+Y4w0KyM+s3Tu2wXoUhln8e+ntSzc
	 AbRfulUmmMUFaCoHwFzMhaszklVR2AugPEw0T4rEugAtCzxfG6tfZr7MnI16BzjmQr
	 7GZ3lv7tpZ6bX5KOWAlBBbc1Ix0rr+pPG/hDGORLLvC/S9n79WMouHOK0xCwnt+LzD
	 lpbzUyWJ+l5QZI9uv3vibkEB2t/agv/+I8OkDr0Qc9INpLt7TSJq7iMGliRaerGkYY
	 GlKaHsC0ISa0K0hlgTTWE4xk9mPxceMJ1GWCWyJWeYTE6dj3ZMNxTjWvdf9CpSA4W1
	 IWw8mJOzW9+wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 746CBF03934;
	Fri, 13 May 2022 14:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165245281439.18991.11943460656904164015.git-patchwork-summary@kernel.org>
Date: Fri, 13 May 2022 14:40:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: soc for 5.19
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641383
  Lore link: https://lore.kernel.org/r/20220513121701.77683-1-nicolas.ferre@microchip.com

Patch: ARM: configs: Enable ASoC AC'97 glue
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641379
  Lore link: https://lore.kernel.org/r/20220513120632.168148-1-broonie@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


