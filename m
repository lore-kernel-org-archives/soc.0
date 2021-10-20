Return-Path: <SRS0=Zsw1=PI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57AAC433F5
	for <linux-rockchip@archiver.kernel.org>; Wed, 20 Oct 2021 09:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03513610EA
	for <linux-rockchip@archiver.kernel.org>; Wed, 20 Oct 2021 09:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03513610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3dwpVGbB6stAy3GibMgBEELRlx3hzUsW8wZyQexKxc=; b=KV0MgKOz2xu5BY
	hyjFD23EdiePwF6i7CgOkWNO0525ugeFKWIm4SU5xLIws4dZ0okJp/A2LTOOtbQNV2IIsjY438COV
	+FjUgsA7vA5txFID5qZvzE4ft+eKG7Y5lJTSOGlCD+OsK2ETfUDzYXYec2bz9AIv+PlAgVmhbkgK+
	sBCcqG43rnRe5fpnH86jIkFM0QGl8afHlSyioNuA1pjN3YbiTARD2ejDQpE3D5X8hGlajENZMAJcQ
	tLDDzkjVpqd0fBDE1r14TGFqsWXTWzhcrhhy/JDzAXwYEyCGNjO23BaDSSQgSxA2K/KpsCe8uXdXH
	WOnqbDorddOy51sVdiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7s4-003yzl-Mn; Wed, 20 Oct 2021 09:26:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7s1-003yyl-H5; Wed, 20 Oct 2021 09:26:51 +0000
Received: from [213.208.157.36] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1md7rw-0002ZM-Fw; Wed, 20 Oct 2021 11:26:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.16 #2
Date: Wed, 20 Oct 2021 11:26:38 +0200
Message-ID: <4536780.s7XYDJ6uuW@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_022649_603178_76B1CEBD 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020092638._hwRNHBmyncb1kvt7OR3TUq0w362gKt4RHW-7WEDCzw@z>

Hi Arnd, Kevin, Olof,

please find below and in the next mail some additional Rockchip stuff
for 5.16 to go on top of the first round of patches

Please pull!

Thanks
Heiko


The following changes since commit 5a73d7ca7f7a64144e03ef0fc8eb6f8e5ea54df3:

  arm64: dts: rockchip: add phandles to muxed i2c buses on rk3368-lion (2021-09-23 21:44:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts64-2

for you to fetch changes up to 43f9699b0c12d4e50b66723213cef456c52254f3:

  arm64: dts: rockchip: Add idle cooling devices to rk3399 (2021-10-20 10:00:11 +0200)

----------------------------------------------------------------
Idle-cooling information for rk3399, rk356x additions (tsadc resets,
i2s, spdif, pwm), rk3368 powerdomains, fixes to make gpio subnodes
compliant with the new pinctrl yaml binding and addition of the
chassis-type for the non-sbc devices.

----------------------------------------------------------------
Arnaud Ferraris (1):
      arm64: dts: rockchip: add 'chassis-type' property

Daniel Lezcano (1):
      arm64: dts: rockchip: Add idle cooling devices to rk3399

Heiko Stuebner (2):
      dt-bindings: arm: rockchip: add rk3368 compatible string to pmu.yaml
      arm64: dts: rockchip: add powerdomains to rk3368

Johan Jonker (2):
      arm64: dts: rockchip: change gpio nodenames
      arm64: dts: rockchip: fix resets in tsadc node for rk356x

Liang Chen (1):
      arm64: dts: rockchip: add pwm nodes for rk3568

Nicolas Frattaroli (3):
      arm64: dts: rockchip: enable spdif on Quartz64 A
      arm64: dts: rockchip: Add i2s1 on rk356x
      arm64: dts: rockchip: Add analog audio on Quartz64

Peter Geis (1):
      arm64: dts: rockchip: add spdif node to rk356x

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   8 +-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  10 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   8 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 186 +++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |   1 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   2 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  22 ++-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  57 +++++-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 218 ++++++++++++++++++++-
 12 files changed, 489 insertions(+), 27 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
