Return-Path: <SRS0=kquE=QB=csgroup.eu=christophe.leroy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77BBCD342F
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 06:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BA83C4CEC6; Tue,  3 Sep 2024 06:36:45 +0000 (UTC)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3EF8C4CEC5
	for <soc@kernel.org>; Tue,  3 Sep 2024 06:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3EF8C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WybWF5HjZz9sSH;
	Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PdnbsYL7xth; Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WybWF4Jw0z9sSC;
	Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 822B98B76E;
	Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8n4_MCluhO-u; Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EAAC8B768;
	Tue,  3 Sep 2024 08:36:41 +0200 (CEST)
Message-ID: <326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu>
Date: Tue, 3 Sep 2024 08:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [GIT PULL] SOC FSL for 6.12 (retry)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.12

There are no conflicts with latest linux-next tree.

Thanks
Christophe

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://github.com/chleroy/linux.git tags/soc_fsl-6.12-2

for you to fetch changes up to 7a99b1c0bce5cf8c554ceecd29ad1e8085557fd3:

   Merge branch 'support-for-quicc-engine-tsa-and-qmc' (2024-09-03 
07:51:34 +0200)

----------------------------------------------------------------
- A series from HervÃ© Codina that bring support for the newer version
of QMC (QUICC Multi-channel Controller) and TSA (Time Slots Assigner)
found on MPC 83xx micro-controllers.

- Misc changes for qbman freescale drivers for removing a redundant
warning and using iommu_paging_domain_alloc()

----------------------------------------------------------------
Christophe Leroy (1):
       Merge branch 'support-for-quicc-engine-tsa-and-qmc'

Herve Codina (36):
       soc: fsl: cpm1: qmc: Update TRNSYNC only in transparent mode
       soc: fsl: cpm1: qmc: Enable TRNSYNC only when needed
       soc: fsl: cpm1: tsa: Fix tsa_write8()
       soc: fsl: cpm1: tsa: Use BIT(), GENMASK() and FIELD_PREP() macros
       soc: fsl: cpm1: tsa: Fix blank line and spaces
       soc: fsl: cpm1: tsa: Add missing spinlock comment
       dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) TSA controller
       soc: fsl: cpm1: tsa: Remove unused registers offset definition
       soc: fsl: cpm1: tsa: Use ARRAY_SIZE() instead of hardcoded 
integer values
       soc: fsl: cpm1: tsa: Make SIRAM entries specific to CPM1
       soc: fsl: cpm1: tsa: Introduce tsa_setup() and its CPM1 
compatible version
       soc: fsl: cpm1: tsa: Isolate specific CPM1 part from 
tsa_serial_{dis}connect()
       soc: fsl: cpm1: tsa: Introduce tsa_version
       soc: fsl: cpm1: tsa: Add support for QUICC Engine (QE) implementation
       MAINTAINERS: Add QE files related to the Freescale TSA controller
       soc: fsl: cpm1: tsa: Introduce tsa_serial_get_num()
       soc: fsl: cpm1: qmc: Rename QMC_TSA_MASK
       soc: fsl: cpm1: qmc: Use BIT(), GENMASK() and FIELD_PREP() macros
       soc: fsl: cpm1: qmc: Fix blank line and spaces
       soc: fsl: cpm1: qmc: Remove unneeded parenthesis
       soc: fsl: cpm1: qmc: Fix 'transmiter' typo
       soc: fsl: cpm1: qmc: Add missing spinlock comment
       dt-bindings: soc: fsl: cpm_qe: Add QUICC Engine (QE) QMC controller
       soc: fsl: cpm1: qmc: Introduce qmc_data structure
       soc: fsl: cpm1: qmc: Re-order probe() operations
       soc: fsl: cpm1: qmc: Introduce qmc_init_resource() and its CPM1 
version
       soc: fsl: cpm1: qmc: Introduce qmc_{init,exit}_xcc() and their 
CPM1 version
       soc: fsl: cpm1: qmc: Rename qmc_chan_command()
       soc: fsl: cpm1: qmc: Handle RPACK initialization
       soc: fsl: cpm1: qmc: Rename SCC_GSMRL_MODE_QMC
       soc: fsl: cpm1: qmc: Introduce qmc_version
       soc: fsl: qe: Add resource-managed muram allocators
       soc: fsl: qe: Add missing PUSHSCHED command
       soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation
       soc: fsl: cpm1: qmc: Handle QUICC Engine (QE) soft-qmc firmware
       MAINTAINERS: Add QE files related to the Freescale QMC controller

Lu Baolu (1):
       soc: fsl: qbman: Use iommu_paging_domain_alloc()

Xiaolei Wang (1):
       soc: fsl: qbman: Remove redundant warnings

  .../bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml        | 210 +++++++
  .../bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml    | 197 ++++++
  MAINTAINERS                                        |   3 +
  drivers/soc/fsl/qbman/qman_ccsr.c                  |   2 -
  drivers/soc/fsl/qbman/qman_portal.c                |   5 +-
  drivers/soc/fsl/qe/Kconfig                         |  18 +-
  drivers/soc/fsl/qe/qe_common.c                     |  80 +++
  drivers/soc/fsl/qe/qmc.c                           | 667 
++++++++++++++++-----
  drivers/soc/fsl/qe/tsa.c                           | 659 
+++++++++++++++-----
  drivers/soc/fsl/qe/tsa.h                           |   3 +
  include/dt-bindings/soc/qe-fsl,tsa.h               |  13 +
  include/soc/fsl/qe/qe.h                            |  23 +-
  12 files changed, 1552 insertions(+), 328 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-tsa.yaml
  create mode 100644 
Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
  create mode 100644 include/dt-bindings/soc/qe-fsl,tsa.h
