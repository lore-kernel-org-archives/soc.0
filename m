Return-Path: <SRS0=eGr0=GF=socionext.com=hayashi.kunihiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6290FCDB474
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 02:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FFF2C433CB; Mon, 23 Oct 2023 02:12:31 +0000 (UTC)
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by smtp.kernel.org (Postfix) with ESMTP id E8812C433C7;
	Mon, 23 Oct 2023 02:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8812C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=socionext.com
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 23 Oct 2023 11:12:27 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 969B12059053;
	Mon, 23 Oct 2023 11:12:27 +0900 (JST)
Received: from kinkan2.css.socionext.com ([172.31.9.51]) by m-FILTER with ESMTP; Mon, 23 Oct 2023 11:12:27 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id DF4A7B1D40;
	Mon, 23 Oct 2023 11:12:26 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/2] Update UniPhier armv8 devicetree
Date: Mon, 23 Oct 2023 11:12:19 +0900
Message-Id: <20231023021221.2884828-1-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update devicetree sources for UniPhier armv8 SoCs to add
missing cache properties.

This series combines the following patches:
- https://lore.kernel.org/r/20221107155825.1644604-21-pierre.gondois@arm.com
- https://lore.kernel.org/all/f9a2c0d7-a78d-9368-f9bb-e8aba11e7d81@socionext.com/

Krzysztof Kozlowski (1):
  arm64: dts: socionext: add missing cache properties

Pierre Gondois (1):
  arm64: dts: Update cache properties for socionext

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 2 ++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 4 ++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 2 ++
 3 files changed, 8 insertions(+)

-- 
2.25.1

