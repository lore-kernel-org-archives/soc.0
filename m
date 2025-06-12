Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B012F4317
	for <soc@lists.linux.dev>; Thu, 12 Jun 2025 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744411; cv=none; b=D/plVpQkYagDLbs5XK6NYTVxA5Fs7WKNtDkPwrJ13ZluAQT4dQxqfCoY5lklSz7x+cdI3ByZWb6kexPTubyQG5QqntBL3CDJLiL6dE+cGLLUlAT8od5ZX1O5uiyDQiGiI9MM3jrE8blWBLzfzTPVYMV702zDoq44xsWHAlaHJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744411; c=relaxed/simple;
	bh=ZAakH7JY2J4n18h6E+SokHqphhMulroZXjK6ElSbnnc=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=punq0+Kp8KDoudqhbN+Fc5MsDQRsMsD4OSoaQoJw+7Ma/6I2lv1WFvNg0zNCp9L7/JZZ35eaJZl/mSJe4ZZZmLGJwgCL7nvto3il4+STNDWrEpxDTHNmIvNN9Qoh+gr0ppLbemF910Xm0JFqeL2YD56smOBmvvQCac6RYjBeqrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 55CG6DsO080874
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 13 Jun 2025 00:06:13 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 00:06:13 +0800
Date: Fri, 13 Jun 2025 00:06:13 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <soc@lists.linux.dev>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <samuel.holland@sifive.com>, <daniel.lezcano@linaro.org>,
        <arnd@arndb.de>, <tim609@andestech.com>, <ben717@andestech.com>
Subject: [GIT PULL] Andes Voyager board patches for v6.17
Message-ID: <aEr69QIikSuD+iCf@atctrx.andestech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 55CG6DsO080874

The following changes since commit 0bb71d301869446810a0b13d3da290bd455d7c78:

  Add linux-next specific files for 20250612 (2025-06-12 14:07:02 +1000)

are available in the Git repository at:

  git@github.com:ben717-linux/linux.git tags/andes-newsoc-6.17

for you to fetch changes up to 8909a9795ed9991e9ed12d7bf21c9648b2c2f22f:

  riscv: dts: andes: add Voyager board device tree (2025-06-12 15:45:26 +0800)

----------------------------------------------------------------
Andes Voyager board patches for v6.17

The patchset [1] for the Andes Voyager board (including the Andes QiLai SoC)
has been tested on the latest linux-next/master branch and reviewed on the
relevant mailing lists.

[1] https://lore.kernel.org/all/20250602060747.689824-1-ben717@andestech.com/

----------------------------------------------------------------
Ben Zong-You Xie (7):
      riscv: add Andes SoC family Kconfig support
      dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
      dt-bindings: interrupt-controller: add Andes QiLai PLIC
      dt-bindings: interrupt-controller: add Andes machine-level software interrupt controller
      dt-bindings: timer: add Andes machine timer
      riscv: dts: andes: add QiLai SoC device tree
      riscv: dts: andes: add Voyager board device tree

 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml  |  54 +++++++++++++++++
 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml |   1 +
 Documentation/devicetree/bindings/riscv/andes.yaml                            |  25 ++++++++
 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml                  |  53 +++++++++++++++++
 MAINTAINERS                                                                   |   9 +++
 arch/riscv/Kconfig.errata                                                     |   2 +-
 arch/riscv/Kconfig.socs                                                       |   9 +++
 arch/riscv/boot/dts/Makefile                                                  |   1 +
 arch/riscv/boot/dts/andes/Makefile                                            |   2 +
 arch/riscv/boot/dts/andes/qilai-voyager.dts                                   |  28 +++++++++
 arch/riscv/boot/dts/andes/qilai.dtsi                                          | 186 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 369 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
 create mode 100644 arch/riscv/boot/dts/andes/Makefile
 create mode 100644 arch/riscv/boot/dts/andes/qilai-voyager.dts
 create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
