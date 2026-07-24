Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D353B42D7
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879413; cv=none; b=NLd1mBiQx3fLctl7BbqZxwp2jyRsns3kt5lC9U2twWWbuPB0fGYYu7QYCvElfrfQUEC9UDYcLRz/KiX6BEC7D/QtZBVVjEeFrzB9Ggs53yMWxFiTyop7R4mscmqU+pcQO0aw9pbXRV3aV91DckxNTD8XCWS8621IrSy6yTTm2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879413; c=relaxed/simple;
	bh=gv/QytketXBb6vNuESGC5VlG5U2r8qCFWZxmG9oFFkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UFaYFQBIxF4LSY7FVR2RzB8kInNQv2cRSmbVw1HdrnItBcUo3Ve38yNHWYPsFY0EiH0bUEF0fgmu635U5Cn10oDtrgt513J4rLJHOGT3pFL29sux0VeHt6EKKSmPLPXDN26OXBurip+m09/ayouVD5KHWWX/aoR2TzznSmuxxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIXpiX5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIXpiX5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AE41F000E9;
	Fri, 24 Jul 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879408;
	bh=Bp9rvWmCD3DpzkOE6WbKOB/ALQZQiEicFGw7rcyEDOk=;
	h=From:Date:Subject:To:Cc;
	b=CIXpiX5qGkFIrYv4JGByVCLQKqqHgJGJQl68Fe9l9rdR6StuePglw4jML1HM47S6I
	 Ej/AC+Z8YBkQVeMMyXfd2kGLW2qcO2faWXrcjl2Ujv3qyYSLKLibgoF8MhIjVlF33s
	 QxT2pDEBTv2Re0n8+1L+hXvZB1ScfVY+GjQffW3lhELtNpDmLjlpsSQZBPICU3TTY+
	 keAA6GEJEhKiyEchNvp080XYL2BdNmv6CrlJjrML3qI8DxP6NI//L76Gb5yq0fXtHl
	 6QbmrZwGw6M7e3m7/8gnwhs7MxKKXKqeGOQjQUzKwEdFc+eYNYmCNlbkJQZVNlhryz
	 0CWTH2REaiiug==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:50:04 +0200
Subject: [PATCH] ARM: dts: ixp4xx: Drop the reg-offset hack
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-ixp4xx-dts-fix-v1-1-09bf7111e94e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMT3cyKApOKCt2UkmLdtMwKXYvUpCRDQ0uL5LS0FCWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tAATLvKVyAAAA
X-Change-ID: 20260724-ixp4xx-dts-fix-8ebb1198cffd
To: soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

The reg-offset hack only works when the IXP4xx platform is
running in big endian mode, and it is there to byte-offset
the byte where the serial registers appear in the BE config.

This is clearly wrong, workarounds need to be in the
drivers. Drop the reg-offset.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
SoC folks: please apply this directly for DTS for v7.3.
The prerequisite patch to serial is already merged by Greg.
---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
index 0adeccabd4fe..b0f98da8def4 100644
--- a/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
+++ b/arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi
@@ -84,11 +84,6 @@ pci@c0000000 {
 		uart0: serial@c8000000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8000000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;
@@ -98,11 +93,6 @@ uart0: serial@c8000000 {
 		uart1: serial@c8001000 {
 			compatible = "intel,xscale-uart";
 			reg = <0xc8001000 0x1000>;
-			/*
-			 * The reg-offset and reg-shift is a side effect
-			 * of running the platform in big endian mode.
-			 */
-			reg-offset = <3>;
 			reg-shift = <2>;
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <14745600>;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260724-ixp4xx-dts-fix-8ebb1198cffd

Best regards,
--  
Linus Walleij <linusw@kernel.org>

