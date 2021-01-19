Return-Path: <SRS0=BTt4=GW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D32C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Jan 2021 09:21:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BF4620867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Jan 2021 09:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BF4620867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAyzZFvYDFj+p+F41kUqlcs1c46bhtH0+oN3PNn4J1o=; b=V4vP8aWlLCzoyy7W9IxLXsrkc4
	vNteQR2Aj1SBimGSIGOCYEG+GAOaZtxpubjLWdWNTT/nm9HLDCl9z2ylhJ6wjqaaQClP6WGt8hHZZ
	KzoIVzGdiNLFMaCPl3r+qZnCn6JxkD/AWWvrreId2Z1a6YpmR4FvaFG0iG3yxdHRySNuIyTw7FVUc
	fPEyGglnSMBcUJ/UqQH8UqHRUwfAJBVZiP18MTvde+jL0hU86lztUSFu+KpgteLAq4isNG66k+TcC
	qnKnCytY/9w+a9oI/J545ICWQtpMT4MmkOSY5LyqOWoVu6kwZrxTUYDQa0UfAE8NdPVpKpQQi5vZu
	dxrv3gXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1nB8-0007cL-E3; Tue, 19 Jan 2021 09:19:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1nB6-0007bl-4R
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Jan 2021 09:19:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B18EE221E5;
 Tue, 19 Jan 2021 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611047995;
 bh=O/5kQqcq4qRB+UaQtUNJmlRDcDNK+ncxctN2+NVYmok=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=k3LSqnp2BpKV3TF/m+aUdnRfQPj9w8PXBjVejBP2FNKKBHV6MjLmIeBLssmC9EXlk
 1Q8BWgVr+oIOqrbDw30dtvAUa//YXabyO2MlErxjPNcKPsJlNOe42D92KOppq5cXgZ
 t38HnPle91IryaqRoBsHb1f+a8Pu/dGV/UuEa+rGRuw3M9Vygx+1C3/ZoqJHvQaQ7t
 M1Io0ukPd26XuLhgHIJ0G83Jh6tuflDeOkta+atih6+zbUHVjFZUDUWxESeNNzn6VI
 NU2ajPJMx5UzQiuPPpfBHIrsPy3iBTwSs+558wE9dkOe756WKhrtRP3aaBYfXEuDh+
 qV83Dlrl8QiNg==
Date: Tue, 19 Jan 2021 17:19:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] i.MX fixes for 5.11, round 2
Message-ID: <20210119091949.GD4356@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_041956_251714_457708DC 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210119091949.Kz7hJoQ5AXibhhmusWvrle8OrE9rlRh9cqwl2JPeVcM@z>

The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:

  ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2

for you to fetch changes up to 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11, round 2:

- Fix pcf2127 reset for imx7d-flex-concentrator board.
- Fix i.MX6 suspend with Thumb-2 kernel.
- Fix ethernet-phy address issue on imx6qdl-sr-som board.
- Fix GPIO3 `gpio-ranges` on i.MX8MP.
- Select SOC_BUS for IMX_SCU driver to fix build issue.

----------------------------------------------------------------
Bruno Thomsen (1):
      ARM: dts: imx7d-flex-concentrator: fix pcf2127 reset

Jacky Bai (1):
      arm64: dts: imx8mp: Correct the gpio ranges of gpio3

Max Krummenacher (1):
      ARM: imx: build suspend-imx6.S with arm instruction set

Randy Dunlap (1):
      firmware: imx: select SOC_BUS to fix firmware build

Russell King (1):
      ARM: dts: imx6qdl-sr-som: fix some cubox-i platforms

 arch/arm/boot/dts/imx6qdl-sr-som.dtsi         | 12 ++++++++++--
 arch/arm/boot/dts/imx7d-flex-concentrator.dts |  1 +
 arch/arm/mach-imx/suspend-imx6.S              |  1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +-
 drivers/firmware/imx/Kconfig                  |  1 +
 5 files changed, 14 insertions(+), 3 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
