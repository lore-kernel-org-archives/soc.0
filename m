Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E270CC4743D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 07:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A64F461263
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64F461263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q/vqmh53xCNZ4ctLcmtjwHJ+O2xmyjytpRT3fqRDl7k=; b=vJ7Gnu6Lj5FIDj
	/7RJHRzwyw8wf2lo7h6jt0wVYmAUuU90cN1tUNR3G2jIgwNwooxo5hZdGFt7cuW/8Qw8H2lBskXDM
	LQA/sdf26eQ6/Ajm9bPVD46YWOlxMgCdCkg+vjlsrlh3Tq7nhW2tSgST1eri7lp7yQaRUgXSMm8H0
	g+HlIwXgkhd38gDrekWOcpONX2gZjoxT/SxaoRHeqCifQ00e8IWb50ceA+ca/kqg1TkKaTMoQWjeZ
	O4gLURjhn7LPxatYkkw8KZokek6bdPtmeDqC9tcxSquXNsGcyAakv9Ub3vcW+nSZfokqwetTWt/Z1
	WpuQh+BTU9JfA5sja8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrc2y-004G2D-Gn; Fri, 11 Jun 2021 07:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrc2u-004G0F-6D
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 07:57:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18DA5106F;
 Fri, 11 Jun 2021 00:57:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFCF83F719;
 Fri, 11 Jun 2021 00:57:32 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: updates for v5.14
Date: Fri, 11 Jun 2021 08:57:22 +0100
Message-ID: <20210611075722.2813550-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_005740_300972_46D31B16 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210611075722.XxIRmtB2pmVUMgNSgddsVnghUzjWHEac96mluma_8gc@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.14

for you to fetch changes up to 61832b35b4d953b2b4f6c668a3ad2a3013f40532:

  firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id (2021-06-08 16:06:12 +0100)

----------------------------------------------------------------
ARM SCMI updates for v5.14

- Support for SCMI clocks from the SCMI power domains
- Addition of checks for correct compatibles for shmem devicetree nodes
  that were found missing in the process of YAML schema conversion
- Kconfig and associated build fix found when optee transport are being
  worked on
- Couple of fixes and cleanups found as with work-in-progress virtio
  transport support

The new transports(optee and virtio) themselves are still being worked on
with ongoing reviews, they are not part of this yet

----------------------------------------------------------------
Cristian Marussi (3):
      firmware: arm_scmi: Reset Rx buffer to max size during async commands
      firmware: arm_scmi: Add delayed response status check
      firmware: arm_scmi: Move reinit_completion from scmi_xfer_get to do_xfer

Etienne Carriere (1):
      firmware: arm_scmi: Add SMCCC discovery dependency in Kconfig

Nicolas Pitre (1):
      firmware: arm_scmi: Add clock management to the SCMI power domain

Sudeep Holla (4):
      firmware: arm_scmi: Fix the build when CONFIG_MAILBOX is not selected
      firmware: arm_scpi: Add compatibility checks for shmem node
      firmware: arm_scmi: Add compatibility checks for shmem node
      firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id

 drivers/firmware/Kconfig                   |  2 +-
 drivers/firmware/arm_scmi/common.h         |  2 +-
 drivers/firmware/arm_scmi/driver.c         | 24 +++++++++++++++---------
 drivers/firmware/arm_scmi/mailbox.c        |  3 +++
 drivers/firmware/arm_scmi/scmi_pm_domain.c | 26 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/smc.c            |  3 +++
 drivers/firmware/arm_scpi.c                | 11 +++++++++++
 7 files changed, 60 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
