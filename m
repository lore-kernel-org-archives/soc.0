Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF394C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 17:19:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 979CE64ECC; Wed, 10 Feb 2021 17:19:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3823364EC7;
	Wed, 10 Feb 2021 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612977552;
	bh=UQZmJPyUrCZnK9e0DT6jGZRT4VtnkmY1IlgeadpSMF8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B395kkAGg9fEAGQVXKxSPdBfTzxIGYmbWR4+45Y3eKQP1CivpCglNQ7rOB+i7x08m
	 yb+fDZTJ/G8yISBXhCGvy3JxKFY+3htJmmTM1SrVrrssyIM+UrWQpySfVPD7awOTIl
	 d4AC+w0uPzktTOp7wPol3dQhtR04GZN7BKyH6jOpDDC5zQQQW/9UKmdzKzCJC3Zp3C
	 M/HK42lh2zjOl8eIZy9mePqVdc2VapeVk+klrIUHq4A5m3sxqsHxRhWGxegeSJJxAf
	 SEBqkazyj3DestiGTT79Z0xw9uPBNVjnhMBUxeeAyZ1FnFBy5EOBjwAdle0voPag/Y
	 Khlf6imRHgsuA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 06/11] arm64: dts: intel: socfpga_agilex: remove default status=okay
Date: Wed, 10 Feb 2021 18:18:18 +0100
Message-Id: <20210210171823.333802-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New nodes are okay by default.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 30dcf9978067..750237b9c5c1 100644
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

