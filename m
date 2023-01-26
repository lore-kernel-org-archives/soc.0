Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDC9C27C76
	for <soc@archiver.kernel.org>; Thu, 26 Jan 2023 00:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C64BC4339B; Thu, 26 Jan 2023 00:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F257AC433EF;
	Thu, 26 Jan 2023 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674691349;
	bh=yLPNFzTBNCt0XlW+j0CgFFQIwtj2V3Qm1Jc5KfZzn8k=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=BfF7QbpIL+1UfTSIPQslYX/210fg0OQ9ZUQOygxGKHnH6EpoUV+zzwdhHda48L1If
	 iMMvyQIgqf7T7E/lY7Hxe6MCwBQCy3yvbqYIAKSIjwSxtfxcycbGOUradpZ4annCwn
	 r2uOSLr3s69SYgk52mWb+K64567OeFCIiLW1PMDjRd0LWLT26BZcm4t+Pq7qwlMaUG
	 YrTDbBuzqla8uV2FFm/ep7JEXttWSsj34Sm6ozZYvKYqOwxq/l0KWQM91RT+ZK9lW5
	 HSG3aB6RXlzv2rfyy3Cyc3+NJraXheWN4c0m7RrrMdjfyI6/oKIVJCr72oJ1PS3N2B
	 XEVYNn7ykdxzA==
Date: Thu, 26 Jan 2023 08:02:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable wm896x audio CODECs
Message-ID: <20230126000221.GJ20713@T480>
References: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Jan 06, 2023 at 11:14:12PM +0000, Mark Brown wrote:
> The wm896x series of audio CODECs is used on a number of Freescale
> reference designs, enable the drivers in multi_v7_defconfig to improve
> testing coverage of those systems and their derivatives.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Applied, thanks!
