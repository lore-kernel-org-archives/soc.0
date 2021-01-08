Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB36FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:24:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763B3235FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 10:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763B3235FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErHTfj8AbpfSTQie01Rup0tl6h7C5gvsn+jfZaKrPkw=; b=XW0EKnSD/fgNuMmI11hV3x8Kt4
	X5/yaT+QqcVwwvBq5/Ku6MCCPAIHbILouN2tbkc/zBjq079MEIJg6ZT797ikjIIFot9VaIKA+/d7e
	f+CpGSuN9iK9XARwVabt6ZGLqp9C5/Hju0tC2XAsff1oX7MFp7cIx/uaiucPHRUfBShjsl6/voEU9
	PklmfpRiWHtDruz2g7iR8ULa2nfSZd9aW1ntDP+JEP9q0xPtTW6UsecRw6joEwUZHGebvcjXwODHE
	qAiNcVot8MraVF6ppi5JHVnbXynaS0qZ6w1pDpg4r0ieNsR/mXxtAqHs7gMWWPYsc7OI+teFksiT/
	7KsCwvnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxouj-0005Fw-7R; Fri, 08 Jan 2021 10:22:37 +0000
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxosn-0004xg-5i
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 10:20:40 +0000
IronPort-SDR: yMX9ojZvQX+UHrJMCLZli91fRrv1q2WRl+0KN7JO8V4JfNDRkc+p1gZQcscsQ9ZWyqS572XiK8
 sxL9sdOiMdZdLWKI1IqruTH1fiCq70wkeVhMOhDcbvOkJPwLwDOU0RuIRTrUhi3011N+gzdK/1
 g8GsvAhhPc9r2lRTg+aG2OxHuacGTwYVVDopaFv7QjIj5HL2IjuYQHhOvTXgeZbdwu5QdpUdkN
 iZOOUkZJgz6yhx+ETsKv4uWfMCjG1aIqjs3lb3xYt7gz+p4DbZBrhQORfzvV4CdlbxFl8G02oD
 GR4=
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="14106181"
X-IronPort-AV: E=Sophos;i="5.79,330,1602514800"; d="scan'208";a="14106181"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 08 Jan 2021 19:20:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com
 [192.168.87.58])
 by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D313E0379
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:30 +0900 (JST)
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
 (g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
 by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B032822F3BE
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 19:20:29 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
 by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id A623546E556;
 Fri,  8 Jan 2021 19:20:28 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 Jan 2021 19:20:26 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
To: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>
Subject: 
Date: Fri, 8 Jan 2021 19:32:17 +0900
Message-ID: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_052037_421549_66FEEBD9 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
 misono.tomohiro@jp.fujitsu.com, arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108103217.6dj9-meSYnY51TqC0pAqgKKw7vTTVnd0TESPrcrG3VI@z>

Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver

Hello,

This series adds Fujitsu A64FX SoC entry in drivers/soc and hardware
barrier driver for it.

[Driver Description]
 A64FX CPU has several functions for HPC workload and hardware barrier
 is one of them. It is a mechanism to realize fast synchronization by
 PEs belonging to the same L3 cache domain by using implementation
 defined hardware registers.
 For more details, see A64FX HPC extension specification in
 https://github.com/fujitsu/A64FX
 
 The driver mainly offers a set of ioctls to manipulate related registers.
 Patch 1-9 implements driver code and patch 10 finally adds kconfig,
 Makefile and MAINTAINER entry for the driver.  

 Also, C library and test program for this driver is available on: 
 https://github.com/fujitsu/hardware_barrier

 The driver is based on v5.11-rc2 and tested on FX700 environment.

[RFC]
 This is the first time we upstream drivers for our chip and I want to
 confirm driver location and patch submission process.

 Based on my observation it seems drivers/soc folder is right place to put
 this driver, so I added Kconfig entry for arm64 platform config, created
 soc/fujitsu folder and updated MAINTAINER entry accordingly (last patch).
 Is it right?

 Also for final submission I think I need to 1) create some public git
 tree to push driver code (github or something), 2) make pull request to
 SOC team (soc@kernel.org). Is it a correct procedure?

 I will appreciate any help/comments.

sidenote: We plan to post other drivers for A64FX HPC extension
(prefetch control and cache control) too anytime soon.

Misono Tomohiro (10):
  soc: fujitsu: hwb: Add hardware barrier driver init/exit code
  soc: fujtisu: hwb: Add open operation
  soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
  soc: fujitsu: hwb: Add IOC_BW_ASSIGN ioctl
  soc: fujitsu: hwb: Add IOC_BW_UNASSIGN ioctl
  soc: fujitsu: hwb: Add IOC_BB_FREE ioctl
  soc: fujitsu: hwb: Add IOC_GET_PE_INFO ioctl
  soc: fujitsu: hwb: Add release operation
  soc: fujitsu: hwb: Add sysfs entry
  soc: fujitsu: hwb: Add Kconfig/Makefile to build fujitsu_hwb driver

 MAINTAINERS                            |    7 +
 arch/arm64/Kconfig.platforms           |    5 +
 drivers/soc/Kconfig                    |    1 +
 drivers/soc/Makefile                   |    1 +
 drivers/soc/fujitsu/Kconfig            |   24 +
 drivers/soc/fujitsu/Makefile           |    2 +
 drivers/soc/fujitsu/fujitsu_hwb.c      | 1253 ++++++++++++++++++++++++
 include/uapi/linux/fujitsu_hpc_ioctl.h |   41 +
 8 files changed, 1334 insertions(+)
 create mode 100644 drivers/soc/fujitsu/Kconfig
 create mode 100644 drivers/soc/fujitsu/Makefile
 create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c
 create mode 100644 include/uapi/linux/fujitsu_hpc_ioctl.h

-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
