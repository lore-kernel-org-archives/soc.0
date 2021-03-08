Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DF5C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 16:22:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 573956521F; Mon,  8 Mar 2021 16:22:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CA8A6522E;
	Mon,  8 Mar 2021 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615220568;
	bh=1pQf5As865nFveD7kdwkB2hGE6Xwl7BJYejgNXCQxyQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPq65gTc2+pSvnQ4wwqzh7JxvAvAEpAVZJl7nQqgAWaKGEl/+Yv6vzWe3xrWZyDG7
	 Lpq+5Pnri3EV04a8vK6kf4f/24Qp4vWn8U42q3kaFViQ47tsWkmmY04qYC0uQUmqf3
	 DYnEdquXgmL19SI7NP6fd/V+kkw4zPR9mPUd3y/vRMaEjxxN/EyqtnBLR10EbKsGuM
	 xol4ML9GwDu/8be7v7vJDcK97VCS1lhM4K53tqjtC+3J9wJblx1LymUgk+mOZjzYoj
	 CUhDV199kGxEmuGJLE2bkUBxHELTF27n6EytBBrQr1JK4TFtttd4Ysr7BdBfqV2Hfd
	 upblp+HXpfgAQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 05/10] arm64: dts: intel: socfpga_agilex: remove default status=okay
Date: Mon,  8 Mar 2021 17:22:23 +0100
Message-Id: <20210308162228.62614-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308162228.62614-1-krzk@kernel.org>
References: <20210308162228.62614-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New nodes are okay by default.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 25882faccbdb..f46d678ba775 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -472,7 +472,6 @@ uart1: serial1@ffc02100 {
 		usbphy0: usbphy@0 {
 			#phy-cells = <0>;
 			compatible = "usb-nop-xceiv";
-			status = "okay";
 		};
 
 		usb0: usb@ffb00000 {
-- 
2.25.1

