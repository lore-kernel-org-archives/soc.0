Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F7C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:40:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6D8522228
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 07:40:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfUAQVU8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6D8522228
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tVovpg3z4UdalZuWU1jddqtO+Za1QpVcrKI62pPuJTI=; b=yfUAQVU8JD9i6H7Cef7DH4V8w
	Y/RATcMZfKpcErrGzs4uJL8PTktM4oI+MJf7rlUAK2Uo+TsPVQLG4Hrw6o8Se4KT4aqAipUgciibX
	L7THstTzuKgeUFHxGrT+peZPAnCkeWcSE4WUYYzzif74I1bECHg3lccDamz+gOSBaMxtdfKT0J/F8
	EObLCBokeDqSg9MdLkrmKFDjdMqcil4YLZW4MDZThqJjCxVq+WMo0LNNxTtlWdtb5umAWJjW679F+
	axFcc7Lh3nfMls/hwmJ20J+E8kpCVnyxKiOSvprFef8RQGYxtbloPHqprit1d2HuwkCnvRPoI51qk
	Jc+1UMuKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiYKy-0000CF-Ff; Fri, 27 Nov 2020 07:38:36 +0000
Received: from muru.com ([72.249.23.125])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiYKs-0000A7-Ny
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 07:38:33 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id B0AA580FB;
 Fri, 27 Nov 2020 07:38:37 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 3/3] Defconfig changes for omaps for v5.11 merge window
Date: Fri, 27 Nov 2020 09:38:21 +0200
Message-ID: <pull-1606462656-588116@atomide.com-3>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1606462656-588116@atomide.com>
References: <pull-1606462656-588116@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_023831_750331_75EC6702 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127073821.JI1rXN1PctzMUZZDs2emo1eONrDc8mmRSG_w7n-0IRg@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.11/defconfig-signed

for you to fetch changes up to eaf7697b6febe2b086503f525f070d8e3ca1ea0f:

  ARM: omap2plus_defconfig: Enable TI eQEP counter driver (2020-11-24 11:04:12 +0200)

----------------------------------------------------------------
Defconfig changes for omaps for v5.11 merge window

- Enable thermal support for omap3 now that the driver changes have
  been merged

- Enable magnetometer and accelerometer support as loadable modules
  for Motorola mapphone devices

- Enable eQEP counter for beaglebone blue as loadable modules

----------------------------------------------------------------
Adam Ford (1):
      ARM: omap2plus_defconfig: Enable OMAP3_THERMAL

Carl Philipp Klemm (1):
      ARM: omap2plus_defconfig: add CONFIG_AK8975=m and CONFIG_KXCJK1013=m

David Lechner (1):
      ARM: omap2plus_defconfig: Enable TI eQEP counter driver

 arch/arm/configs/omap2plus_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
