Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4F6C433E9
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 427B864DA1; Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B7C964D9D
	for <soc@kernel.org>; Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612888850;
	bh=wOWoc6+fWgkAiSgNiru7I8qAVG9o/xvTDpN+KBK9zVg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GaRMtqCd5n4EjmC2/bW4UDleJdpJQn4DMs+5MTQXplljfMWY+Gtb+gsF5ACh/JdIc
	 0+m+t11hw3R2LhKPUzVEBfykM/F6iUn3wak01DXHDjKthgNIkYBPV5cp5GEpzGLi9m
	 71dY8fRpCZpXSx0S3fHKVIbAjZ7myfacLjYxGGj9QmveC277vNSZFsM/t4xYrBNrEN
	 qYpcgPrYfzhGeRBhJxrg3MQ0WPAYAu4W2+GFVVYyOejAbNL2vMCd04/3vkqFRikknr
	 Nl3Hx+DXvmjptnVrV/G81C9yjhmzHWmLRUfeTqzYAeOHrCR3q+YaFM/TcWYe+w4p3e
	 8lCkGIfL02N5A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 14F46609D6;
	Tue,  9 Feb 2021 16:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161288885003.29773.13750502984315148058.git-patchwork-summary@kernel.org>
Date: Tue, 09 Feb 2021 16:40:50 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: ARM: at91: use proper asm syntax in pm_suspend
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=427991
  Lore link: https://lore.kernel.org/r/20210204160129.2249394-1-arnd@kernel.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


