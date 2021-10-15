Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E95C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 15:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC54561181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 15:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC54561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U1AAg000jGTQ4b2LsuMKBlZTKKjo35xDdpHGYmGcSPE=; b=Fhw6c0IipXaXMOkXqNyshTHpBG
	iUAG4EIUraWL5wb6ouVan3v1P9LSPzhw3wZ7Z75z7a/rGGXA8mP6I9x3YyqBJ1mo0Z3PAloTODnrW
	yFHAY40epl50oNbjSZnj6pHCN3WeP5onLFJs/t3tptgk0sIWRtnnQXIMQYtPiZnzhqcEmOBsBSIx8
	KkIFYxno5l5GVB7eyk49LlbcuDY+RtpRtcUX8BVL03GCZsaO034LWHYEvgOo0eZRot9JUjL+FbKLs
	iFxngMM5VKC3STg88d3vi+KoKalbtMCpsrjTeafhPn1ZsGEiphbl36FSkr4Y2HvMTXIlg0dC9TUbS
	p2FHg5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOzL-007tSt-L1; Fri, 15 Oct 2021 15:19:16 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbOxP-007siJ-4W
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 15:17:17 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FF5wMZ020296; 
 Fri, 15 Oct 2021 17:17:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=Ve+5qj6A1LJAcZzHAYGeQ9tET+26x7KZReEC0Ytg7Ik=;
 b=uiK89ZLlTBV4bmni+dVShJLRE6HWFROpytSKOh/+gDC5J9kO6qvN5wKwGhpkqagWczA6
 XEvrUDi/5MMaotDKsyMOuevNVmOBK4xt3vP9yrlslm2D3Y8ooAeTrJ7WmsH/2yugArdY
 oofHuroA+AP97iW4XGwQr+O3JCchctcLpDpuAIILdkh6qg5+HoKKX5BSNAr595YJpRlv
 8cMlEFoOZbBuH87Z/R1dlqRwy1skph+YIuu3wqbwhEw81KBl23KXI6HXUi8S2UGErucQ
 8b93u/Blc3e07gPmnTHMb9BFYLxhmZ++RhiJbA4Wza16oLtPN7wuTV+3VmJMF8WNmpyC +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bqc04r1ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 17:17:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9269610002A;
 Fri, 15 Oct 2021 17:16:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7754C24FE00;
 Fri, 15 Oct 2021 17:16:04 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 15 Oct
 2021 17:16:03 +0200
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [GIT PULL] STM32 SoC changes for v5.16 #1
Message-ID: <0b6c9657-dcca-3bad-601f-610dfc81d9ae@foss.st.com>
Date: Fri, 15 Oct 2021 17:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_04,2021-10-14_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_081715_937134_4895F7DE 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211015151603.em63JvkTcnWKpxfqdeTYSrVjpQo5t4BX3cqhVdaiMEs@z>

Hi ARM SoC maintainers,

Please consider this first round of STM32 SoC updates for v5.16. As 
you'll see it adds a new STM32 MPU SoC.

regards
Alex


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-soc-for-v5.16-1

for you to fetch changes up to e0302638a3b43c83ff26840df6e496d60c56cbbd:

   ARM: stm32: add initial support for STM32MP13 family (2021-09-20 
08:54:42 +0200)

----------------------------------------------------------------
STM32 SoC for v5.16, round 1

Highlights:
----------

Add support of new STM32MP13 SoC which enhances current
STM32 MPU family. It is mainly a derivative of STM32MP15 SoCs
(one Cortex-A7 plus standard peripherals).

The STM32MP13 SoC diversity is composed by:
     -STM32MP131:
       -core: 1*CA7, 17*TIMERS, 5*LPTIMERS, DMA/MDMA/DMAMUX
       -storage: 3*SDMCC, 1*QSPI, FMC
       -com: USB (OHCI/EHCI, OTG), 5*I2C, 5*SPI/I2S, 8*U(S)ART
       -audio: 2*SAI
       -network: 1*ETH(GMAC)
     -STM32MP133: STM32MP131 + 2*CAN, ETH2(GMAC), ADC1
     -STM32MP135: STM32MP133 + DCMIPP, LTDC

----------------------------------------------------------------
Alexandre Torgue (2):
       docs: arm: stm32: introduce STM32MP13 SoCs
       ARM: stm32: add initial support for STM32MP13 family

  Documentation/arm/index.rst                    |  1 +
  Documentation/arm/stm32/stm32mp13-overview.rst | 37 
++++++++++++++++++++++++++
  arch/arm/mach-stm32/Kconfig                    |  8 ++++++
  arch/arm/mach-stm32/board-dt.c                 |  3 +++
  4 files changed, 49 insertions(+)
  create mode 100644 Documentation/arm/stm32/stm32mp13-overview.rst

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
