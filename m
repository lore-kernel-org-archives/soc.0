Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ECB37CD39
	for <soc@lists.linux.dev>; Sat, 10 Oct 2026 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617786; cv=none; b=S9jBYoNe1iqLUa04XkkRJSeF1Nwd4qH0+/Fs9QkUhsHoM7MK7GUDQ9UjFTDlmZwP3Nl8zhizwYnhc8FeAmJi/XQEJAV9MwPi20AkdYHxZz+ZI1FAMhD1OPpkGuYcAuU93L+pM/izQXW8sdOIdTtXUw3jAuEEospdadsBgnbU6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617786; c=relaxed/simple;
	bh=F0o4Bkp8DruAVx/yd8MOtX06N5C1Mf+FV0JIqG9Dkkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cLzmesdl2I6wmbQtY4nT2KLdAA2afhoFm0vQEi0jtuQkluRWycMNRMc2tT7rx+QVGtRnLHSjit+sXnhkpdzEMJZb/HuWVxBxioXk+mevRgMUhYU7m+jkd90rTE8XtUG9b/xrcI3GM4kwPXE9McF9UuKK3X4FPpAFCEe4NeaEUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNQzzeCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNQzzeCT"
Received: by smtp.kernel.org (Postfix)
	id 18D321F0089A; Sat, 10 Oct 2026 07:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080C81F00893;
	Sat, 10 Oct 2026 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791617784;
	bh=cRgLFkyoBuE3L4Ictvl2wcXbnRTXQVUImPpuYM8flQY=;
	h=From:To:Cc:Subject:Date;
	b=JNQzzeCTCAAMy95SODsD2ECnbql92IaFOJKxTRNSZc+H3x58n32UbGtZH2O/otcGa
	 1gh++F0ZqkRwqbPYjbpNJTs7vNvuZel+1A6dHUil6PYAFzcbNpPc0AMmqyREKZBI4K
	 e1/O8fZRCa3HDq2U3sp9QZweTTwL+vFGiIMgezExGRlIK162udm08A9qYEF5Z7w7sU
	 zTcdC/jErlOlmQ7DzqmRUKmWDSpNGIm7XeTkIXvw56zn5eWtQm5Ij4xQUZsreIFTGj
	 ONwFOLRGsDQHH4tJN4nlEO5EyQ1QLTWndm18Zpxuv4oE80MOZ6qlZPRIvMAk1tJLJc
	 EW9+JdgSNn+ew==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Wangao Wang <wangao.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Gourav Kumar <gouravk@qti.qualcomm.com>,
	Hongyan Xu <getshell@seu.edu.cn>,
	Jason Pettit <jason.pettit@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Linmao Li <lilinmao@kylinos.cn>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pan Chuang <panchuang@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [GIT PULL] Qualcomm driver updates for v7.4 (second attempt)
Date: Sat, 10 Oct 2026 02:36:02 -0500
Message-ID: <20261010073609.3689061-1-andersson@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now with the missing #define...

Thanks,
Bjorn

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.4-2

for you to fetch changes up to 87802d4dc4850bf27b3955ee9162b1e52c99da1a:

  firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026-10-05 09:10:43 +0200)

----------------------------------------------------------------
Qualcomm driver updates for v7.4 (second attempt)

Add UBWC 7.0 configuration for Hawi and Maili, and reuse Glymur's UBWC
configuration for Nord.

Parse Glymur's DDR information from SMEM, including its frequency plan and
highest bank bit. Correct DDR frequency overflow and byte order, and handle
unrecognized DDR layouts correctly.

Configure dedicated LLCC slices for the IPQ5424 PPE and Wi-Fi datapaths,
adjust the CPU slice, and propagate errors from optional IRQ lookup.

Allow the GENI serial-engine driver to be selected on 32-bit Qualcomm SoCs
such as Kuno. Fix firmware loading bounds, endianness, and writes to
read-only firmware.

Allow QSEECOM on the Glymur-based HP EliteBook X G2q 14 AI, Lenovo Yoga
Slim 7x Gen11, and Asus Zenbook A14 (UX3407NA), enabling EFI variable
access on the HP and Asus laptops. Release SCM reserved memory on probe
failure or unbind, and limit Qualcomm firmware Kconfig options to Qualcomm
platforms.

Defer PMIC GLINK altmode work until devices resume to avoid accessing
suspended I2C controllers.

Fix cleanup of failed APR service registrations to prevent stale lookups,
and remove unused APR device-ID matching.

Add the SM7250 SoC ID, correct SMSM and SMP2P I/O annotations, and clean
up RPMh kernel-doc and redundant IRQ error messages.

Document the Kuno SCM interface, Shikra CTCU fallback, and Milos CPU
bandwidth monitor. Add Abel Vesa as a Qualcomm SoC reviewer.

