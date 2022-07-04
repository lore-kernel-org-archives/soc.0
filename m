Return-Path: <SRS0=j838=XJ=foss.st.com=prvs=31841a1f41=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AD8C433EF
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 07:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBE4CC341CE; Mon,  4 Jul 2022 07:55:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ABDBC341D6;
	Mon,  4 Jul 2022 07:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ABDBC341D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2647LkNY023409;
	Mon, 4 Jul 2022 09:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=HbzLjkBGGA79hIf3vv8F18aGtb8FHPAiUnfdNzOLbs8=;
 b=ematV35Vt/lfIH1jYGwYwtD9g4cFp75lNE8ZGWiNJ8PgTX1R6Eb67rBWibGJx/mYf6YQ
 KSCbIy1tz+6su89u721zwQjur69AL6goMG/NHEvwVnSjsWsVGvrcPlBW3cOpTMht03z+
 1OUn9lzysrDj3hso3KjF40KrQknBPN1iDLrO/L1UYjuc2kxF41CxgLfzR944OpX3a6a7
 gIqfQzsf5WnF6l+8dK4V68rpXz54otsRUT7RMxvSJPwOCoaJjyseQXWzgNsyl+eRFk4g
 wpocdH5AIqYuonuf3Wul2+Hb4iuqAD4EBL5kEVoZilpMSQk0d+AjqoBkW+Xj2uyFVKBH Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2b5a8t4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Jul 2022 09:55:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4269510002A;
	Mon,  4 Jul 2022 09:55:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AD9D2128C3;
	Mon,  4 Jul 2022 09:55:39 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 09:55:38 +0200
Message-ID: <1259e082-a3a4-96a5-ec9c-05dbb893a746@foss.st.com>
Date: Mon, 4 Jul 2022 09:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
        arm-soc
	<arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL - V2] STM32 DT fixes for v5.19 #2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_07,2022-06-28_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this second round of STM32 DT fixes for v5.19 cycle. It 
mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.

Changes since V1:

- rebase on v5.19-rc4

Thanks
Alex

The following changes since commit 03c765b0e3b4cb5063276b086c76f7a612856a9a:

   Linux 5.19-rc4 (2022-06-26 14:22:10 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.19-fixes-2

for you to fetch changes up to 1d0c1aadf1fd9f3de95d1532b3651e8634546e71:

   ARM: dts: stm32: add missing usbh clock and fix clk order on 
stm32mp15 (2022-07-04 09:10:24 +0200)

----------------------------------------------------------------
STM32 DT fixes for v5.19, round 2

Highlights:
-----------

  -Fixes STM32MP15:
   - Add missing usbh clock and fix clk order for usbh to avoid PLL
     issue.
   - Fix SCMI version: use scmi regulator and update missing SCMI
     clocks to be able to correcly boot.

----------------------------------------------------------------
Etienne Carriere (1):
       ARM: dts: stm32: fix pwr regulators references to use scmi

Fabrice Gasnier (1):
       ARM: dts: stm32: add missing usbh clock and fix clk order on 
stm32mp15

Gabriel Fernandez (3):
       ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
       ARM: dts: stm32: DSI should use LSE SCMI clock on DK1/ED1 STM32 board
       ARM: dts: stm32: delete fixed clock node on STM32MP15-SCMI

  arch/arm/boot/dts/stm32mp15-scmi.dtsi      | 58 
++++++++++++++++++++++++++++++
  arch/arm/boot/dts/stm32mp151.dtsi          |  6 ++--
  arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts |  4 +++
  arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts |  1 +
  arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts |  4 +++
  arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts |  1 +
  6 files changed, 71 insertions(+), 3 deletions(-)
