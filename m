Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7D5C433DB
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 21:42:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 749AE64F92; Tue,  2 Feb 2021 21:42:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C60B264F64;
	Tue,  2 Feb 2021 21:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612302142;
	bh=tHIskrs77dAlTC67id/8EbLayMPvIv2xvnqtYbicfpw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbZfQlZCgTNZRdEfxguubzEXJzM3yCC0BkedmGOlEVa5DVARCOwTYELnEcwIxPifB
	 Qc8OVpVl4HcsXBE476bpvbzq/kTIQhbOjXTOXLTHBSyQXHdQdni6Wwc116eCWRotlO
	 EW6i49hCtqgDfOncRmzAKhYP3ZODeFtKScH8mtcPm0uAqS8/F6XR3EqaOwEwCE08EI
	 20P9zIYv050NFfOMi12Ctb6GYyx/dir/ZLmjBhRufjyzLq/1rEvqIbfyVi7wBPjHZl
	 R5DEqZKNCZSoNlSi2lCqT5LM48zTzvwzjKeqfNlGeT+dkcEeYoYeFwkTLWfab/MQvC
	 eR7d2pRnYKCQw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Argus Lin <argus.lin@mediatek.com>,
	Neal Liu <neal.liu@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] defconfig: mediatek: updates for v5.12
Date: Tue,  2 Feb 2021 22:42:18 +0100
Message-Id: <161230212660.1903845.9537222226422007061.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
References: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 11:19:36 +0100, Matthias Brugger wrote:
> Here comes a few updates to the arm64 defconfig. Please have a look.
> 
> Regards,
> Matthias

Merged into arm/defconfig, thanks!

merge commit: 77bad664169a7b5ea954638cf049d063b8b055cd

       Arnd
