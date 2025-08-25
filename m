Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13860EEBD
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128339; cv=none; b=o02WL6YIWXvxU8kayEEV0f9xhCanQQz6+FMGd+DtYSoB3Ls+utczxrNq/lfYnB9uWUSRG6SIZusk5Ym3D+xCESHsPCYNFO1EurAuOsL6pV14be3Gty9THVU4iXU5UX7TSf19KNC4Izt1vTTzDmukTWQWh3+QAexuMX/vwIuFVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128339; c=relaxed/simple;
	bh=dDGfVXPTXUc+lhk3Lg39/E3mFbtsIw6OKta/+0yOoR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fKp2bdncrDBO5eXkT91ujEwNYvqos9df1IJJfiMim8zmW8sXmtoTD71al1i7VUTnahKQJTNqmAQE9C8+FWxHkxzg7dnueDhAvH3I2XmkEnnMMNB7oJLODL9ShL3cWw+KOwS2iJaxtAwkcm4FS9kipfLsgQtZSL0YVgACw+Gz3BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=io19osl6; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="io19osl6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=3266; q=dns/txt;
  s=NAESA-Selector1; t=1756128337; x=1787664337;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dDGfVXPTXUc+lhk3Lg39/E3mFbtsIw6OKta/+0yOoR0=;
  b=io19osl6ExC5TgCAOwXnZNWjpGf9EhErwjoGJMd4DVLDmGgYnQCIn0Us
   fMoNVzlxkfkYkT7HYZLadB0Bu9ED+d3MGCmxzKl0jbyrCbP6vN/pd6YIW
   EhQYTLlq7+TU2zypgPDt+Cz1YgOnmSHPMEkDIDn6jKjhzicyvlHRspHAH
   1sPYfh2CxKClNl09x5FU+mhRmnkrq4fjOgaZ9Iq+potVwxPyGgNI3S7eG
   VcOhcdzNw0Y30rS2LGXbXQ+l7i+wM61yY8a83kDnTtAgw7mytY57JP3im
   3kfIJrPPtku3nmYJXOSyP5QonZu5kNjnVpD/BHj/h0CfAHL7K46Wmbqr0
   Q==;
X-CSE-ConnectionGUID: 7TXP5ZjGR7yy35uA9wyQ5A==
X-CSE-MsgGUID: uzCgM+dETmGZ1MCevw7cbg==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31949996"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:28 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Mon, 25 Aug 2025 18:54:21 +0530
Message-Id: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0736 (UTC) FILETIME=[95074580:01DC15C3]

Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
P550 CPU cluster and the first development board that uses it, the
SiFive HiFive Premier P550.

This patch series adds initial device tree and also adds ESWIN
architecture support.

Boot-tested using intiramfs with Linux v6.17-rc3 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

Changes in v5:
- Rebased the patches to kernel v6.17-rc3
- Drop "dt-bindings: vendor-prefixes: add eswin" patch (Patch #3 in v4)
  as it is already applied by Rob Herring [1].
- Link to v4: https://lore.kernel.org/lkml/20250616112316.3833343-1-pinkesh.vaghela@einfochips.com/

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250825&id=ac29e4487aa20a21b7c3facbd1f14f5093835dc9

Changes in v4:
- Rebased the patches to kernel v6.16-rc1
- Drop patches that are already merged
- Added "Acked-by" tag of "Min Lin" for Patch 4
- Corrected the commit message of Patch 7 (Patch #10 in v3)
- Added "Tested-by" tag of "Ariel D'Alessandro" for Patch 7
- Link to v3: https://lore.kernel.org/lkml/20250410152519.1358964-1-pinkesh.vaghela@einfochips.com/

Changes in v3:
- Rebased the patches to kernel 6.15.0-rc1
- Added "Reviewed-by" tag of "Rob Herring" for Patch 4
- Updated MAINTAINERS file
  - Add GIT tree URL
- Updated DTSI file
  - Added "dma-noncoherent" property to soc node
  - Updated GPIO node labels in DTSI file
- Link to v2: https://lore.kernel.org/lkml/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/

Changes in v2:
- Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
- Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
- Updated MAINTAINERS file
  - Add the path for the eswin binding file
- Updated sifive,ccache0.yaml
  - Add restrictions for "cache-size" property based on the
    compatible string
- Link to v1: https://lore.kernel.org/lkml/20250311073432.4068512-1-pinkesh.vaghela@einfochips.com/

Darshan Prajapati (2):
  dt-bindings: riscv: Add SiFive P550 CPU compatible
  dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC

Min Lin (2):
  riscv: dts: add initial support for EIC7700 SoC
  riscv: dts: eswin: add HiFive Premier P550 board device tree

Pinkesh Vaghela (1):
  riscv: Add Kconfig option for ESWIN platforms

Pritesh Patel (1):
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 9 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi

-- 
2.25.1

