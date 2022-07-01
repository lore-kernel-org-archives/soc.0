Return-Path: <SRS0=wXeV=XG=foss.st.com=prvs=3181019c1f=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28BCC43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 12:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70D9FC341C7; Fri,  1 Jul 2022 12:05:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12A43C3411E;
	Fri,  1 Jul 2022 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12A43C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2619AACU011403;
	Fri, 1 Jul 2022 14:05:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=M8hVZSBWHsDZEIxHPV0grc51guofkoifLN7jNbuYaUg=;
 b=T7/e8SnD5N8H9YISwQERIgnnNIlo6Fhn4+HDrHhAaXnAaQrLueN3BD+8XCpfTNOdKiwk
 +DUkG0HjTysFMoUmR1mHk6l33eqo15llifaqWLkf3MBhKVB72k5u5m5ESDDprs6GHDSw
 6nKin4Q0+zxqZvSkvU31e8ZmsCF2ZqaiAErF0HE3N7aRl2IU9sWKj96nbcQoyH8E7AQK
 Q97mxOI3DjpaXWKQ7Rc1OGAMnSsE1mtc0J4EQPzt8MOIhuudXO5AgZlpvBP48mF+ckGO
 dV++qDs9MSPorMQyt0iuWA5ebDuLMK0bYowtQJwDK+vU32hmV9uZHqnIDx+M9tMYDSju Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h1x2brycf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 14:05:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC07A10002A;
	Fri,  1 Jul 2022 14:05:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCE7921BF4A;
	Fri,  1 Jul 2022 14:05:34 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 1 Jul
 2022 14:05:34 +0200
Message-ID: <85e47007-bfba-7a64-db75-893b0d20d025@foss.st.com>
Date: Fri, 1 Jul 2022 14:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT fixes for v5.19 #2
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
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_06,2022-06-28_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this second round of STM32 DT fixes for v5.19 cycle. It 
mainly concerns fixes for SCMI version of ST boards introduced in v5.19-rc1.

Thanks
Alex

The following changes since commit ea3414e1249ea35bc02debe28d4cbfeb6261657c:

   ARM: dts: stm32: move SCMI related nodes in a dedicated file for 
stm32mp15 (2022-06-07 17:22:21 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.19-fixes-2

for you to fetch changes up to 779a1e6596a1f88e2a8d88544bb704babd35921f:

   ARM: dts: stm32: add missing usbh clock and fix clk order on 
stm32mp15 (2022-07-01 12:25:11 +0200)

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
