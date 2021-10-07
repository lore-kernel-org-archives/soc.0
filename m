Return-Path: <SRS0=FMRd=O3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2589EC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 10:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9BC60C4C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Oct 2021 10:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD9BC60C4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w9DhUMp5g+vI3mUKB6/70ru/OYD1izVcRjmc+WNExUM=; b=Gz1VlZfmWmUINz
	krDpc2gXYHA4By3oKp+l9PizEZ71AhCl+IB9d5+uz1hbMumoVkYuMZ8BAsnjkvMLT7YKhn6WprWOx
	u6Kg5D+CUIhvAbHrK4BQDk1y6f3RwUE5IF7QTMikm6BifD3KeuEv24vIBsGd1a3DilD11QgHDbGVC
	yOw8DMzm69pdkPKLY0WuOqdACADvRImdnnpfqAqcVGFx+LyOnEb5Bvc1fbz0NvcMQpJYHh5mJnj3m
	fhsmZ8P7EdqNS6iwOLgbMKtw3hdGI3gBWO/n0o0B40XrpOyEmeTA0MGBHI63JbP6wz8bv0yF+JBD4
	Zchx4IREZppsQEyEn5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYQdj-00GtcS-KS; Thu, 07 Oct 2021 10:28:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYQdg-00Gtbo-9q
 for linux-arm-kernel@lists.infradead.org; Thu, 07 Oct 2021 10:28:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8386D;
 Thu,  7 Oct 2021 03:28:34 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B6913F766;
 Thu,  7 Oct 2021 03:28:33 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Fixes for v5.15
Date: Thu,  7 Oct 2021 11:28:22 +0100
Message-ID: <20211007102822.27886-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_032836_413242_ABFC38D5 
X-CRM114-Status: UNSURE (   6.10  )
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
Message-ID: <20211007102822.DZOEg9tvGsv_w8qfC4gKV9wtrVBygPJf0_YBUhDQdVE@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-fixes-5.15

for you to fetch changes up to bf1acf809d5694a942e113dfca6ef076d3904bb4:

  firmware: arm_scmi: Add proper barriers to scmi virtio device (2021-10-06 11:12:45 +0100)

----------------------------------------------------------------
SCMI fixes for v5.15

A few fixes addressing:
- Kconfig dependency between VIRTIO and ARM_SCMI_PROTOCOL
- Link-time error with __exit annotation for virtio_scmi_exit
- Unnecessary nested irqsave/irqrestore spinlocks in virtio transport
- Missing SMP barriers to protect accesses to SCMI virtio device

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: arm_scmi: Remove __exit annotation

Cristian Marussi (3):
      firmware: arm_scmi: Fix virtio transport Kconfig dependency
      firmware: arm_scmi: Simplify spinlocks in virtio transport
      firmware: arm_scmi: Add proper barriers to scmi virtio device

 drivers/firmware/arm_scmi/Kconfig  |  2 +-
 drivers/firmware/arm_scmi/virtio.c | 44 +++++++++++++++++++++++++++-----------
 2 files changed, 32 insertions(+), 14 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
