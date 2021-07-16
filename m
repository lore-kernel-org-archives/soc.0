Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F1EC636CA
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AE1DB613F3; Fri, 16 Jul 2021 21:25:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC9C613F6;
	Fri, 16 Jul 2021 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470727;
	bh=qIngPEhm4MHjNtQPcXjNQXbOQlWpSU7RLPoWxxjBzi8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odjcPqjPH4CC/YcEy4n6ASMhm2Gypl9Bs/40amM86RwSV/OnpKy+E9WKZpR1mWtqH
	 1Nnl67/iVIE0Ap/X7DVCXi74q9Nnk5nYfmflj+Yv8t/GsFGKx8IqBX7sDL5vORTLvu
	 gOwVW9ri9mvoiAR/eWMRGCsxDvkTbJ80ykqBY1RvhArmPqcyQ1pX0apjz4PH5n0A1H
	 fy40pfnJA/xkOlTGyhSfOECWD3R912j7NxnHszGdfJALSPI8RBzaZvdLxdb6Ug4ixp
	 pfoHkcezXSDkb+VRKAdO+CgH0+AehAmKaiDbxBAXXyHJs6bUx8XirH2VwOBefbBejx
	 skxui/526lowg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:53 +0200
Message-Id: <162647049954.3478428.5986159195000598308.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165831.2617437-1-sudeep.holla@arm.com>
References: <20210714165831.2617437-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 17:58:31 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 2526112b681b587c469ccc5039b5d5be0ae3b5ed

       Arnd
