Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBAAC3ABA2
	for <soc@archiver.kernel.org>; Mon, 16 Sep 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39E75C4CECC; Mon, 16 Sep 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1A7C4CEC4
	for <soc@kernel.org>; Mon, 16 Sep 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726491029;
	bh=lIomUxt7ayzdDZVUfkOZAdrSkaaqY96VT5t6Afmtq0w=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qtEb+TaxjE4ChUZq7t2LWaV0rNxzb3hxzOCFABNJZNH6UJi+iIwS/sgKGVD5afFFj
	 9eG4EpvjNUTHD481RKpMb/dNY4MdQWy4Ir0+EwIZ2w6vGCSsqIH6Wqc9t9E1/ZB2vB
	 flgnU7GZWbL3loiGtebDBp+cA3wn79mWwv1HP0R36YYFm3scFdtippLbh8/Knb48NJ
	 toQOSfmFX/sJPDfshYCBqWsrHPEZXgYu2/Zl7saoouPZswF8qY406CSKdNxACip1PP
	 XoQK9irFTQEovhAIw7355LIt2oQrxC84l9sr1dnN0OoXudnmowJsPBe70qqqqMSeAl
	 Tb9EYtj1Hv1IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B3CDD3806644;
	Mon, 16 Sep 2024 12:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172649103026.3685310.9461897339671306493.git-patchwork-summary@kernel.org>
Date: Mon, 16 Sep 2024 12:50:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: dmaengine: cirrus: use snprintf() to calm down gcc 13.3.0
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=889817
  Lore link: https://lore.kernel.org/r/b1f03ac53b358c135516bec98e626c98aee9d867.camel@gmail.com

Patch: pinctrl: ep93xx: Fix raster pins typo
  Submitter: Nikita Shubin <nikita.shubin@maquefel.me>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=889979
  Lore link: https://lore.kernel.org/r/20240913045829.11904-1-nikita.shubin@maquefel.me


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


