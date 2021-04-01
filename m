Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF80C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 19:24:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F39061001; Thu,  1 Apr 2021 19:24:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A63EF610D1;
	Thu,  1 Apr 2021 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617305075;
	bh=36/7A4ejCga6d+w0S3CKrAwrU1ERsUk8zB/68nvokho=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kOBa6BE3CW/tlYYvRD7gIrQmnfraJmntIzGM0hQSP4XeMyB5PWj5Nsz51uqxAguxw
	 /wABq8BDc+RQfNO84KTyQLnmz9avQd+11i+qn/SnVFTs/o+LCBycXXVOjkJNJLhLYK
	 ZcIlowsj28W8OdVwkcbtNXSaUIQA2+/wFja7rQneAvvDX9GEymp8VG2ocaajUkgAgg
	 CxjmQMmUvFtDHU/+ocIx5R8gil++dmG/ckPSckFdD8p3gMmvmHaUClduAml+RqL/XO
	 H81btc+aguZuAk2YrGvu0BMYy87BNSB3lmHDiTbXKb9cK1s0WZAaybSZ9nDpjc/DjQ
	 7s/glElw3N0iQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	linux-imx@nxp.com
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.13
Date: Thu,  1 Apr 2021 21:24:15 +0200
Message-Id: <161730504504.632809.4091149331295571068.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:14 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 62c93360ec5a135061624eb095986799942efcbd

       Arnd
