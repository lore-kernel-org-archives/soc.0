Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F94C4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:06:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 013B060F35; Thu, 12 Aug 2021 21:06:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2986560ED5;
	Thu, 12 Aug 2021 21:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802366;
	bh=+2yZQfXZdLsI6A6VkJSHVsxcag02zhr2MFnb2//BM0s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KXEAOlZLBwj2lVNZ7epZMzDu9J6hnUX8K0bYqO1VBOGwVFPGLDZsv/pI84677VAAj
	 j8bGzrsgUPuvsu6sEFdLBEJmBcsJzHlyg/lXG/MsK++spe4IQyqVIz0lkamK3olziW
	 eeuWfOj3faDHBqM9TNfrkp8VHfQhS3U4WSmZhN5vC4ScKszmxatkif580Y+a877VCX
	 tWPudrwv+OksSWPLd6KQQPzB+ysWZv6w+pb7PvVhT478FlFiuIqoXXYAzLE9OdSBj4
	 gH6spko7VfDyYsSFkzqawtNv/6gvHPcG6tTjO4tP+LD1SuvUmVN1Y6ga1WSIx0zSrS
	 G66YJYUvtkMZw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: arm64: dts: TI K3 updates for v5.15
Date: Thu, 12 Aug 2021 23:05:43 +0200
Message-Id: <162880206147.1376011.10431613497274194194.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210809130631.pfvntcichsyeekbo@festive>
References: <20210809130631.pfvntcichsyeekbo@festive>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 Aug 2021 08:06:31 -0500, Nishanth Menon wrote:
> Here is the DT updates for 5.15. Just minor additions this time around.
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 5f49f22db4a82285fbd76b34026051712fdc28ac

       Arnd
