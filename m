Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C974DC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 08:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3E064DEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 08:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3E064DEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwbyGFu34o6hvN2UxbIXRGqfSqKjGEQiC2fqOiB9XdI=; b=oRirnjuO1B+ap9IgpaKq40ITUd
	Gw9coG/OgxOI78wmSr9QIvy/OsbfhthqEhSdndcjxKh3Gv3xOGPq/KeGtYYi73+kuynPvsYxDEppG
	JEU4Vw4Bu7uUrz3c5SYzdbrIDTt/B1Nd5ZctCMhygsSWoFbiPQkBOA8ud15kQfB8jR+EEbLbIFvjH
	JEC1stxO40FgR3WD7feMTSlRr4xCLvEe9g2yTF1rzLjoRH5SYmgGoH/H/n0/T6ozVsM+OrAFnmGBr
	5Z8bYqRo5Gip9gz58/ir9C90h/gLO82rNPnQt+nmU7zRwdB/yRcsactCGLrbn73Ua4g7NTmmfERZg
	Lt9f3MAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PSa-0007jH-2L; Fri, 29 Jan 2021 08:48:56 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PSW-0007ho-PL
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 08:48:53 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10T8g12F019183; Fri, 29 Jan 2021 09:48:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Y4R51dVXYytMnFJd2sUfWLMCXjGfjNB5brYNmHLmDQk=;
 b=Yq/PxWDu5sf7DH0+reXTpSM3J9xRUoGahlkRq5Zdr8e4DNjzFoojVhMQuS0mY7fkEkjl
 n97cBZeDVEMWLF2wo0U4BmPwl1ySvrU7E3lfENqOtcWJk8d7RamdhRXf/9pkYZVrj/VM
 gw9sja9qfckbY3a2zZyC8ThElzBxcHcH98ZRE6n3rmmcq2bYl0jSZv9KJONmgsyd7BwK
 FX/cUYTooMEOtTJiZAp/b25dWuZXlb0YW1filO5w6+jLirVZvFU6/JeM4pjtzVLJ7ZsJ
 qsfiYiU3g9keIipg6I1JKjqHcOwXpt1fm0Zmj4aVfD0DAxMXklLvE966rIMqwSCz0GDe Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689tec64r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 09:48:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1A5310002A;
 Fri, 29 Jan 2021 09:48:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1408221793;
 Fri, 29 Jan 2021 09:48:42 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan 2021 09:48:42
 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>,
 <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>, <arm@kernel.org>
Subject: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
Date: Fri, 29 Jan 2021 09:48:42 +0100
Message-ID: <20210129084842.29123-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-29_03:2021-01-28,
 2021-01-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_034853_163019_9C4BE921 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129084842.gjst1O_hwIqca0hBCdH1PNr5CMYGHuTmzSNKQ1_85JU@z>

From: Yannick Fertre <yannick.fertre@foss.st.com>

Enable CEC support for STMicroelectronics as loadable module.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi,

I only have this patch for stm32 config v5.12 PR. Can you merge it please ?

Thanks
Alex

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c5f25710fedc..05cc0607a9ad 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -656,6 +656,7 @@ CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 CONFIG_CEC_SAMSUNG_S5P=m
+CONFIG_CEC_STM32=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ADV7604=m
 CONFIG_VIDEO_ADV7604_CEC=y
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
