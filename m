Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FFAC48BE8
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 17:10:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFFFB6190A; Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CA5AA6187E
	for <soc@kernel.org>; Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623777003;
	bh=eN+CKMqCoqChRGzhvgvBkRUo/WaOPZMMkLzlP/KsDBk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=MECCWL5SQJ2JOEJ/4LTeUNPqloeWu9qpVef0LdXJ0CGBeafZUhOeiA/7vVxBZPHvP
	 Pdo8Flz+HdAUHS/ULElTnkT4wvaPc3Je50w17dRPtSWhNJrsXy5ZVHK8VBoUNR/bVF
	 6rFO20/TxIVDGgK4wSVbNrSnQ+i+93tg7uLx8f9a4KlyCEVF2IP5FUt1OFemG0KiSf
	 bl3d9qwOeq9dlcOf2Ntj4LqJSMeZwuqYVYsd2BLZZKcqlNp+yfaH/teXn5VWl5fKbX
	 VHj7PHtRkaeqKqiaeTCI+4DOJZfOAnr+Dh/qeC8CZTTOYapYh/hS9pvMKchOwsro7Z
	 OmGTUmhAsUJLg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B8448609E4;
	Tue, 15 Jun 2021 17:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377700369.21283.12812418477930894931.git-patchwork-summary@kernel.org>
Date: Tue, 15 Jun 2021 17:10:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] firmware: arm_ffa: Initial support for v5.14
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=491641
  Lore link: https://lore.kernel.org/r/20210601095838.GA838783@bogus

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


