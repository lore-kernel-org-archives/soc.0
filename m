Return-Path: <SRS0=aTxQ=K3=arm.com=sudeep.holla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C979C4708F
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 09:58:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2A24D61396; Tue,  1 Jun 2021 09:58:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id A74746136E;
	Tue,  1 Jun 2021 09:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74746136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=sudeep.holla@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FB6D11D4;
	Tue,  1 Jun 2021 02:58:46 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47DE73F73D;
	Tue,  1 Jun 2021 02:58:45 -0700 (PDT)
Date: Tue, 1 Jun 2021 10:58:38 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210601095838.GA838783@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi ARM SoC Team,

Please pull !

This is a new driver pull request. One of the arm64 patch is being
pulled from a stable arm64 branch for-next/ffa as the other patches
are dependent of the same.

Background
----------
This has been on the list for almost a year now with changing requirements.
Initially Arm KVM wanted to use this via userspace interface in VMM to
communicate with VMs. But it was later dropped in favour of arch-agnostic
interface[1].

Also there was some discussion on the dt-bindings which was dropped
completely. Though we need to workaround the lack of full discoveribility
in v1.0 spec, it is now being fixed for the next version of the spec.

Regards,
Sudeep

[1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/will/slides/kvmforum-2020-edited.pdf
-->8

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/arm-ffa-5.14

for you to fetch changes up to cc2195fe536c28e192df5d07e6dd277af36814b4:

  firmware: arm_ffa: Add support for MEM_* interfaces (2021-05-26 22:38:43 +0100)

----------------------------------------------------------------
Arm Firmware Framework for ARMv8-A(FFA) interface driver

The Arm FFA specification describes a software architecture to
leverages the virtualization extension to isolate software images
provided by an ecosystem of vendors from each other and describes
interfaces that standardize communication between the various software
images including communication between images in the Secure world and
Normal world. Any Hypervisor could use the FFA interfaces to enable
communication between VMs it manages.

The Hypervisor a.k.a Partition managers in FFA terminology can assign
system resources(Memory regions, Devices, CPU cycles) to the partitions
and manage isolation amongst them.

This is the initial and minimal support for the FFA interface to enable
communication between secure partitions and the normal world OS.

----------------------------------------------------------------
Sudeep Holla (6):
      arm64: smccc: Add support for SMCCCv1.2 extended input/output registers
      firmware: arm_ffa: Add initial FFA bus support for device enumeration
      firmware: arm_ffa: Add initial Arm FFA driver support
      firmware: arm_ffa: Add support for SMCCC as transport to FFA driver
      firmware: arm_ffa: Setup in-kernel users of FFA partitions
      firmware: arm_ffa: Add support for MEM_* interfaces

 MAINTAINERS                       |   7 +
 arch/arm64/kernel/asm-offsets.c   |   9 +
 arch/arm64/kernel/smccc-call.S    |  57 +++
 drivers/firmware/Kconfig          |   1 +
 drivers/firmware/Makefile         |   1 +
 drivers/firmware/arm_ffa/Kconfig  |  21 ++
 drivers/firmware/arm_ffa/Makefile |   6 +
 drivers/firmware/arm_ffa/bus.c    | 210 +++++++++++
 drivers/firmware/arm_ffa/common.h |  31 ++
 drivers/firmware/arm_ffa/driver.c | 731 ++++++++++++++++++++++++++++++++++++++
 drivers/firmware/arm_ffa/smccc.c  |  39 ++
 include/linux/arm-smccc.h         |  55 +++
 include/linux/arm_ffa.h           | 267 ++++++++++++++
 13 files changed, 1435 insertions(+)
 create mode 100644 drivers/firmware/arm_ffa/Kconfig
 create mode 100644 drivers/firmware/arm_ffa/Makefile
 create mode 100644 drivers/firmware/arm_ffa/bus.c
 create mode 100644 drivers/firmware/arm_ffa/common.h
 create mode 100644 drivers/firmware/arm_ffa/driver.c
 create mode 100644 drivers/firmware/arm_ffa/smccc.c
 create mode 100644 include/linux/arm_ffa.h
