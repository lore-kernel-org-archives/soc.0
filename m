Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B8020125F
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 01:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525233; cv=none; b=UcRB7agfWym0zeyrLMjLwj8s2TYJm/yJ8r/W83kdETroZt4zgBr3EJEhWUtPUw0P/0tNPby1fpzrG5pj6GV4LwMFEXepFG4bHlsCVJkMqtpRLlOkroYq/VtkCSzCfRrKGSsKk/XH+fjez5Qr0vPg+UiY4fKYNjeJxmmKZVEQRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525233; c=relaxed/simple;
	bh=ULS2g1USi1UgEpnVvldhHZzdHluYIrLyf0ttduLSiwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UxqSmylW9SYAujhaHtq97ZP73pwDIPFJrHXariAxdWkjCVHamMQi1ba+x9AIsqmpvI9D1weUjG/yW7/Rqb/HJ/u20ltsE83K33sONTCuJODYsqVQv9gsXkMiTJAn/DuNvXEPyzOV59Wgm/Zp3/T0OSC9tSJBheJurJGKdT77SmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=hxaJYLnd; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="hxaJYLnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768525228;
	bh=9xbT2i8fqJH2rLQlvMGk1gEUzId66wSa+fF/0n0f5hY=;
	h=From:Date:Subject:To:Cc;
	b=hxaJYLndCX4NJhTsf2cfDjNuNgmYMI87temjx6NsSu4bO+h2QK4jz6WA1TtuaaNYT
	 oIMifC5wmJJ1V+MeH/I/4DP+1sSq88xhsws/t8E7CUcHbMYV6VhX9Iph8e/ECKBcW/
	 Xdo8tcB/4eClxUUhuJQSXWMCZK3IPde3kisaBViGQBEizyfNsXjo/VDbb/MeAYBi1T
	 BrqSCqBYBIy7v1dzOsuOLdNAAevpQ/N7xM3ERCqwhimcOBO9Qx/AGALX4OxeKgMBcJ
	 X1Em3LC67U773H+yWht/BDRjQz5MhYGIvbF/DC9GlAuolBVJ8Oq1qrrmgfeCxFQOCh
	 5mA/buaRZZIag==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2FB3D7A005;
	Fri, 16 Jan 2026 09:00:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 16 Jan 2026 11:29:56 +1030
Subject: [PATCH] MAINTAINERS: Add Andrew as M: to ARM/NUVOTON NPCM
 ARCHITECTURE
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-npcm-arch-maintainer-v1-1-4abecbe1dc15@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAIuNaWkC/4WNMQ6DMBAEv4KuziHbQghS5R8RhTmO4AIbnY2VC
 PH3OHwgxRaz0s4eEFkcR7hXBwhnF13wBfStAlqsfzG6qTAYZVqlVY9+oxWt0IKrdT6VsGA3qn5
 sOjam6aBMN+HZvS/tcyi8uJiCfK6XrH/tH2HWqNEqptZysc7jg8LEFHxMslOqKay13WE4z/MLb
 xfPwMMAAAA=
X-Change-ID: 20260109-npcm-arch-maintainer-8b09b48e2248
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, joel@jms.id.au
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2311;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=ULS2g1USi1UgEpnVvldhHZzdHluYIrLyf0ttduLSiwE=;
 b=owGbwMvMwCW22PjiTL8dD5cxnlZLYsjM7F3GyfbuylfH8mgv1QsOs9wl53xenPnt+TwDBT6J+
 eIRSxNzOkpZGMS4GGTFFFlWBNoW3t08Kf7ngexjMHNYmUCGMHBxCsBE2I0ZGX6VqWybo/TQ/oKB
 14wlmqK/A2wnqfsz5d2XKtTOr1qWb8zwP6V2+Z2sW0/q32VU3ORtSoucZHW8T3a1VlmzuunRjFf
 pjAA=
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

Nuvoton's NPCM SoCs are part of their iBMC product line[1]. NPCM arch
patches have historically gone through Joel's tree along with ASPEED
changes due to their relevance to OpenBMC. Commit df5e674c7a99
("MAINTAINERS: Switch ASPEED tree to shared BMC repository") does what
it says on the tin - we now have bmc/linux.git on git.kernel.org, and
I've picked up the maintainer role for it.

Document that I'm continuing to apply NPCM arch patches from the
openbmc@ list to the BMC tree for PRs to the SoC tree.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Link: https://www.nuvoton.com/products/cloud-computing/ibmc/ [1]
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
This is a resend of the previously posted patch[1], but this time to soc@
with the intent that it's applied.

[1]: https://patch.msgid.link/20260109-npcm-arch-maintainer-v1-1-a0ec6aee22fb@codeconstruct.com.au
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..cd9d18083d8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3130,6 +3130,7 @@ F:	drivers/*/*ma35*
 K:	ma35d1
 
 ARM/NUVOTON NPCM ARCHITECTURE
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 M:	Avi Fishman <avifishman70@gmail.com>
 M:	Tomer Maimon <tmaimon77@gmail.com>
 M:	Tali Perry <tali.perry1@gmail.com>
@@ -3138,6 +3139,7 @@ R:	Nancy Yuen <yuenn@google.com>
 R:	Benjamin Fair <benjaminfair@google.com>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-npcm-arch-maintainer-8b09b48e2248

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

