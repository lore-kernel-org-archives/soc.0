Return-Path: <SRS0=wsnO=LT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987FBC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:57:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6189C61459
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jun 2021 10:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6189C61459
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFLdXYaT7xNtQSSAvfWr/b803ZXFnLrrCTsV7SYtGEU=; b=iM+Qr7nrk2P2/n
	lnVVvwmu9boYBtoa+D3Ho2JY/voc+3rCQRHkdFFNYZjXZzrf6cddPHnXk8pcFKiNMgG07Mu4k2rPX
	/oWSOBZwuEah/0vP5uMn74nLZkMaEFtT2NN077LdPZMMxKFTVtMxPU7ma0ULyP8YCbLh0m3uvcqSY
	+MzgZXcdDxr3demCRAgfwaOpjcY5EdMmbquqDbnXQ+8xO1cHJtuz4zfZkkFfOInOamAyknL4OI4U2
	6DJfu7ESrWayBXguswqkXQNTiZDZMPgiEcw5bBYOl9r29TaQIltuCRCXurm2SgPjDUgc38mgKTjjv
	18vuugpgFNiic6y0nvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjV0-00197H-Cw; Fri, 25 Jun 2021 10:55:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwj4S-000xoQ-M6
 for linux-arm-kernel@lists.infradead.org; Fri, 25 Jun 2021 10:28:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121CBED1;
 Fri, 25 Jun 2021 03:28:24 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06D553F719;
 Fri, 25 Jun 2021 03:28:22 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Olof Johansson <olof@lixom.net>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v5.14(part 2)
Date: Fri, 25 Jun 2021 11:28:19 +0100
Message-ID: <20210625102819.206172-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_032824_824267_962AF9D4 
X-CRM114-Status: UNSURE (   7.41  )
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
Message-ID: <20210625102819.FdOjRHfxTz_NZqmuzG7O94RUAO8XiuRhitZ-TGjN2F4@z>

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8

The following changes since commit 61832b35b4d953b2b4f6c668a3ad2a3013f40532:

  firmware: arm_scmi: Avoid multiple initialisations of hdr->protocol_id (2021-06-08 16:06:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-5.14-2

for you to fetch changes up to 8ecab77009297ee716c92ced1dd6d8487988b624:

  firmware: arm_scmi: Ensure drivers provide a probe function (2021-06-25 10:51:25 +0100)

----------------------------------------------------------------
ARM SCMI updates for v5.14

A single fix adding check for presence of probe while registering
the driver to prevent NULL pointer access. There is also a minor cleanup
dropping the duplicate check as the driver core already takes care of it.

----------------------------------------------------------------
Sudeep Holla (2):
      firmware: arm_scmi: Simplify device probe function on the bus
      firmware: arm_scmi: Ensure drivers provide a probe function

 drivers/firmware/arm_scmi/bus.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
