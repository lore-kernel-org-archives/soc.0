Return-Path: <SRS0=Sdul=E6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7978C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 12:25:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C98206B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2020 12:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2q/VVRjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C98206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZnQGuHUEC5iB+l53qT+/6KNHAufgx1lM4aK8rYv6U5A=; b=2q/VVRjlejVUzxwS390BoF4Dif
	eSSMJN9Gr+DM+PlrQwccaldrGQE3hcV5q+XjJR1sjDCVE8EaM7TjifXApt4JeM4SLdh167wmJ/w5d
	PGV8n5yXG7GmKAXMHm6wKDieBK+ZI82WcNTf22K9WOGa0BubxA5LGh7RPuij76FInikEx3Uktd7NJ
	FriyKLS4lzJoF+AIeyv3bAW0Kivh5MW+WeqW6KssfzOM/qNyTCHeWriD4YptKnFZOHidcS8yCWGrr
	xjgPdANH+C5u720QLLfkNmgGsf4BHOtbWYRlG/Lx99I1jVjW42F9XfO/Gam1gp87aC5pVLw7kIq2q
	JuVcFPxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khXMu-0001it-66; Tue, 24 Nov 2020 12:24:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khXMr-0001iN-GY
 for linux-arm-kernel@lists.infradead.org; Tue, 24 Nov 2020 12:24:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A94E101E;
 Tue, 24 Nov 2020 04:24:19 -0800 (PST)
Received: from usa.arm.com (unknown [10.57.54.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B663F70D;
 Tue, 24 Nov 2020 04:24:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.11
Date: Tue, 24 Nov 2020 12:24:12 +0000
Message-ID: <20201124122412.22386-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_072421_605817_E041EC79 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201124122412.CzKMdkoFYrH32PaUVub3HQzmRRjeemFScpWdgQVoHLI@z>

Hi ARM SoC Team,

Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
the fixes that got merged in -rc2.

Note the hwmon is acked by Guenter to take the changes together.
Also note that the SCMI regulator driver itself is getting queued by
Mark Brown separately and hence I have sent him pull request with
'scmi-voltage-5.11' tag which I have also merged here.

Regards,
Sudeep

-->8

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.11

for you to fetch changes up to f83eb664cdb45169338b9633f22eaafc23764f05:

  Merge tag 'scmi-voltage-5.11' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into for-next/scmi (2020-11-23 16:37:27 +0000)

----------------------------------------------------------------
ARM SCMI updates for v5.11

Two main additions this time:
1. Support for SCMI v3.0 sensor extensions
2. Support for voltage domain management protocol added newly to SCMI v3.0

----------------------------------------------------------------
Cristian Marussi (10):
      firmware: arm_scmi: Rework scmi_sensors_protocol_init
      firmware: arm_scmi: Add SCMI v3.0 sensors descriptors extensions
      dt-bindings: arm: Add support for SCMI Regulators
      firmware: arm_scmi: Add voltage domain management protocol support
      firmware: arm_scmi: Add support to enumerated SCMI voltage domain device
      hwmon: (scmi) Update hwmon internal scale data type
      firmware: arm_scmi: Add SCMI v3.0 sensors timestamped reads
      firmware: arm_scmi: Add SCMI v3.0 sensor configuration support
      firmware: arm_scmi: Add SCMI v3.0 sensor notifications
      firmware: arm_scmi: Remove residual _le structs naming

Qinglang Miao (1):
      firmware: arm_scmi: Fix missing destroy_workqueue()

Sudeep Holla (2):
      firmware: arm_scmi: Add full list of sensor type enumeration
      Merge tag 'scmi-voltage-5.11' of git://git.kernel.org/.../sudeep.holla/linux into for-next/scmi

 Documentation/devicetree/bindings/arm/arm,scmi.txt |  43 ++
 drivers/firmware/arm_scmi/Makefile                 |   2 +-
 drivers/firmware/arm_scmi/common.h                 |   1 +
 drivers/firmware/arm_scmi/driver.c                 |   3 +
 drivers/firmware/arm_scmi/notify.c                 |  10 +-
 drivers/firmware/arm_scmi/sensors.c                | 720 +++++++++++++++++++--
 drivers/firmware/arm_scmi/voltage.c                | 380 +++++++++++
 drivers/hwmon/scmi-hwmon.c                         |   2 +-
 include/linux/scmi_protocol.h                      | 352 +++++++++-
 9 files changed, 1450 insertions(+), 63 deletions(-)
 create mode 100644 drivers/firmware/arm_scmi/voltage.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
