Return-Path: <SRS0=hiSs=NN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2605AC432BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 10:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9087E61214
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Aug 2021 10:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9087E61214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGcF6lf1uFkb9iPxIozhewdAeK1aKIC9VOidqdi5UUs=; b=2xU1s2ZkHyZWQu
	vJfTETOGARN792dW8vZJZBuk0Lsy0CeqoBdobVnbMDg8u7VrrCCIkBLrRudbKI/ULDFeiDhd0hOb/
	NLDkUbDssv1dwkGNOF3PdvKd0pYhI1O7Xd/n1y+YGFdHtKCZz+xhIWSome9mZGpggYnp+0/huKZRH
	UkPs+0YlIAbV/9VORv5PZN3O5n4DexxhNX+plSFHOMBnVs7heWNok3YrYMpVaM4aYmiXPfzitplyX
	3QMkcmTAXJLRGegl/B4N0QP3wAykGgwzxXG47z3yCRFKrEXI2MArrKKS6C9UwzTTF+YCF3RmSSyxu
	DG03iJDc52oLIB86t9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHkW5-00Dopp-Gu; Sun, 22 Aug 2021 10:15:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHkW1-00Dop9-JU; Sun, 22 Aug 2021 10:15:46 +0000
Received: from p5b3b3c9d.dip0.t-ipconnect.de ([91.59.60.157]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mHkW0-0003pW-HP; Sun, 22 Aug 2021 12:15:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.15
Date: Sun, 22 Aug 2021 12:15:43 +0200
Message-ID: <9718620.EvYhyI6sBW@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_031545_716972_8BF2D0DE 
X-CRM114-Status: GOOD (  10.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210822101543.fDi-5CGOQDqLQcmfVe5k6n_ZbvPXfofwYGxsh_mWtqk@z>

Hi Arnd, Kevin, Olof,

please find below (and in the next mails) changes for
Rockchip platforms for 5.15.

Please pull

Thanks
Heiko


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.15-rockchip-driver1

for you to fetch changes up to 9e5747c57807ad8a04c356340190cfdd0bd54111:

  soc: rockchip: io-domain: Remove unneeded semicolon (2021-08-19 23:56:38 +0200)

----------------------------------------------------------------
Yaml conversion of io-domain bindings and addition of
rk3568 io domains.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: rockchip: ROCKCHIP_GRF should not default to y, unconditionally

Jianqun Xu (1):
      soc: rockchip: io-domain: add rk3568 support

Jiapeng Chong (1):
      soc: rockchip: io-domain: Remove unneeded semicolon

Johan Jonker (2):
      dt-bindings: power: convert rockchip-io-domain.txt to YAML
      dt-bindings: soc: rockchip: add rockchip-io-domain.yaml object to grf.yaml

Michael Riesch (1):
      dt-bindings: power: add rk3568-pmu-io-domain support

 .../bindings/power/rockchip-io-domain.txt          | 135 --------
 .../bindings/power/rockchip-io-domain.yaml         | 360 +++++++++++++++++++++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  19 +-
 drivers/soc/rockchip/Kconfig                       |   4 +-
 drivers/soc/rockchip/io-domain.c                   |  88 ++++-
 5 files changed, 455 insertions(+), 151 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/rockchip-io-domain.txt
 create mode 100644 Documentation/devicetree/bindings/power/rockchip-io-domain.yaml




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
