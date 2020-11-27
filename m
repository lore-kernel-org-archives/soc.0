Return-Path: <SRS0=KWJk=FB=foss.st.com=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAD9C2D0E4
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 08:59:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03EE92224A; Fri, 27 Nov 2020 08:59:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA2A2222C;
	Fri, 27 Nov 2020 08:59:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qYnzWb4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA2A2222C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.torgue@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0AR8qYrc004682;
	Fri, 27 Nov 2020 09:59:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=F72KZXBeMFKSuaeVrYsx0GBa5YTHLQexjvfqU47o+Mc=;
 b=qYnzWb4uVsBhmwoirbF//aXppG5PqZk1MSECEsM1pbAZIpVEEQHpvHrw5qP8cNVrec5l
 oOjZmtaJXFHwjEPDYSe78Y+dEFvUa7WJRpqzLoZ0wJuCvPbC37Y4VyOXdpAwX+Ur6lfp
 uxpniQSiX6Ghlahws0G27CbHHe7sQCZtG4NUTrL6vFyA8lAE7ejJ31fR4w/X81we5vqs
 0PubmEjjydVvN7Gki03oO0vAwx5koH55+M3dPlY9cCX2Hs2yT8X+SLGhhnACjjtLI/6o
 vyYvwCk75ZT/dGMjoue4bQ+gF3APksAksWGIX/wLyIRCQCVzqOBzUW84+kKUEedPWdo3 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 34y05hsfsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2020 09:59:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3EA00100034;
	Fri, 27 Nov 2020 09:59:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A1CD230CF0;
	Fri, 27 Nov 2020 09:59:00 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov
 2020 09:58:59 +0100
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Ahmad Fatoum
	<a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>,
        Alexandre TORGUE
	<alexandre.torgue@st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 config changes for v5.11 #1
Message-ID: <a6ea4940-a9a3-eba6-4ef5-aba7ff382009@foss.st.com>
Date: Fri, 27 Nov 2020 09:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-27_04:2020-11-26,2020-11-27 signatures=0

Hi ARM SoC maintainers,

Please consider this first round of STM32 config updates for v5.11.

regards
Alex


The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-config-for-v5.11-1

for you to fetch changes up to 01d13862543d3a017270ad84170579848472589f:

   ARM: multi_v7_defconfig: enable STM32 dfsdm audio support (2020-11-26 
14:46:04 +0100)

----------------------------------------------------------------
STM32 config updates for v5.11, round 1

Highlights:
----------

-Enable counters for STM32
-Enable crypto for STM32
-Enable audio for STM32: DFSDM and SPDIFRX
-Enable STUSB160x Type-C controller

All configs are enabled as module.

----------------------------------------------------------------
Amelie Delaunay (1):
       ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller 
support

Fabrice Gasnier (1):
       ARM: multi_v7_defconfig: enable counter subsystem and stm32 
counter drivers

Lionel Debieve (1):
       ARM: multi_v7_defconfig: add STM32 crypto support

Olivier Moysan (2):
       ARM: multi_v7_defconfig: enable STM32 spdifrx support
       ARM: multi_v7_defconfig: enable STM32 dfsdm audio support

  arch/arm/configs/multi_v7_defconfig | 10 ++++++++++
  1 file changed, 10 insertions(+)
