Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2543DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 00:35:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C12C322C9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 00:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C12C322C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=evpVRmuxA6TLMX1AJ30HJEVNVpt/q2Uv5ECWHc3bLJ4=; b=Re9JAZ4nIVI300cpIvRPlaeNgZ
	V1/2f4rOmAXX4tpS0VeN57GoMMHihg6w9XHckdsBL58jrWA/+eczAfuaz1dQvTsMwLQZTe5KcVTVn
	Raoz0VAgAr18oTsDyQmQzJSoaIRW8xgfohc12yiGcs5KxFyfZojENrEGyKeg25cg3XnM+5eNRmZcV
	tfX0K2EFcozVq9JLelIk3Wqu7VPIKEHZLd1ZhcRKH9Ht+g/O6IVWSFiawOe2mA/V/7uMCm+Xm5ZTX
	0EVT/jD8jK9wIYrWc5oUgoIP/XqJYHe8/m/tHWskhLvRWyMORo6fxIdoq+g3YaHn62S1F5rEmMkcd
	k0ZonQ4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ppn-0003cV-Mz; Mon, 25 Jan 2021 00:34:23 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ppk-0003bk-EV
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 00:34:21 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 10P0Y8fI018826;
 Mon, 25 Jan 2021 09:34:08 +0900
X-Iguazu-Qid: 34tMK0YvimSKTYMrtD
X-Iguazu-QSIG: v=2; s=0; t=1611534848; q=34tMK0YvimSKTYMrtD;
 m=b7kM4uAU537iUyGKBTU1kvS/Ro32Ql6mfFF1bf4k0lg=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1511) id 10P0Y7nC008972;
 Mon, 25 Jan 2021 09:34:07 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 10P0Y7tj004060;
 Mon, 25 Jan 2021 09:34:07 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 10P0Y6b9008805;
 Mon, 25 Jan 2021 09:34:07 +0900
Date: Mon, 25 Jan 2021 09:33:57 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
X-TSB-HOP: ON
Message-ID: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_193420_832836_756215B2 
X-CRM114-Status: UNSURE (   8.67  )
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
Message-ID: <20210125003357.bgNI6LNJZT2g1ernEUlYK_nZlo2_0xDY8YBYNIP0BNA@z>

Hi, SoC team,

This request includes the WDT / DT patch for the Visconti SoC.
Please pull for v5.11 kernel cycle.

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git
tags/visconti-arm-dt-for-v5.11-tag2

for you to fetch changes up to 4fd18fc38757217c746aa063ba9e4729814dc737:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC
(2021-01-25 09:20:47 +0900)

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
