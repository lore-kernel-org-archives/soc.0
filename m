Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31029D269;
	Thu, 22 Jan 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070677; cv=none; b=VrhkIkOxZ+Y8lxHTvYf1CFhk8KFbI6FzRf0Jo2glJbvKVkrdmGXfTJuX7JU1vcHNeQw/Op6xI0vSVHXSu6IfKMfJRAuLfC2rV4RWM1oWNFAwxtGBEv5Cb4BkNSn9Hp4f9ikJRaXSoHZ4zoeV+14J9yUd2Aq00GA+Jm4lx8pQllM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070677; c=relaxed/simple;
	bh=QhFUNzxOG8Udutb/P9to1XUFJDAY3dfkBF58G08AHIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UnFt+wdhRVL58E6nJHCl1vxSJfAXBz0QlV/oeVVms5MBM5fkEXpwLEyTysaq9C+qCgyEDQmO7DMfxlA53f6J99QXIgrrjpwy3KI4TuUyWC92RiAjnxj4peyjdQlOyKraxZETIwKlnQCjmUxsSYduaewikFVsVdixOqh+Qxth2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfQekGWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfQekGWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E45C116C6;
	Thu, 22 Jan 2026 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769070676;
	bh=QhFUNzxOG8Udutb/P9to1XUFJDAY3dfkBF58G08AHIo=;
	h=From:To:Cc:Subject:Date:From;
	b=JfQekGWTqjqFduJ+ZRgHWPAlzNbSfxq1b7SRk8NXllKiN9J2HcvNuhmVbOB8D1ZiW
	 07Hbfjda5kn1ZtD0mjPvAH4BayhpNpHgRbuxjVUHJHRFF66HSMbdt3KhSGehYSnXdJ
	 fo9vvSCyddQLolI6NYI0C0f94Uh8lU2A7GTB1gqCcoL+Xtf/a6dUFh0E30JYNDcto5
	 mGmni78k7CtHbmcK6KqgUhpU3z0Xz0LTsJZCj4qy3HThhdoKkyEC2YwZjjHVnvXjoQ
	 umnhckr7PvI7GcRm2e9RCzogVHboP3o+Uid9CqtjH9OKt3V3Xqv+j84qPYtwIDJxwF
	 S+BrDFj0JdV/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: drivers for v6.20/v7.0
Date: Thu, 22 Jan 2026 09:31:07 +0100
Message-ID: <20260122083108.19241-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2490; i=krzk@kernel.org; h=from:subject; bh=QhFUNzxOG8Udutb/P9to1XUFJDAY3dfkBF58G08AHIo=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpceBMOAyVoAd0VVfmui+bq5ulB8PkrZexUEVXm luK117wHXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXHgTAAKCRDBN2bmhouD 1/e1D/0ZxbjEf4spHVnZkB79SDZKagGrAd9LTkLkgySA1n3UDmL6J3HjhVZiTfC8feia7CFWIu/ /eI4CCNk1wcFxxbdSKGYUec+g2yEdL9HyASdPgCv12lSWF0/GIXUwZD2P0FSl4pcuaj9BtDbaBB 9ggiK9RagevWjz7NMc/rPgCn1Hlr37rRC1gSAeivI7X+/kYjxLSSZjQh3nBqDt8xZajo9IOR1TA 14Ki/fL+AWh5VVU6FcGrHsPQ+2dpTcR/2DCINYj4LE4VJUF/joswPZ6VF5ayDU6Jy8AoTXlKS26 hgscVlq1IZ2dUgfSRKudQKboJ61DsSRDrML9JVj5o4x5JpVhk3MEOCFg1HDtHIutfSwin1OjpMD LjW9oMZ5kC4qs/fW+WCCt8QgDC1ffc+vK0SoMG4ciylKWydcZeBmO4QPFIzxphS0sjCjBUyPczu eAaLuldxkyOmNl0oi/jftKWwdqXFnjVCay30H827Jfy6UUCGKgwuU/VVCbukrd4aZ6mt/JgRaJx tAd8LMPTJbPB2wEC2DCDfq77GKiGC7gfdNht0WnbKBX/vIo36d8sTPSjrhTfzxVjFuW0vKQG0i4 kUVAsXiY+ud+SAVhkX2eVZ9986LRTfXF+cc3zUU9PazCyRd1FbtFw2BWELD0XW6IUsRp8nETvnm VdfDvhKjKBM5Ezg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.20

for you to fetch changes up to 9805f2cfc883018f7bf84c84e3af3786c37dac7b:

  dt-bindings: memory: SDRAM channel: standardise node name (2025-12-18 17:10:05 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.20

1. Mediatek SMI: Fix old struct device reference leaks during error
   paths and device unbinding.

2. Memory Devicetree bindings: refactor existing LPDDR bindings and add
   bindings for DDR4 SDRAM.  These will be used for example in
   stm32mp257f-ev1 DTS.

----------------------------------------------------------------
Clément Le Goffic (5):
      dt-bindings: memory: factorise LPDDR props into SDRAM props
      dt-bindings: memory: introduce DDR4
      dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      dt-bindings: memory: add DDR4 channel compatible
      dt-bindings: memory: SDRAM channel: standardise node name

Johan Hovold (3):
      memory: mtk-smi: fix device leaks on common probe
      memory: mtk-smi: fix device leak on larb probe
      memory: mtk-smi: clean up device link creation

 .../memory-controllers/ddr/jedec,ddr4.yaml         | 34 ++++++++
 .../memory-controllers/ddr/jedec,lpddr-props.yaml  | 74 -----------------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr4.yaml       |  2 +-
 .../memory-controllers/ddr/jedec,lpddr5.yaml       |  2 +-
 ...lpddr-channel.yaml => jedec,sdram-channel.yaml} | 40 ++++++---
 .../memory-controllers/ddr/jedec,sdram-props.yaml  | 94 ++++++++++++++++++++++
 drivers/memory/mtk-smi.c                           | 38 +++++----
 9 files changed, 181 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr4.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr-props.yaml
 rename Documentation/devicetree/bindings/memory-controllers/ddr/{jedec,lpddr-channel.yaml => jedec,sdram-channel.yaml} (76%)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-props.yaml