----------------------------------------------------------------
Abel Vesa (2):
      soc: qcom: pmic_glink: Fix device access from worker during suspend
      MAINTAINERS: add Abel as reviewer for linux-arm-msm

Ben Dooks (2):
      soc: qcom: smsm: fix __iomem annotations
      soc: qcom: smp2p: fix __iomem annotation on entry->value pointer

Bjorn Andersson (1):
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

Dan Carpenter (1):
      soc: qcom: smem: Fix signedness bug in smem_dram_parse()

Geert Uytterhoeven (1):
      firmware: QCOM interfaces should depend on ARCH_QCOM

Gopikrishna Garmidi (1):
      soc: qcom: smem: fix 32-bit overflow in DDR frequency calculation

Gourav Kumar (1):
      soc: qcom: ubwcg: Add Nord UBWC config

Hardeep Sharma (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Kuno SoC
      soc: qcom: geni-se: allow selection on 32-bit ARM Qualcomm SoCs

Hongyan Xu (1):
      soc: qcom: apr: clean up failed service registrations

Jason Pettit (1):
      firmware: qcom: scm: Allow QSEECOM on HP EliteBook X G2q 14 AI

Jie Gan (1):
      dt-bindings: arm: add CTCU device for shikra

Kathiravan Thirumoorthy (1):
      soc: qcom: llcc: Update the SCT table for IPQ5424

Konrad Dybcio (2):
      soc: qcom: smem: support Glymur DRAM info
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11

Linmao Li (1):
      soc: qcom: smem: Fix byte order in v3 14-frequency parser

Luca Weiss (1):
      dt-bindings: interconnect: qcom-bwmon: Add Milos cpu-bwmon compatible

Maulik Shah (3):
      soc: qcom: rpmh-internal: fix kernel-doc issues in rpmh-internal.h
      soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
      soc: qcom: rpmh-rsc: fix kernel-doc issues in rpmh-rsc.c

Mukesh Ojha (1):
      firmware: qcom: scm: Use devm_of_reserved_mem_device_init()

Pan Chuang (1):
      soc: qcom: Remove redundant dev_err()

Sreeshankar K (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
      soc: qcom: socinfo: Add SM7250 SoC ID

Uwe Kleine-König (The Capable Hub) (1):
      soc: qcom: apr: Drop unused apr_device_id

Viken Dadhaniya (4):
      soc: qcom: geni-se: Fix endian conversion for serial_protocol comparison
      soc: qcom: geni-se: Widen fw_size to u32 to prevent wrap-around
      soc: qcom: geni-se: Fix fw_end computed before round-up; propagate size to caller
      soc: qcom: geni-se: Fix write to read-only firmware buffer

Wangao Wang (2):
      soc: qcom: ubwc: Add configuration for Hawi
      soc: qcom: ubwc: Add configuration for Maili

bui duc phuc (1):
      soc: qcom: llcc-qcom: Handle errors from optional IRQ lookup

 .../bindings/arm/qcom,coresight-ctcu.yaml          |  1 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |  1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |  1 +
 MAINTAINERS                                        |  1 +
 drivers/firmware/qcom/Kconfig                      |  4 +-
 drivers/firmware/qcom/qcom_scm.c                   | 25 +++----
 drivers/soc/qcom/Kconfig                           |  1 -
 drivers/soc/qcom/apr.c                             | 69 ++++++++----------
 drivers/soc/qcom/llcc-qcom.c                       | 60 +++++++++++++---
 drivers/soc/qcom/pmic_glink_altmode.c              |  4 +-
 drivers/soc/qcom/qcom-geni-se.c                    | 45 ++++++------
 drivers/soc/qcom/qcom_aoss.c                       |  4 +-
 drivers/soc/qcom/rpmh-internal.h                   | 16 +++--
 drivers/soc/qcom/rpmh-rsc.c                        |  4 +-
 drivers/soc/qcom/rpmh.c                            | 40 +++++++----
 drivers/soc/qcom/smem_dramc.c                      | 81 ++++++++++++++++++++--
 drivers/soc/qcom/smp2p.c                           | 12 ++--
 drivers/soc/qcom/smsm.c                            | 20 +++---
 drivers/soc/qcom/socinfo.c                         |  1 +
 drivers/soc/qcom/ubwc_config.c                     | 10 +++
 include/dt-bindings/arm/qcom,ids.h                 |  1 +
 include/linux/device-id/apr.h                      | 21 ------
 include/linux/mod_devicetable.h                    |  1 -
 include/linux/soc/qcom/apr.h                       |  4 +-
 include/linux/soc/qcom/llcc-qcom.h                 |  4 ++
 include/linux/soc/qcom/ubwc.h                      |  3 +
 26 files changed, 277 insertions(+), 157 deletions(-)
 delete mode 100644 include/linux/device-id/apr.h
