Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CD2C433DB
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9300464D77; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7CEB464D76
	for <soc@kernel.org>; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611703211;
	bh=PHbS2fpLomJHQcMyZVHdNrfCh03q+9F1b/ZayWEMXu0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=HNlriZnTfVxJ9/nABwhyFlZIV4HIS3XhY7qHXxupkkeUGt3pw3RV/txxzwOzF+49z
	 G2AiR1Kqlu6WrGeNhtuoLYYtvxMrZDEiMqHjgZ7Gn/6N6Pit/BcM2WOOHT3z8krEwN
	 bK/NnwDYqvU2e7Juk0nMuRGJtLBWlHjN+FZAsGg31uZfaHEFXlbKeJsxoki159lcju
	 nzWaK1BefmbGv+aXeJsJlsWkd+dTaNwT6GAOD8ZRHO4jmVRQp9wdWQWL2sEbqAk2eD
	 bR/0AYCVwYyjKM6xSEVys57Jl6vuF9QvoCL8jpv3DBZpv0tarYLMcOeghR8c9yG3sr
	 l6AczV2QIb5nQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 775AE61E3F;
	Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161170321148.26028.4093776934086889180.git-patchwork-summary@kernel.org>
Date: Tue, 26 Jan 2021 23:20:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
  Submitter: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=420821
  Lore link: https://lore.kernel.org/r/20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp
Patch: [GIT,PULL] STM32 DT fixes for v5.11 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=421179
  Lore link: https://lore.kernel.org/r/b7379980-857e-736a-85d8-58e2bd300141@foss.st.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


