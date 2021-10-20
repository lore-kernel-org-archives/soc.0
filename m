Return-Path: <SRS0=Zsw1=PI=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D86C433EF
	for <linux-rockchip@archiver.kernel.org>; Wed, 20 Oct 2021 09:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C9D60241
	for <linux-rockchip@archiver.kernel.org>; Wed, 20 Oct 2021 09:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C9D60241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5BRKk3mWUC6GLW1KZCA1Iw4rLxsK+IJoOUdjqS61Yxs=; b=o8kDriGR3QaJTW
	K6QUOmCYN+29oyo9+4SFb1V0uexWVL+wKZgw/6j91yIkCjZHnozLn8Qr42FaJSL9nz1FfH+uOCUBO
	E3gd75yAfbs/exRVBkBfRxx03/A9Ekm7ogOBTYOqnJYcHyfmZb8Na+sPnNVdH+i0xLNtW3aXnHQoS
	ueNwC27G/jObnQ/2b8DwfWazEd5GxiCEZkXwHkqGptsWtBYt/Jpq8WiIC0aTSI+eH6r5jNVrKP096
	dBE36UzdCRIDGzynzT8oTiA3nvdgsTOycEoctkZ7mMMXmjphRR9DCCgHpLPEkR3bf2UTQ3GUe9ErJ
	0o7NcSOCj9wlOjD40E6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7sh-003z63-KM; Wed, 20 Oct 2021 09:27:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7sf-003z5B-8n; Wed, 20 Oct 2021 09:27:30 +0000
Received: from [213.208.157.36] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1md7sd-0002Zf-UB; Wed, 20 Oct 2021 11:27:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.16 #2
Date: Wed, 20 Oct 2021 11:27:22 +0200
Message-ID: <3630369.N7QejLDta5@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_022729_339250_3894C578 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211020092722.O7fFsuWbNIiSdldCvDB-mRjnQCZofwis5KqIs_xqXi8@z>

The following changes since commit 3e6f8124a78840d074fab36853ee1f5a2e7cffe5:

  ARM: dts: rockchip: swap timer clock-names (2021-09-20 15:22:48 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-2

for you to fetch changes up to 97ef6931208f7ab09f52dd291320aa53878aaa53:

  ARM: dts: rockchip: remove usb-phy fallback string from rk3066a/rk3188 (2021-10-20 09:39:26 +0200)

----------------------------------------------------------------
Adapt gpio subnode names to match the yaml binding and removal
of the actually non-matching fallback-string for usb-phys
on rk3066/rk3188 (most-specific compatible is and must always
be used).

----------------------------------------------------------------
Johan Jonker (2):
      ARM: dts: rockchip: change gpio nodenames
      ARM: dts: rockchip: remove usb-phy fallback string from rk3066a/rk3188

 arch/arm/boot/dts/rk3036.dtsi  |  6 +++---
 arch/arm/boot/dts/rk3066a.dtsi | 15 +++++++--------
 arch/arm/boot/dts/rk3188.dtsi  | 11 +++++------
 arch/arm/boot/dts/rk322x.dtsi  |  8 ++++----
 arch/arm/boot/dts/rk3288.dtsi  | 18 +++++++++---------
 arch/arm/boot/dts/rv1108.dtsi  |  8 ++++----
 6 files changed, 32 insertions(+), 34 deletions(-)




_______________________________________________
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
