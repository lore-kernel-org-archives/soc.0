Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC292C432BE
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B8F74610A3; Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A35F46108F
	for <soc@kernel.org>; Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629294613;
	bh=qIhATSzdhODxaYFth6SIFblTLlvSovoMm4FnV0ZUsL8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jdPrpLCqQ4kv/Bx/cQnUEg42owJf+0HxrSG9vAOWa0m9RfeDZLKDOJoS6XWTOUlHK
	 mwol05kqeM02cKRmIqTicsakOt7mWeYQFhZSIWN7vtbYQTLgIK/JC6xoTIH8xZXonn
	 STXaEEdqqx19OK/REtPn93CMMpbDprNESw2bFNwGonwqO7jWaUhr1mUwQPMGb8bwfk
	 rNAZSEbwlT6MVrC3JF8KNDsrATO4CQvXPnGmE6ZSKue+V9SfbLcozTzsrl/ye8ejhX
	 ZkvFHyUKLwPOkeh+T0zk3MlLd+s2mC86fhc+jH7MpkMLClZeLPHsqtfHqFQHQwLZW4
	 o7GmawGFe/jfw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 94A2F60A25;
	Wed, 18 Aug 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162929461355.9396.1617003556703739900.git-patchwork-summary@kernel.org>
Date: Wed, 18 Aug 2021 13:50:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Delete IXP4xx boardfiles replaced by device trees
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=531187
  Lore link: https://lore.kernel.org/r/CACRpkdY=sPDkzmbmm+0UQnJi7BXZKH14GLmyVwKC+4cLCJpmdA@mail.gmail.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


