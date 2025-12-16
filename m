Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F292F39B4
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908118; cv=none; b=CkS21eE1Hpfi5Ok1rboov3+oHBRJYYCW/12Oz2a8AidS4g5EssSBTBKwNtnflWjzm6LOyHH91dEEz4ADWp+DwC9eSdfLdIkwS2Tc3K8OWyMDnBwunaVoxqUzh6SEz5QKFkdoYvMqrAEmz2ZvMCbcjKKujMq15624YOfBZxi9NH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908118; c=relaxed/simple;
	bh=xMaX3QBtQv1lk9V+j96iD8r68T/FChgKYcwcSrmgoZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXVdKd6lepel/xqgpdAiBomxATqy8SzwGkBJTTyxe5N69mz6R6xCA3rPuhpWgWASv6z+PpGu2ZpgA7vrMk+1b1GhjDo/XVjqqJHbJMArKQY4KeEndFK5f4QTQZYecOkGaQyo5JjdUCSwnwnv7zIOOUARdakePJxBTPSAdmCQeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT9RsRy/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT9RsRy/"
Received: by smtp.kernel.org (Postfix)
	id E8C61C113D0; Tue, 16 Dec 2025 18:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BF8C4CEF1;
	Tue, 16 Dec 2025 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908117;
	bh=xMaX3QBtQv1lk9V+j96iD8r68T/FChgKYcwcSrmgoZc=;
	h=From:To:Cc:Subject:Date:From;
	b=lT9RsRy/2HQoNZzgcRcQhVgYqYmwRak8xE6yvXO9UMVkzOLtWntvGtpuqtLacP0mQ
	 9r+OUpfRhOvGGR0CUehbOXHIJBOxVtz/oSvqMHoxIik1t90JHMk8/i0m9ddTJNGPjf
	 Qqc3ca1jFc4DD8SB9dpO61BOkbwKygjOSbrbIes5SNHEU7QIhqFh9UIRCCKMX+RyKL
	 tqazodJv503LhdZObT2C5I5HJU9Q+F9gAp/KVdh/ZTdrqooHYr/RHwjmtWMHiq29z6
	 ZzkzSPkggK1c/R6X95sFyu8M65awiTk4+7DzMJpcitd85Q59lUH7TOKCl4AJgZxCNK
	 wpDlG3IlThlig==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: cavium: thunder-88xx: Add missing PL011 "uartclk"
Date: Tue, 16 Dec 2025 12:01:37 -0600
Message-ID: <20251216180136.2794105-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
Thunder2 SoC is missing the core "uartclk". In this case, the Linux
driver uses single clock for both clock inputs. Let's assume that's how
the h/w is wired and make the DT reflect that.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
SoC maintainers, Please take this directly.

 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
index cc860a80af51..70430cb2b053 100644
--- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
@@ -401,16 +401,16 @@ uaa0: serial@87e024000000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x87e0 0x24000000 0x0 0x1000>;
 			interrupts = <1 21 4>;
-			clocks = <&refclk50mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&refclk50mhz>, <&refclk50mhz>;
+			clock-names = "uartclk", "apb_pclk";
 		};
 
 		uaa1: serial@87e025000000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x87e0 0x25000000 0x0 0x1000>;
 			interrupts = <1 22 4>;
-			clocks = <&refclk50mhz>;
-			clock-names = "apb_pclk";
+			clocks = <&refclk50mhz>, <&refclk50mhz>;
+			clock-names = "uartclk", "apb_pclk";
 		};
 	};
 };
-- 
2.51.0

