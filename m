Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9A3C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB7760F12
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 14:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AB7760F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZFxN6c63PmvVAxGWRfDZObAoZ4+YDCxy5DSlGkarMPk=; b=imlMH0drofO1FFVCJKpBIqq2mg
	5SKCgnQWx5QB4vsQrhJgx0gGl0TqkhWPrI3m3ktcTH3GeGpjlHgJgODAxzVyldFqL3PZAgOE4X0bd
	z6pRo9QW8vyhCKixCE1hcgCOWnUdU42k+SrQ22g7zsNqXqD+dk+p7ISDn70RA/jxHSrz+SmXNDi6c
	fgXfF5MutOsUG67HIs3lD6POqh13tzwB9w7jRRslNeufVfvAFQ/sZcheCvZsYrfXwtU/DUlQ62EmU
	7e921/Rmo3MIudqdzNYOeBomWkEc5WRBy+HHEvKW70fRxvqmTJ090SYANyi5CtV1LxL8dAISou1Nv
	qMIed2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9T2Y-008tbb-UJ; Fri, 30 Jul 2021 13:59:07 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9T2U-008tZx-TF
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 13:59:04 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UDulHZ028639; Fri, 30 Jul 2021 15:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=MzQ8oKCDaWhRsIkt9+RoUCYLRwvPQ1J5VN1nlqw5bMc=;
 b=KejYSZ5zYGOU6ukv2YMLt6/gryAGqEkvys3qwFa6OAh7ukNrjKh3Z9Oe8jLYsSlIqnQF
 9Wv6r/Ov5SFm89IZd0iaSLWjiBs/9Q5fs493T5amqRgwICNmbdx12mbBTU05K1oDCge9
 E55nbqUZu+pRZlFjukKdSzEeY3virOFaKlsXW1TmIIdpsVKUJAWWHt1HxxPwgDxcMUdQ
 vWS6gkUJnKff7d8XOx2KC2XpZi+NGj5U1LdekZ4UU8/Qpi4qJql/F5fUUcnZgTrvkLUp
 F5CmKBOBeGvXv0Fc0Da5gjVHFB67/PjXufkRxZ8vbuu13j/jSA5BbWEvFA58q8I871Ue eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a4fvygu6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 15:58:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B636710002A;
 Fri, 30 Jul 2021 15:58:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93A7A23150B;
 Fri, 30 Jul 2021 15:58:55 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul
 2021 15:58:54 +0200
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marex@denx.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [GIT PULL] STM32 DT fixes for v5.14 #1
Message-ID: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
Date: Fri, 30 Jul 2021 15:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-30,
 2021-07-30 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_065903_313182_63070391 
X-CRM114-Status: GOOD (  14.24  )
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
Message-ID: <20210730135854.YccFoxAOfYhw0a9GvRKgcPqPArWCKL_12sVj3QaqpPo@z>

Hi Arnd, Olof and Kevin,

Please consider this first round of STM32 DT fixes for v5.14. It 
concerns DHCOM/DHCOR fixes.

Thanks
Alex


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.14-fixes-1

for you to fetch changes up to 15f68f027ebd961b99a1c420f96ff3838c5e4450:

   ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM 
(2021-07-30 15:34:51 +0200)

----------------------------------------------------------------
STM32 DT fixes for v5.14, round 1

Highlights:
-----------

  -Fixes are for DHCOM/DHCOR boards:
   - Set HW RTC ad default RTC
   - Disable EDPD LAN8710 feature as it is not a stable feature.
   - Fix touchscreen IRQ line assignment

----------------------------------------------------------------
Marek Vasut (3):
       ARM: dts: stm32: Prefer HW RTC on DHCOM SoM
       ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
       ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM

  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 24 
++++++++++++++----------
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi  |  5 ++++-
  2 files changed, 18 insertions(+), 11 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
