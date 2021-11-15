Return-Path: <SRS0=wqws=QC=socionext.com=sugaya.taichi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4DBC4332F
	for <soc@archiver.kernel.org>; Mon, 15 Nov 2021 09:30:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A419961AA7; Mon, 15 Nov 2021 09:30:59 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.kernel.org (Postfix) with ESMTP id DA99C6321A;
	Mon, 15 Nov 2021 09:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA99C6321A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 15 Nov 2021 18:30:57 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
	by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 93494205C83D;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Mon, 15 Nov 2021 18:30:57 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 245293DD46;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
Received: from scorpio.e01.socionext.com (aries.syh.socionext.com [10.213.112.88])
	by yuzu2.css.socionext.com (Postfix) with ESMTP id 08068B6291;
	Mon, 15 Nov 2021 18:30:57 +0900 (JST)
From: Sugaya Taichi <sugaya.taichi@socionext.com>
To: Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	orito.takao@socionext.com,
	sugaya.taichi@socionext.com,
	Masami Hiramatsu <masami.hiramatsu@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v2 0/4] Add clock node and phandles for M10V platform
Date: Mon, 15 Nov 2021 18:30:52 +0900
Message-Id: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 2.7.4

This series add a clock node of Milbeaut driver and clock phandles
to clock consumer nodes.

Changes:
from v1
 -fix wrong property name "clock" to "clocks"
 -add milbeaut MAINTAINERS

Sugaya Taichi (4):
  ARM: dts: milbeaut: add a clock node for M10V
  ARM: dts: milbeaut: set clock phandle to timer node
  ARM: dts: milbeaut: set clock phandle to uart node
  MAINTAINERS: Add entry to MAINTAINERS for Milbeaut

 MAINTAINERS                          | 9 +++++++++
 arch/arm/boot/dts/milbeaut-m10v.dtsi | 9 +++++++++
 2 files changed, 18 insertions(+)

-- 
2.7.4

