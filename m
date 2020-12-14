Return-Path: <SRS0=HHLn=FS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74868C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 04:41:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3769B20798
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Dec 2020 04:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3769B20798
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1Aw/1YG0rR29IP88RD368EVdj3we7/9+uRiJ8CpaBQ=; b=pHue1VBAWyB+n2/1N0ecpfOtAe
	CNXx3cjz1HYtpv0S4Hb+zzqZu0SyQ+vpf2ssqkbQVzzN/I0cmaWrzmizZWKpXp60T+El5k8kSN7u6
	ornmeOHpGdX2MG1FkWiGjilyEunjIRkAOfY1ANS16Kn/jdE15jax9E/M2yLOTtEz2nhZLBUZ44R5X
	PntHS/VQngNMPEXjdM9DKUWJmdYwV0Yjq3WM1Vq5DTVOeHo+wvIR8jRWuS/X7+LUSNsn42DV0/xMF
	r2QRwS6xL3r52HXUrsMYIBCXbC8ai67bKMfianbyoQYVfoy25arVafz3pPGK12fJw3UeAieo6DGLg
	VxHt/0Fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kofeJ-0002WF-Ko; Mon, 14 Dec 2020 04:39:51 +0000
Received: from mo-csw1115.securemx.jp ([210.130.202.157]
 helo=mo-csw.securemx.jp)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kofeE-0002Vt-Hn
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Dec 2020 04:39:49 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 0BE4dUdA001482;
 Mon, 14 Dec 2020 13:39:30 +0900
X-Iguazu-Qid: 2wGrOZVerS5rKpi3C1
X-Iguazu-QSIG: v=2; s=0; t=1607920770; q=2wGrOZVerS5rKpi3C1;
 m=7IJesRA3jgnUPVGZgD82pe4Gu502rZKDIwbO2R71S90=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
 by relay.securemx.jp (mx-mr1110) id 0BE4dSoR014653;
 Mon, 14 Dec 2020 13:39:29 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
 by imx12.toshiba.co.jp  with ESMTP id 0BE4dSFD025201;
 Mon, 14 Dec 2020 13:39:28 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 0BE4dSZY025098;
 Mon, 14 Dec 2020 13:39:28 +0900
Date: Mon, 14 Dec 2020 13:39:22 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.11
X-TSB-HOP: ON
Message-ID: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_233946_994271_1993E136 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, SoC team,

This request includes the WDT / DT patch for the Visconti SoC.
Please pull for v5.11 kernel cycle.

The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:

  Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git visconti-arm-dt-for-v5.11-tag1

for you to fetch changes up to 7fbd66db6d852900a0f8168939e83b03a6bb959f:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2020-12-01 18:43:05 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.11

- Add watchdog support for TMPV7708 SoC
- Add entries for Toshiba Visconti5 watchdog driver

----------------------------------------------------------------
Nobuhiro Iwamatsu (2):
      MAINTAINERS: Add entries for Toshiba Visconti5 watchdog driver
      arm64: dts: visconti: Add watchdog support for TMPV7708 SoC

 MAINTAINERS                                      |  2 ++
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts |  5 +++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 12 ++++++++++++
 3 files changed, 19 insertions(+) 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
