Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3472D780B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240706; cv=none; b=FrQ+9HiV+ncaEM/AeJWqhvyRZn2xeI2dbukTn4UOC+48dz0MjPsceom7s9lpfBJKHJVVu52ovjRsE+/5gsCdfRBrfwWKlHwMH4+3Ldp8QUq3eeUfluTrkzldMXv8atUOynBDuyNAAfxKb+laRRBZtUBsHPKIKJrfPdRDvQpAT58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240706; c=relaxed/simple;
	bh=rxJr4tpi6DEPFP82taMvG15uH3s3cawAV/8Tlt7o4EM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQfXmu9OKEySDcTj8AT5/b3h0yTR7kCXEYMEZ0iIItLNreIcRlYGe+k/MMHBzM8smax2Qdw9UIOekzzCz7EMvFqWkVgNyzL1sbYHWlaOrMgNrgTK53vYlfSIDhTwCq5QEN+EUOMVeN49Lgg6w4wvm7oqy3YYaMAepw0Rdbp5tV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 56BDUjes015105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 21:30:45 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 11 Jul 2025
 21:30:45 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entry for Andes SoC
Date: Fri, 11 Jul 2025 21:30:25 +0800
Message-ID: <20250711133025.2192404-10-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711133025.2192404-1-ben717@andestech.com>
References: <20250711133025.2192404-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 56BDUjes015105

Add entry for Andes SoC maintainer and related files

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d79d546c2f95..3e16da28de50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21318,6 +21318,15 @@ F:	drivers/irqchip/irq-riscv-intc.c
 F:	include/linux/irqchip/riscv-aplic.h
 F:	include/linux/irqchip/riscv-imsic.h
 
+RISC-V ANDES SoC Support
+M:	Ben Zong-You Xie <ben717@andestech.com>
+S:	Maintained
+T:	git: https://github.com/ben717-linux/linux
+F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
+F:	Documentation/devicetree/bindings/riscv/andes.yaml
+F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
+F:	arch/riscv/boot/dts/andes/
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1

