Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9006AC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:41:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC8523444
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC8523444
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MK3xT4SCJ1CNwGvmEsO//1KKDF7NoACx79ommqFI21M=; b=KV1BrjKw0CZxEV037vwpe46pvy
	//SIxmykzqFc/puGE1k8YKX+rxWFcIdZOuxdS9ybJ70xDDYaobKpCF2nyJTPIdbBop7pakXtnnrVK
	8k8ZoOjBp3bjHGYmhMeCJSFBbXNRlqguATDcbzfLZcl/TrhtfClQvL9+X3Sgtc4NfT/HSlATiDM2L
	UFXBqWJBQf/g8E352H8ANoNZtzHc17XLH2S2mLTB1UVeZGV8aPLObLEjMi4PTKt4egFx7q6OzFUJk
	kuXZbpoWZJA7uaw6HHZfGqkSeEFAZN+ZiI6SALtltwIsGiioO999n8g//pabRwVk+Nmspvm6M4F2l
	Y7MLTmYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2xbe-0000Ov-Mk; Fri, 22 Jan 2021 14:40:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2xbZ-0000MF-TY
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 14:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611326405; x=1642862405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UzBjEzUyX+OhZLxv1R0FMq/3yK2+AUe0cH8DHmp+984=;
 b=YV9soTipMlujGpIVJkiOO4/I4KVJYgMf/vWypC/kmNWYumYy/tuu0Q1w
 b1RPa3by9UeOoyjBE6gv3JdYLrZR5Q7WPr1Q8gTtrFZzlg0XSKzIKTbox
 V1AcUPfxT9XQ7mg/olPd8g5u8pHcS2I3FR7uCEvvq40Q9v8LXu17RAre/
 dqzUrrFSMt4T18lNap2YAiAAmSojY3SxO9xNNhdhxqKZ+esG5Qi8Uaj8h
 ulpMiSyBINTq1e/WMRSi3WaU91dNB4MhuzUfCOItEZWbUeXgzfYn+umW1
 UT1U3I7YbnVrLoA52L6rI2B8Cn63vC0PIp7cIXuaF/VnWsZ4lfCrfZoPd g==;
IronPort-SDR: y70wBAXEcE+ubfOPxa7y9LJJ9qfp5O/FvKnvdg/oCm/nu5ZWSZU8BwcLk2/xn0Ify4b0uRDvq7
 d6xGrCKK/JPed3qQ52nJ6SPIyYof83qu+P/2orjhF4OCJX+5YsZilKuC4HKZ4aI0shGpoqhgWv
 KnNZ4yL8a8eOMxpRx2CFBQTrY2At+FDNx41EtDV7R2zA70sfl6R2zDcuiX/1Vo4rko9lKyQxDB
 2a3BiEUaBO4t1fA36JrYhbUAJ8c0xzL6DTVu/kGXmhMc2HPKSrfo7E0j//ruGZzG/33fWnIkwa
 XZE=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="101051917"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2021 07:40:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 07:40:02 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 22 Jan 2021 07:40:00 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: soc for 5.12
Date: Fri, 22 Jan 2021 15:35:36 +0100
Message-ID: <20210122143536.168833-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_094006_156142_11F4B3DD 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122143536.ihtsGSVJKigNn_6SUtAsY9D7NQHnmX9h5JfdYQxCmw0@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

I'm taking back the lead on sending the pull-requests for AT91 and hope that I
didn't loose the knowledge in the meantime. Tell me if there's something I'm
missing. Thanks a lot to Alexandre who kept our flow steady and very
predictable during all those years!

Here are the first SoC changes for 5.12 which contain a single patch for multi
platform kernels.

I plan to send another pull-request for the SoC changes related to new sama7g5
that Claudiu sent to the mainling-list recently. I'll let it mature in
linux-next by the beginning of next week and will send another pull-request by
mid-next-week.
Tell me if you see a problem with this approach.

Thanks, best regards,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.12

for you to fetch changes up to 960ddf70cc11024e6e9dac206316d0160e00a77d:

  drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs (2020-12-28 17:58:20 +0100)

----------------------------------------------------------------
AT91 SoC for 5.12

 - Only call atmel/soc.c driver on AT91 platforms

----------------------------------------------------------------
Sudeep Holla (1):
      drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs

 drivers/soc/atmel/soc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
