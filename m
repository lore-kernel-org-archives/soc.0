Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724704;
	b=hpm8gcysRI9GUfam7rLOM5kxAqmySBltk63kP6twanr2QUBYkskqb9EDGMizFK6n3zvI
	 WRkqwcNpGFO1HmZrQr8O34OafALpvIRdQHkFm8KaLfDxEWjQPLapTojpQtJMyajQJVwLz
	 6juw/4Uhv/Guv3qtZQvT6LgUpVUIZT7wZLul407vn43aUVn+e8rk8kKqGOrzK3hEfmd0v
	 GSyDHjxaeGXYPj6a+nFaKq5aaKvSDPqza2UZokHCANnIpzYoOy/i+agljl6lKC2CxbeTW
	 aQwHr1aie+T4Eo8l6z6IhEqp1EPtZd1OGc5akggg8FTfXLU6fNH+sBXq/4s149+YGQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724704;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=woa7EOh5UAsqCtxD3lyEVmcAxgpUIwsqWAHetzXhIwQ=;
	b=1sC9qp8u0VeOX1rV5aJnJuiIPW1G7tgYafE6k+BIbYoyF1g76Z498XcFm5iy88v07lDI
	 UL5evH5PkYLAyMcOS2VQJc0lN2+pI4MRpAQ5YFDb4A1LmjEOOjTuMyyc6YmZ4h9uN/p4m
	 y7WdoLVuXJz39ogm3CpZyodKdFz9ebJmIXe3j5v6WO8RkWX2t6DAlAvGJ9Tle+92kq9t6
	 FcUDVsR/zeMr2HqfQgxlrj4BEW+O5hfnXHFCYzWp8Tc8rbR1oqrrwdfJE5Qwfvz7gv1S+
	 W860XJoEJmhJaIcXZ52dZ4uNriRIHqJvjim/G2Q2oB93shSFxsEklroOItgNUFbrhew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sxbx+MNw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDF606A321
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sxbx+MNw
Received: by smtp.kernel.org (Postfix)
	id 733DD1F000C1; Thu, 26 Nov 2026 20:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0462B1F00893;
	Thu, 26 Nov 2026 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724703;
	bh=woa7EOh5UAsqCtxD3lyEVmcAxgpUIwsqWAHetzXhIwQ=;
	h=From:To:Cc:Subject:Date;
	b=Sxbx+MNwCDZ+iaiXnoEhuvuHiOL4T1YywRIFvoz4cXaYbPob1PTyoF6JpH323UXo2
	 pDF4MkBWV9q3tni6nAz5GNfOaVQf5pUiF4K2sTwW6EgPvFZnzgUgdUh9GMZzQwwG4I
	 BeUw9UnKbHDQm4jYWRdA2V/HR2XhmccVUAKYIsd3zQO+CFtbhWk9EvLPnoKeta7h/p
	 7VmZew9GVwIfXYo7A/Om8zPMTlKO94iJtmd6VT4EmZTiK1S7PqWC5pm3wq0t8tYjwr
	 PF9oDxxTyYnWnSa6BntdQWv+jjO8Ct/W+jK3XHZeXolLW8E+NmI3/vvpuLMhU8OoZD
	 j3USeo7K/x77A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Sarannya S <sarannya.s@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Ishu Brar <patches@brar.si>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>,
	Kaipeng Zeng <kaipeng94@gmail.com>,
	Kenneth Kabogo <kennethkabogo2@gmail.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pan Chuang <panchuang@vivo.com>,
	Tony Truong <tony.truong@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.5
Date: Thu, 26 Nov 2026 21:24:52 +0100
Message-ID: <20261126202454.12588-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.5

