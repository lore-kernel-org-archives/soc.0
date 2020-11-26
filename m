Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699D6C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:18:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41762221F9; Thu, 26 Nov 2020 21:18:45 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 90E99221F8;
	Thu, 26 Nov 2020 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425525;
	bh=I1BoJ0vhy7sSP/lx5hyCotGKYnbA3f+PmBMwjnxcv7w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TOgjRyoiJQmD4QiNeTkG0Nw/DZYa65H9uk1VTFqcN1L4OW/vDBh3qYgGOchb+POMi
	 StU1twtSAQSYhi/YwgUn/4elgFJq1rlLD9yyzAf2k8Ub82m533M0iGfzO8MVB3HMdl
	 daccsjOejvuPE5STaVH+hOUaQeCEPC6X65GWEtTI=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] memory: tegra for v5.11, fixed (2nd)
Date: Thu, 26 Nov 2020 22:18:37 +0100
Message-Id: <160642550451.1427126.10005944613075579756.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126191241.23302-1-krzk@kernel.org>
References: <20201126191241.23302-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 26 Nov 2020 20:12:41 +0100, Krzysztof Kozlowski wrote:
> This replaces my pull 2/2 from yesterday as few dt-binding headers should go
> via SoC tree (to make everyone's life easier - drivers do not depend on them so
> there is no cross-tree merge).
> 
> The Tegra memory controllers work was big enough to get its own branch and tag.
> It also includes few SoC and clock patches, which I shared externally via a
> stable tag to devfreq tree.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 8f2685c9c4ffb68dd4360ea8c70fd75c3414bdb3

       Arnd
