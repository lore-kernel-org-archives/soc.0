Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B301AC63798
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 777D52076E; Tue, 24 Nov 2020 11:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606216205;
	bh=kSp+5WHHL11ImNpWPyNmt1FT3QjgMBRvy0NvDVaQlUc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VN3Hl//gk5aD+9o6t1AnjkoGkbbWkpXsblygkWLdPa8Qp2v+OC7UQIO7588ujjvmk
	 PNr8LaPs/K+NgBkU6hRH205q22YRhElwcpM/RZuelC0TKsxCiB5ivQ4HDCElTWzLua
	 T0KcrOe3OUFCNUExi0QoK+x3j9kieE+fP/yN5kOI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160621620526.6746.16435919833488457015.git-patchwork-summary@kernel.org>
Date: Tue, 24 Nov 2020 11:10:05 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: soc: sunxi: Fix compilation of sunxi_mbus
  Submitter: Maxime Ripard <maxime@cerno.tech>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=390123
  Lore link: https://lore.kernel.org/r/20201124103546.839711-1-maxime@cerno.tech

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


