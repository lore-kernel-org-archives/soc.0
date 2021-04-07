Return-Path: <SRS0=LeP6=JE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFECC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 11:46:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498AD61284
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Apr 2021 11:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498AD61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J5W3fYTGULuxxqM7ZPrGXv/IsfNnVBt/jw75/Z7SzXc=; b=huPAZGmgI/BMHCOd926gmLN2W0
	6DnuyetsZ6D4tORMmuwu5hUOitZ41FiQ5mn1gl2Uq4pLB7eBXuRhTiiWOClOnImGOGHpP8b7h/Wf1
	XRlHu0qrBgsBVcZiyd9wrP9p+DM22qAphDZDHmEgZ4Vxpfwb04z3/0PtiiXJLOeVYOa/Tu1j9+/yL
	TFQmXhh8bW8XreVZURziD0FKwFxqRKupeJ+/W4t1GSqjnVrsBf06vPpxE4w/HLMDKfXfAK0CO5jwR
	edPqJfjeiettZvLidZ2gXwePHiytolLKuZ9mQBo0CfQ/nRCMxcG4rBfSGw5GDAWdXsT83usu3aHT+
	zcXjebnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU6bu-004u9b-23; Wed, 07 Apr 2021 11:44:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU6bk-004u81-Ca
 for linux-arm-kernel@lists.infradead.org; Wed, 07 Apr 2021 11:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617795868; x=1649331868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rmI8sOYp6dN8KOCJhrdk1xqp58BimrU3uwoH1pcF7KA=;
 b=A4OwbO1b1UNfOM4txQaqcYyHahJjuUwl3aXJRsDvboaIs0SlwWDjyVSA
 X2ss77ALNgUInMh9KnMgRYHs0zT+L7u5r16Y2I0OuHT6l8MkNwivoEtV6
 S26ZyeZUC1h8hooFJ/Q2b10H2+aDT18sooBHQIsz+9/lCkBSrEe1oicz6
 e5rYyxhf3jPj2wAD1pv4Za60uT3L0yh4iRkjECZjWvOV9SjUR/UA/dWkQ
 3svFZx0Ik3JDPxszeM67R41Kq2jUwuV9n9zQvC6lmEJIs7S5rWRQY7qsW
 r898PIRNNmG44dwL4WEhUIZvckaIwsIsQHonxDO//DBIGbx5gnM+AzOdr A==;
IronPort-SDR: V8qZJ52OkEAs7TMMqaQ1BLAll3Fii+xHudin2rgYC8dMTCKIGPg8Z/1mtCY3iZ7S2j2CQlfKGX
 rlKfEGnt6fuQ+vQJSxJEC3Q4ioBA5quBp8ZKYX5bWNMNpExEucP6rdyofNucBRjBjPprNgOqN7
 BkKP4SXq7xhkcuNiKdnvp9714tSiV6OYR7Xt8VArY/Tyx4xRdDzBs3HRc9qp74ToKuhcM7OmBM
 MX9QsITq6+acTq6QjW0ai4XC2XQ5qcNKEo9za1vnNpbwhILI7yV0CmYDGtisdiSQb6zmUKtFm+
 F98=
X-IronPort-AV: E=Sophos;i="5.82,203,1613458800"; d="scan'208";a="109962106"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Apr 2021 04:44:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Apr 2021 04:44:24 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 7 Apr 2021 04:44:22 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.13
Date: Wed, 7 Apr 2021 13:44:15 +0200
Message-ID: <20210407114415.13180-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_124429_119903_9521B2EB 
X-CRM114-Status: UNSURE (   7.97  )
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210407114415.43WFkAHvYcvABeBY9q0niHDm9ajEiEEGCfUbpfnjpJM@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is first batch of dt changes for 5.13. Please pull.

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.13

for you to fetch changes up to 4d930c421e3b4f5bb3a9dd6b2eba2b15d458fcb5:

  ARM: dts: at91: sama5d2: add ETB and ETM unit name (2021-04-07 13:33:19 +0200)

----------------------------------------------------------------
AT91 dt for 5.13:

- two little fixes (typo, W=1)
- a change in gpio button keycode for recent boards

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      ARM: dts: at91: Fix a typo

Ludovic Desroches (1):
      ARM: dts: at91: change the key code of the gpio key

Nicolas Ferre (1):
      ARM: dts: at91: sama5d2: add ETB and ETM unit name

 arch/arm/boot/dts/at91-sam9x60ek.dts          | 3 ++-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts   | 3 ++-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts | 3 ++-
 arch/arm/boot/dts/at91-sama5d2_icp.dts        | 3 ++-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     | 3 ++-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   | 3 ++-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   | 3 ++-
 arch/arm/boot/dts/at91sam9260ek.dts           | 3 ++-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi   | 3 ++-
 arch/arm/boot/dts/sama5d2.dtsi                | 4 ++--
 arch/arm/boot/dts/sama5d3.dtsi                | 2 +-
 11 files changed, 21 insertions(+), 12 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
