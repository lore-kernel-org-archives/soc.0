Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6860CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 10:08:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09FA261959
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 10:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09FA261959
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lnadgSfuQvIRId6XH/qItmEybX6+rKlI3QJd3ih2Bs=; b=ZeeLGuxQrKT2COu2FmgK53sn33
	hoRsOTF6xzrBQbF13xkryGzn8+U53/3FnDNaqr8BCZ+QN5kf5pZTi99UxCgQb1P1bnPWtJZ9ypbW9
	ESaEC7fBnQESiOYNX+1TZizsoRNgbzIBkDlTuONwTbwrw9ZQiV06+YmPVJRqTwI6Jpy9tBhupQpHP
	JigpLRIlKc01aYi/rrkpivG9wPlQDQXlQscQAvCnNEuwD8MEAgwnUP8EmxHWPsbXm200olimkHiSr
	+WUdpzQbq+Er9OHb7p8NHro7UfJx4NdbU6VHYXCZTWiEj/ycWZKPnQh6MB4R93nZPh6ir1ojjXpMD
	NdmYz2hQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRXki-006DW9-Tx; Wed, 31 Mar 2021 10:07:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRXke-006DVe-0p
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 10:07:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A161B106F;
 Wed, 31 Mar 2021 03:07:00 -0700 (PDT)
