Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FBBC48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1EEBA6191A; Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 090D561625
	for <soc@kernel.org>; Tue, 15 Jun 2021 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623776403;
	bh=PDB5JumFBWtJM5hE93+9VFDRK5sVRE25PBVLMz9Yk0E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=BG2d2uSMIODaAlSTZKkfWh2x/oYXFlYf0yGDlSsFR5IS+x3nqNgT5JDjRHQK97ASw
	 sL+qQ7DGP5VJga745MpKUUU7CAj3CdKqASF3AQxZzAp1uPKu+GRMQJWTQj9MIuJcHD
	 RyaE7S0OftJzCsMISofCGnpby7UU8L0bTe1BglJSJQ0Xe/YTq9ju2l8pMq4uN/yOkj
	 1+qnDUaZ32sNu3iHqHTumKBW3upF3dsT2+jxd/EalRTVKiK7lzshQ1lIWp+ClyyOSw
	 0OhtQ3OCEs3xyZpvoDNXI/3DxP/JAXsSiI9VF/o5+Y0MH8XMsQeEuEhj/zIghX2wdr
	 X/LFpdeNFNWlQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E72A360A6B;
	Tue, 15 Jun 2021 17:00:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377640288.16658.7668190182249333668.git-patchwork-summary@kernel.org>
Date: Tue, 15 Jun 2021 17:00:02 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: dts: mstar for 5.14
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500783
  Lore link: https://lore.kernel.org/r/CAFr9PXknSfSso6Uq0Fn_qJM5ZnJ4QK=YjJ32kKt4XYPrHK5x6w@mail.gmail.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


