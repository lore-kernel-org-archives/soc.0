Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB51BC433EF
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:00:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D0AE61184; Fri, 15 Oct 2021 07:00:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCF656108B;
	Fri, 15 Oct 2021 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634281228;
	bh=ZdbIWoWbV0Jf2S8p/rqDHwmcj+pmcu4J/c3RWMASNtc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=iihmB383d77TE9dqJ4ss8yuPtz1hRt8lzOGdn5tClAYoViMOpLbX8KDadmx2njxMl
	 6UlpcE4oUXz8Fwl7pdduHzGkaY3iwOZBCxP6tjEI/5d2opS0+SnNlZXOi1OpPRlahW
	 S205YWA+P5PAPBourbOeDmDxGTSQ7EiRXSum/uY4SLz964zcFBIK5eZuDdWZHXQkvs
	 v27EJcUsRlEPYcwPiMTE8nVX/C1eXdvTao2tju7WnkYgLI9yycaQx1C6lyahDm9abj
	 juXxjKSJOvHW4UB1dloae4D4d/p2fXMRm3Ci/Xr4SH9q04c6Am+w6uuSj143N8W4AS
	 AXt2scKX94O8w==
Date: Fri, 15 Oct 2021 15:00:22 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.15, round 3
Message-ID: <20211015070017.GI22881@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 3518441dda666696707afe933586151c0fb29db0:

  arm64: dts: imx8m*-venice-gw7902: fix M2_RST# gpio (2021-10-05 14:26:21 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-3

for you to fetch changes up to a1467faa10414ab3d91be7ef6d2b11272ec00e95:

  ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)

----------------------------------------------------------------
i.MX fixes for 5.15, round 3:

- Add platform device for i.MX System Reset Controller (SRC) to fix
  a regression caused by fw_devlink change.

----------------------------------------------------------------
Philipp Zabel (1):
      ARM: imx: register reset controller from a platform driver

 arch/arm/mach-imx/src.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)
