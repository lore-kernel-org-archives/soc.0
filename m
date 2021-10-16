Return-Path: <SRS0=Uq4y=PE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E854C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8F761181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A8F761181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXM4xkQ+Y54hyQrYH5V+lSBpkl++tLuzuu9Cy+2EQyI=; b=iWBND5BaKB75KS
	7I0VpsfpIeBOrJ/w3c1b5CNasVejDu9nDLktN+Sl0ilAhNioibFe7bYXZjigVF5nUIS1BD7aqNCw5
	hk422Rs1BXPSFIcg+QXRg6P+jri1VM/mYWlkEQT3ZFPtjjmZGnXe5ORK8lcQ+rO34Th0jZYdao+5b
	YAXLELUPsapUsrhjHlNaEc2hVILFBtcQNy5rD85+IGaOApayDC7sI+WT7tc+HqHPxvlxt3FMA3MOh
	5VLueQsV+hBs+Lu4roXMJ8GIuyCGt4qEhJUKE3p9dFs8xU5d/76U7HHRYkvEuHJIdI/DdNcNpdHvK
	QdX9Yra3KQHugi7ehhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbkH0-00Aiwc-2X; Sat, 16 Oct 2021 14:02:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbkGU-00AimG-Id
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Oct 2021 14:02:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2903D611C1;
 Sat, 16 Oct 2021 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634392942;
 bh=GLjOqLPq74/dCR3aSoHbOHdoq1BeHO1rkjwoae3yUf4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pje/+N64mbKVnsJ/coITvXhCBMaz0/MvmRl843rJrn986Zvt9J7RijZL8JWMGKCTm
 PEGN4IzzXJkmPR85eUCLT1lzL4mPWGNJPGWv73AOoF+VsqrP3E052ifqR1tcPeoLQQ
 4pMbCR6UmF/cXZYHcEwbsvklOshzJr1ySumXVhGGW07Bd8U8NyUPO39ktNF0D5Zq5F
 LfWhh5bJjHUS8CsuACkRUoSpQxVzuxAkL0jdv8pzw5sK6/H6E2Ztc5YhBehrz7UOH2
 iT0ULEGe1l8nA17dCnmg11sKEvRB9zd8/4mVYN17UnJZtQTpbzwnyaHu4zywyBeFdd
 XEXjKlSY0TiBQ==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] i.MX defconfig update for 5.16
Date: Sat, 16 Oct 2021 22:01:37 +0800
Message-ID: <20211016140138.1603-5-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_070222_659427_DCBDF798 
X-CRM114-Status: UNSURE (   5.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211016140137.rBaKisNwADunoDSNQdazQwlYddJKI0Fpt0rQeQ20mG4@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.16

for you to fetch changes up to e99a1fa731b4d3005ddee6751bc13ceeb136eb0e:

  ARM: imx_v6_v7_defconfig: Enable HID I2C (2021-10-15 10:49:53 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.16:

- A series from Marcel Ziswiler to update imx_v6_v7_defconfig for the
  new Colibri iMX6ULL eMMC variant support.
- Enable HID I2C in the imx_v6_v7_defconfig as it is used for a HID
  compliant wacom device on the reMarkable2 tablet.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: imx_v6_v7_defconfig: Enable HID I2C

Marcel Ziswiler (5):
      ARM: imx_v6_v7_defconfig: enable mtd physmap
      ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
      ARM: imx_v6_v7_defconfig: rebuild default configuration
      ARM: imx_v6_v7_defconfig: build imx sdma driver as module
      ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf

 arch/arm/configs/imx_v6_v7_defconfig | 47 ++++++++++++++----------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
