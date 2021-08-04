Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A556FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7D360ED6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B7D360ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysB70eGF35kJhhqDCYbMuzA+S7OANt4zhTjDaCy5Hjs=; b=uEVWh3pQA6CNJz
	QIhNIqozDppJTAPLXsMUCEJkIA4SL605BX7tjE3J7j5y4aMokq2n2Tup3dsIl2FeRcj/HxWhaIV+h
	rT6hWparxO/3WWByYXUDQqHD4TjGHo202vySxvBs45xxr9DrAwWX70WzfbEhMeuvs+EKN3AgAICnS
	V0reizpm/TBrDm7a7xY4B5B5/ubGgeetDweXoAi1il0Vmq5jl+w0UsjCQlJ8LHdA9kesD9k/Wq3Z1
	xl4lef0f1UoY9IPsldcF8iVpll4vWZiXAMRR3qw/QnWzjZQVO/7kWmbKuWt+Naxw8LVZXWgM2o2mG
	2hM19wLZFyxMfii7i7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCY2-005CRR-P9; Wed, 04 Aug 2021 08:46:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCXz-005CQj-QP
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 08:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628066803; x=1659602803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4pYMkRlX38NNd5ekcHCNDs7b0kdlhQPRaRpUCPO9W/I=;
 b=GaVdyMs74RV6RpOTEe5gLN1LpyWhSr4zcnnkcL1NF4adhz/SBVKkmM41
 /O2XEBt4Td7QXBp/0xtLGkVwfRI9J+7h7NStBXGrJhCeMvxJZ26dkIFJP
 yoADUeYFU9Ih2X6Jfmv4QChjIBSt/lHKTHejNBbwHKB02a44kBy/fBLrC
 A76ywdqm33fIUizFEYvW7FHhvf83iuP9jNoC0uBdcDcRzoQRnmItLvPEy
 EFd3tBxAxxIPOSiaZMp+JiWtCcqeIOGJNdk1mA7AfI1UZiSyEFtYcgBAv
 OYfw7gqBIEoPaHqz861lpM77PBGZamPOqlELVAEHWdXflhyLQEX0a7+aj g==;
IronPort-SDR: 9avkbVS1wlSP3hKoTjJ6W3uD/yjWK22S09qLRA7utGzaXXmCP0bw6hfH7BJmV2sqNGmX7oafEV
 pmguns90+qXB5DlMIiObPHfzro8tyWjUr+ItgPEQ5Mx7uzO9u1JNlmoX7MV5UKnzpB28AmPfbi
 Rc/zJLtWh51iHq9GzePhjYsn2iawwDEkxcDiI+s0+HkFY5/WqwUXTH9EJw8ztYLFZMvezE4mSk
 kMirjDp0sgQefxM1dZlAt4IeDby6D2DJd/zmta6s1TjOEtsKbOQr/6AS6WIkoCvxsYdIgXku0J
 C1LJIjpxZbZUlo7dfOI8DnXd
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="138755645"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2021 01:46:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:46:42 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:46:40 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: defconfig for 5.15
Date: Wed, 4 Aug 2021 10:46:31 +0200
Message-ID: <20210804084631.12934-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_014643_916529_BC83E1FD 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804084631.HCqnKc39QST9Ind7P4w5MTW4kxsqHs_TFpvGMR2YOJ0@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.15 which contains addition for SAMA7G5.

Thanks, best regards,
  Nicolas

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.15

for you to fetch changes up to b62869dcd4bcf341d3750a2bcad9a80c6d5562a8:

  ARM: multi_v7_defconfig: add sama7g5 SoC (2021-07-19 15:25:42 +0200)

----------------------------------------------------------------
AT91 defconfig for 5.15:

- add defconfig entries for new SoC: SAMA7G5
  - dedicated sama7_defconfig to match the needed peripherals and
    dependencies
  - addition to the generic multi_v7_defconfig

----------------------------------------------------------------
Eugen Hristev (2):
      ARM: configs: at91: add defconfig for sama7 family of SoCs
      ARM: multi_v7_defconfig: add sama7g5 SoC

 arch/arm/configs/multi_v7_defconfig |   2 +
 arch/arm/configs/sama7_defconfig    | 209 +++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 arch/arm/configs/sama7_defconfig

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
