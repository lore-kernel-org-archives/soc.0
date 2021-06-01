Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89223C47080
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:00:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CB761287
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 10:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CB761287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6Onbb8Pw2jxW8eqFeeQa9UiXUwO++UJ3wEHOxmFyJR8=; b=SUFDT9jViDEuNB
	nH1BLNkCJzVmm1tLIvJEMfMacbdfWtmIPx7Hb17IycPdzrMAHjwq8zWrbvXfYPqa+m+LPog/xCbtd
	luAf8U0S3Wv7DVKjt/qwlBckpKoLImx/d0eKobQdPyWnegIN2nscn3Vs6Kw9YBsd5rpBhZOcDTLbQ
	7+R6DCIqLhwat817/qoavllzbbgsMkGa+oh+KMHpqXqv/A4WFaCw30ECT33uG9IOo+aGwzQZ98OmL
	MhmatIQhF8gfoD4yq7pYBwrpLMb60GM1W5MlHB+eKM0Yi5soyfZDsT6lhcBIn3SPgr0wmapkYkm8y
	zl61G6sJbYuu217sqlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo1Am-00FlFY-D7; Tue, 01 Jun 2021 09:58:56 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo1Ah-00FlDQ-8H
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Jun 2021 09:58:54 +0000
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
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210601095838.GA838783@bogus>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_025851_430453_2C38F579 
X-CRM114-Status: GOOD (  15.08  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210601095838.ernErqojiMQcU3zdet2QsK76frRFA_6y5A964c236nQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