Received: from bogus (unknown [10.57.57.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72CC83F792;
 Wed, 31 Mar 2021 03:06:59 -0700 (PDT)
Date: Wed, 31 Mar 2021 11:06:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: updates for v5.13
Message-ID: <20210331100657.ilu63i4swnr3zp4e@bogus>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_110704_772464_AFF2CE91 
X-CRM114-Status: GOOD (  14.13  )
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
Message-ID: <20210331100657.3WEWLle5i9WQmxpdbpVvs3sTtdkI2X92IQ5hASf6cJk@z>

Hi ARM SoC Team,

Please pull !

All the drivers files have been acked by respective maintainers.
There is a conflict with IIO tree in linux-next with right fix there,
we might get same conflict depending on what gets merged first upstream.

Regards,
Sudeep

-->8

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.13

for you to fetch changes up to d4f9dddd21f39395c62ea12d3d91239637d4805f:

  firmware: arm_scmi: Add dynamic scmi devices creation (2021-03-30 16:35:16 +0100)

----------------------------------------------------------------
ARM SCMI updates for v5.13

The major and big addition this time is to support modularisation of
individual SCMI protocols thus enabling to add support for vendors'
custom SCMI protocol. This changes the interface provided by the SCMI
driver to all the users of SCMI and hence involved changes in various
other subsystem SCMI drivers. The change has been split with a bit of
transient code to preserve bisectability and avoiding one big patch bomb
changing all the users.

This also includes SCMI IIO driver(pulled from IIO tree) and support for
per-cpu DVFS.

----------------------------------------------------------------
Cristian Marussi (38):
      firmware: arm_scmi: Extend protocol registration interfaces
      firmware: arm_scmi: Introduce protocol handle definitions
      firmware: arm_scmi: Introduce devres get/put protocols operations
      firmware: arm_scmi: Make notifications aware of protocols users
      firmware: arm_scmi: Introduce new devres notification ops
      firmware: arm_scmi: Refactor events registration
      firmware: arm_scmi: Convert events registration to protocol handles
      firmware: arm_scmi: Add new protocol handle core transfer ops
      firmware: arm_scmi: Add helper to access protocol revision/version
      firmware: arm_scmi: Port base protocol to new interface
      firmware: arm_scmi: Port perf protocol to new protocols interface
      cpufreq: scmi: Port driver to the new scmi_perf_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_perf_ops protocol interface
      firmware: arm_scmi: Port power protocol to new protocols interface
      firmware: arm_scmi: Port genpd driver to the new scmi_power_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_power_ops protocol interface
      firmware: arm_scmi: Port clock protocol to new protocols interface
      clk: scmi: Port driver to the new scmi_clk_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_clk_ops protocol interface
      firmware: arm_scmi: Port reset protocol to new protocols interface
      reset: reset-scmi: Port driver to the new scmi_reset_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_reset_ops protocol interface
      firmware: arm_scmi: Port sensor protocol to new protocols interface
      hwmon: (scmi) port driver to the new scmi_sensor_proto_ops interface
      iio/scmi: Port driver to the new scmi_sensor_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_sensor_ops protocol interface
      firmware: arm_scmi: Port systempower protocol to new protocols interface
      firmware: arm_scmi: Port voltage protocol to new protocols interface
      regulator: scmi: Port driver to the new scmi_voltage_proto_ops interface
      firmware: arm_scmi: Remove legacy scmi_voltage_ops protocol interface
      firmware: arm_scmi: Make references to handle const
      firmware: arm_scmi: Cleanup legacy protocol init code
      firmware: arm_scmi: Cleanup unused core transfer helper wrappers
      firmware: arm_scmi: Cleanup events registration transient code
      firmware: arm_scmi: Make notify_priv really private
      firmware: arm_scmi: Rename non devres notify_ops
      firmware: arm_scmi: Add protocol modularization support
      firmware: arm_scmi: Add dynamic scmi devices creation

Jyoti Bhayana (1):
      iio/scmi: Adding support for IIO SCMI Based Sensors

Nicola Mazzucato (2):
      scmi-cpufreq: Remove deferred probe
      scmi-cpufreq: Get opp_shared_cpus from opp-v2 for EM

Sudeep Holla (1):
      Merge branch 'ib-iio-scmi-5.12-rc2-take3' of git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio into for-next/scmi

 MAINTAINERS                                |   6 +
 drivers/clk/clk-scmi.c                     |  28 +-
 drivers/cpufreq/scmi-cpufreq.c             | 107 ++--
 drivers/firmware/arm_scmi/base.c           | 142 ++---
 drivers/firmware/arm_scmi/bus.c            | 100 +++-
 drivers/firmware/arm_scmi/clock.c          | 129 ++---
 drivers/firmware/arm_scmi/common.h         | 133 ++++-
 drivers/firmware/arm_scmi/driver.c         | 798 ++++++++++++++++++++++++++---
 drivers/firmware/arm_scmi/notify.c         | 328 +++++++++---
 drivers/firmware/arm_scmi/notify.h         |  40 +-
 drivers/firmware/arm_scmi/perf.c           | 262 +++++-----
 drivers/firmware/arm_scmi/power.c          | 134 ++---
 drivers/firmware/arm_scmi/reset.c          | 146 +++---
 drivers/firmware/arm_scmi/scmi_pm_domain.c |  26 +-
 drivers/firmware/arm_scmi/sensors.c        | 232 +++++----
 drivers/firmware/arm_scmi/system.c         |  63 ++-
 drivers/firmware/arm_scmi/voltage.c        | 126 ++---
 drivers/hwmon/scmi-hwmon.c                 |  24 +-
 drivers/iio/common/Kconfig                 |   1 +
 drivers/iio/common/Makefile                |   1 +
 drivers/iio/common/scmi_sensors/Kconfig    |  18 +
 drivers/iio/common/scmi_sensors/Makefile   |   5 +
 drivers/iio/common/scmi_sensors/scmi_iio.c | 683 ++++++++++++++++++++++++
 drivers/regulator/scmi-regulator.c         |  42 +-
 drivers/reset/reset-scmi.c                 |  33 +-
 include/linux/scmi_protocol.h              | 200 ++++----
 26 files changed, 2844 insertions(+), 963 deletions(-)
 create mode 100644 drivers/iio/common/scmi_sensors/Kconfig
 create mode 100644 drivers/iio/common/scmi_sensors/Makefile
 create mode 100644 drivers/iio/common/scmi_sensors/scmi_iio.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