for you to fetch changes up to 5389b53f69b93a8c642c81ee08ad6654a6ed10a2:

  firmware: qcom: Allow QSEECOM on ASUS Ascent QN10 (2026-11-16 19:46:05 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v7.5

Add protection domain mappings for Shikra and SM6125, CPU frequency
support for QCF3211 and IPQ5211, and SoC IDs for the IPQ5210 family.
Add IPQ9650 LLCC and SM7250 UBWC configurations, and match the PMIC
charger log on SoCCP.

Allow QSEECOM on the ASUS Ascent QN10, Acer Swift Go Pro AI, HP
OmniBook Ultra 14-kg0xxx, Surface Laptop 8th Edition and Mahua QCB.

Fix SMP2P bounds checks and IRQ domain removal, APR packet validation
and GPR port lifetime, and PMIC GLINK altmode work item lifetime. Fix
command DB probe ordering, an MDT segment name overflow and PAS-TEE
resource table handling. Validate SMEM private entries and skip
unsupported multi-remote-host partitions.

Avoid clobbering SPM control registers and correct the SDM660 silver
L2 AVS value. Make PAS metadata retention explicit and streamline GENI
transfer mode selection.

Describe the ASUS Zenbook A14 and A16 embedded controllers, add the
SDM670 AOSS compatible, and allow sleepstate entries in the SMP2P
binding.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: pmic_glink_altmode: Fix use-after-free of work items on unbind

Andy Shevchenko (1):
      soc: qcom: cmd-db: Use %*pEhp specifier to add some sanity

Anurag Pateriya (1):
      soc: qcom: pd-mapper: Add support for the Qualcomm Shikra SoC

Barnabás Czémán (1):
      soc: qcom: pd-mapper: Add support for SM6125

Bjorn Andersson (1):
      firmware: qcom: Allow QSEECOM on ASUS Ascent QN10

Dmitry Baryshkov (2):
      soc: qcom: spm: fix the SDM660 silver L2 AVS control value
      soc: qcom: spm: don't clobber the SAW control registers

Gopikrishna Garmidi (2):
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
      firmware: qcom: scm: Allow QSEECOM on the Mahua QCB

Ishu Brar (1):
      soc: qcom: ubwc: Add SM7250 configuration

Jason Pettit (1):
      firmware: qcom: scm: add HP OmniBook Ultra 14-kg0xxx to QSEECOM allowlist

Kaipeng Zeng (1):
      firmware: qcom: scm: Allow QSEECOM on Acer Swift Go Pro AI

Kathiravan Thirumoorthy (7):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650
      soc: qcom: llcc-qcom: Use lowercase hex consistently
      soc: qcom: llcc-qcom: Fix whitespace in slice config arrays
      dt-bindings: arm: qcom,ids: add few more SOC IDs for IPQ5210 family
      soc: qcom: socinfo: add few more SOC IDs for IPQ5210 family
      cpufreq: qcom-nvmem: add support for QCF3211 & IPQ5211

Kenneth Kabogo (1):
      soc: qcom: mdt_loader: fix off-by-one heap overflow in segment name

Konrad Dybcio (2):
      soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
      dt-bindings: embedded-controller: Add ASUS Zenbook A16 EC

Krzysztof Kozlowski (9):
      soc: qcom: smp2p: Fix use-after-free of irq domain on removal
      soc: qcom: smp2p: Fix out-of-bounds with incorrect DTB of too many outbound entries
      soc: qcom: smp2p: Fix possible out-of-bounds read with too many inbound entries
      firmware: qcom: pas-tee: Always initialize resource table output size
      firmware: qcom: pas-tee: Fix purely theoretical out-of-bounds read of resource table
      soc: qcom: apr: Reject packets with header size larger than packet size
      soc: qcom: apr: Fix theoretical use-after-free of GPR port on concurrent RX callback
      soc: qcom: apr: Narrow critical section in error path of gpr_alloc_port()
      soc: qcom: cmd-db: Fix probe race with possible ERR_PTR dereference

Mukesh Ojha (1):
      firmware: qcom: pas: Make MDT buffer retention explicit

Pan Chuang (1):
      firmware: qcom: Remove redundant dev_err_probe()

Richard Acayan (2):
      dt-bindings: soc: qcom,smp2p: add sleepstate support
      dt-bindings: soc: qcom: aoss: Add compatible for SDM670

Sarannya S (3):
      soc: qcom: smem: add IN_PARTITION_RANGE helper
      soc: qcom: smem: validate private entry list walks
      soc: qcom: smem: validate private item payloads

Tony Truong (1):
      soc: qcom: smem: ignore multi remote host partitions

Viken Dadhaniya (2):
      soc: qcom: geni-se: Split IRQ status clearing from mode selection
      soc: qcom: geni-se: Avoid redundant transfer mode selection

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../asus,zenbook-a16-ux3607oa-ec.yaml              |  64 +++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smp2p.yaml   |   2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c               |   2 +
 drivers/firmware/qcom/qcom_pas.c                   |  12 +-
 drivers/firmware/qcom/qcom_pas_tee.c               |  12 +-
 drivers/firmware/qcom/qcom_scm.c                   |  10 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |   3 +
 drivers/soc/qcom/apr.c                             |  15 ++-
 drivers/soc/qcom/cmd-db.c                          |  18 ++-
 drivers/soc/qcom/llcc-qcom.c                       | 145 ++++++++++++++++-----
 drivers/soc/qcom/mdt_loader.c                      |   3 +
 drivers/soc/qcom/pmic_glink_altmode.c              |  29 +++++
 drivers/soc/qcom/pmic_pdcharger_ulog.c             |   1 +
 drivers/soc/qcom/qcom-geni-se.c                    |  20 ++-
 drivers/soc/qcom/qcom_pd_mapper.c                  |   9 ++
 drivers/soc/qcom/smem.c                            | 105 ++++++++++-----
 drivers/soc/qcom/smp2p.c                           | 107 +++++++++------
 drivers/soc/qcom/socinfo.c                         |   2 +
 drivers/soc/qcom/spm.c                             |  10 +-
 drivers/soc/qcom/ubwc_config.c                     |   6 +
 include/dt-bindings/arm/qcom,ids.h                 |   2 +
 include/linux/firmware/qcom/qcom_pas.h             |   1 +
 include/linux/soc/qcom/geni-se.h                   |   1 +
 include/linux/soc/qcom/llcc-qcom.h                 |   1 +
 26 files changed, 448 insertions(+), 135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,zenbook-a16-ux3607oa-ec.yaml
