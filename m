Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC4C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CCF32208FE; Mon, 23 Nov 2020 16:52:13 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8A4072080A;
	Mon, 23 Nov 2020 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150333;
	bh=xEKbns/7WgyQeJJkCyyk+TdVMhcn6EO3H0Cxj3uEwJE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qo8/WunnUnWNQraChLH2nJSq+FPK5++L2kjAlEBGKdtoFbx5rnnYG18fwZ56cqDoD
	 URwxoRe/MnlQKxKPRQstGnZ7ax0o0BYhMLPY46WK9TsrHvaOCJcSwRfNGmVqSplRlK
	 5acRJe8z4SzbEto51p7CavmZgS0pNgmeVhYGeLww=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Ux500 DTS updates for the v5.11 kernel
Date: Mon, 23 Nov 2020 17:52:01 +0100
Message-Id: <160615031130.69876.14111749991085999461.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
References: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 23 Nov 2020 15:53:55 +0100, Linus Walleij wrote:
> here are some Ux500 DTS updates for the v5.11 kernel
> cycle. Details in the signed tag!
> 
> Yours,
> Linus Walleij
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c7cf673399144361e696be5bdf5848a7e6f1053a

       Arnd
