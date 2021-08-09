Return-Path: <SRS0=5t0o=NA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC9EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 13:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC2160F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 13:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FC2160F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Em2yv5FfMjWl0T2ywcUDtkBT0OXPhC3vTh4uEJPKnY=; b=N8NJyhCwaokx/h
	VLwYdvBNTLFYplENaOZfOZDY7iNZyY+08ALSE5Ueq+U9G+JCmrnK/ItGvbCI7SVQe8Q3ohDPZoegL
	nefyylyq/+LQ49ZpaS2/1B8lYNRT48Me3TTAkgxOoeDK3eHdLz6OVaf3bHNckAK63blleCEYFMuhF
	PjV34hzxnZK//RANDhSTWptZqQIhB0kcwgQgw2Cc3+2zk/68X3fPNV0Em4IaYUHzVJcEBSiN8XDxL
	47Cnumxz81HgB2iegTZ+JcxQulzbDkLNCOE13ouoVmwnrfo+hrqhjsqcVofnIuWcGZoQWcAXHRy9j
	Mgn5b2vJQxPhd3Y7776g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5b5-000oMT-Le; Mon, 09 Aug 2021 13:45:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5b1-000oLd-VT
 for linux-arm-kernel@lists.infradead.org; Mon, 09 Aug 2021 13:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628516740; x=1660052740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oIIhO5Fu8GvdFVb5Lyvx66v0sHtOf2NnOJazlM74dk=;
 b=bKNmt47m84GJTzNI59U3GyWDv7gkw65hVd1CkA7riDeUQDiaurhcDsJm
 gQV2Ed7cJeUek7USgwYJEDSPFeD4WAr02PSWXUsjRHklpO7mNGrx8Emw6
 jR7mzxB0yu+swIRmgE9Qg+ywmqzEPJ3MTRmaIuafLEw6m17Ye6GwTs9qE
 rNXjYtVRcep71X0eFwVrdW7mp9kb1Og5tBv/SMiEDvBZExxYPxZ/B7lJt
 Zi0c70xqQdQFLMfKOONzktXYL5C2v7Z9H10CqjUQ/fml+kEc4NjY4lS69
 8BlCOZOIJ/i/HIqOeDFNQFCcpwRvq3xREFMzy2oRubKiDu5smXIqc7ScU g==;
IronPort-SDR: 1ZxTEx2HGugTM+LJDRVUhmoFTW3u/14G+7ktp9lJpnkR+cXqR6tIx9oiOZz9Wdx/ELcNt5SNts
 bfgBmnzczVrjuHduFytyq5KHay2Vu8lpcnZHy8UjtgcoS9Vj1QETxLtwBDeucmqagng3/m6cet
 0kyrTh34dKXPHiXZZhr9/4ohplyN4erTfQFrRjlz+42H/a2NOlzCxlWdDcyYdtidbYruzH8n2N
 m9CRuLezykSF6Lt//mCktDRg6cVUhlpv79L+xYnbllFGLlvtPpPFCX/zGefUjL8dgUHrgXqwh4
 UGZmEXp/SFAVgPnw4/Wb+dyr
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="127592839"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Aug 2021 06:45:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 06:45:35 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 9 Aug 2021 06:45:32 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL v2] ARM: at91: defconfig for 5.15
Date: Mon, 9 Aug 2021 15:45:21 +0200
Message-ID: <20210809134521.10155-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
References: <CAK8P3a1Ru-qawBWtbmfJm-jiPpJTRJ9zSufXHNCZvxt1RCMFBA@mail.gmail.com>
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_064540_121132_C0C85126 
X-CRM114-Status: UNSURE (   9.57  )
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
Message-ID: <20210809134521.WlFAO-vgm1uzFS_QqmXGBupRjLeKCWmT0rwmM35fx4Y@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the second attept about defconfig changes for 5.15 which contains
addition for SAMA7G5.

v1 --> v2:
- add more information to the tag message for explaining why we prefer
  a new sama7_defconfig file.

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
  - dedicated sama7_defconfig which avoids having to carry older drivers
    and dependencies from the sama5 family:
    CACHE_L2X0, CAN_AT91, TOUCHSCREEN_ADC, AT91SAM9X_WATCHDOG,
    VIDEO_ATMEL_ISI, SND_ATMEL_SOC_I2S, MMC_ATMELMCI, AT_HDMAC, AT91_ADC,
    REGULATOR_ACT*
    Addition of new drivers that are not part of any sama5 SoC:
    SND_MCHP_SOC_I2S_MCC, SND_MCHP_SOC_SPDIFTX|RX, MICROCHIP_PIT64B
    plus upcoming MIPI pipeline, audio sample rate converter, ...
    It also maintains both sama5 and sama7 defconfig tailored for their
    respective families and easy to identify.
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
