Return-Path: <SRS0=5Wg8=LP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C20C4743C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 23:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA6F361001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jun 2021 23:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA6F361001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O6x5hdhHuo4+pEDNDoeV1BILQ0Vu02yMIGs4IE7BJcI=; b=WNefcWWdEaB+zw
	3hxeU3UpRIhjftBxehX5/y0OC5C1MCDOG2yw7+POZ7MqBB17FX9TrSa/mih8qICynAPoTn1mPRN6U
	klxPsL6KgFErE/Rq6iC5cy8/Tf9xC9D71ig76OvYERDhaLd7+ACiefpOjp5byeyj9iDCex7O274at
	9UH25XvAMLZxL/r6Tj1M4Vv1IMCCdYqmrMDzBlvtguSV1bc3iAsoMMLJA1gtivBiMLmwmFLq6jP1X
	xvA1ouiC71PiqIn+oj8205Olpo41hqNu+FMSo9yzqAq+ZNtpnPLxSvxEv1LPG7/GpIPnYVa+DmjE/
	w+CO9ohrRsL6BVRRhBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvT0I-0053Ei-99; Mon, 21 Jun 2021 23:06:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvT0E-0053Dx-3y; Mon, 21 Jun 2021 23:06:51 +0000
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lvT0D-0000T9-0o; Tue, 22 Jun 2021 01:06:49 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.14 - #2
Date: Tue, 22 Jun 2021 01:06:48 +0200
Message-ID: <4611716.rnzMqkiUVr@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_160650_208779_8BE87E73 
X-CRM114-Status: GOOD (  12.29  )
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
Message-ID: <20210621230648.B0nbh9ONyBCV4HGnkVFVydmzAn12P4SikVi2T6PqAVc@z>

Hi Arnd, Kevin, Olof,

the relevant driver changes landed in the media-tree a short while ago,
so if time still allows please also consider this 2nd pull request for rockchip
dts32 changes for 5.14 containing the nodes for the hantro-based
video-codec on these socs.

This pull would go on top of the one I sent yesterday ;-)

Thanks
Heiko

The following changes since commit 623ba75a5d6b8e196a21f3ed36d26a5f6db459ce:

  ARM: dts: rockchip: add power controller for RK322x (2021-06-13 18:25:07 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.14-rockchip-dts32-2

for you to fetch changes up to 36e9534dfcb5b09b919d2831d6a19aa3856b95a1:

  ARM: dts: rockchip: add vpu and vdec node for RK322x (2021-06-22 00:21:27 +0200)

----------------------------------------------------------------
Nodes for the Hantro-based video codecs on
rk3036, rk3066, rk3188 and rk322x.

----------------------------------------------------------------
Alex Bee (3):
      ARM: dts: rockchip: add vpu node for RK3036
      ARM: dts: rockchip: add vpu nodes for RK3066 and RK3188
      ARM: dts: rockchip: add vpu and vdec node for RK322x

 arch/arm/boot/dts/rk3036.dtsi  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/rk3066a.dtsi |  4 ++++
 arch/arm/boot/dts/rk3188.dtsi  |  5 +++++
 arch/arm/boot/dts/rk322x.dtsi  | 27 +++++++++++++++++++++++++--
 arch/arm/boot/dts/rk3xxx.dtsi  | 12 ++++++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
