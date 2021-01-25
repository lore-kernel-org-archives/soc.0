Return-Path: <SRS0=q8Yd=G4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78570C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 16:23:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CB21224D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Jan 2021 16:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CB21224D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MsuxFipeYqUtd51x5Z5xTAZFXCGcafmhHTCYETrMB+4=; b=Db6A3bf18i6112Jn2u0AOvbJdn
	Tdo3bjF4G1S8/W+Mc8dQvDjJ7Nh+zE2wHMTaLtrw7EAOpSBuZcDf0OFp6nKkQOtEV4iIPHhONWcHp
	sOJLu7trMNK3Zh3YW68aoXPH/32EGdz8MPfTvaruUQSIQVwVui9okCgon0N6XLMxWlI0ORwxMfH9Y
	AZaroVatkBnG7IDlsWxn60lPgWjzolpbH5kfsXjgEJFlyUKIIoVpouwGPzqa+hMVm+EANc9bNetX6
	L3PwU/FTBBlIkfQNVDo/yl4L0HQNrT8+Mco2lYf5eT1A1iWwjEfofoDQd2jeDBVUVAU1j7vsS9CM2
	SagFSLnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l44d0-0001Oo-Et; Mon, 25 Jan 2021 16:22:10 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l44cv-0001ON-OM
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Jan 2021 16:22:06 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10PGLvT4018304; Mon, 25 Jan 2021 17:21:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=r5v0keWguisfnI56Tic9HGrT2U4F4xL64Njgu4tlmVI=;
 b=qAcyUUEFj2NRsLP0H3PuuFqvES9uHDtfxIC6p3I3JTaqskfzHZfy5QthmlU2AjPnC/8m
 QDNVlVgDHD4elEOPZudQxGey56A9+bX5hUpfS2NyRfHsnwdyQLshUCTXLHKCrHSzymRt
 l+wgXJgBUgT/IozQSA+U/UIDDMOnIW8neptbITs56yd2uKaPdGGfbMDHGuP4OgwtbJOZ
 nT7QnFrJph3LAE7a8Nfo5KnizyJn/ZEeMYHJ2hd4DArEWVfZz1M/locM5rBz0AgDt3Us
 nVV8O/LEzial2eiYvyQyW5GhxWT2jjkwWgvhaST676jJGi5vMqHjVYEYjl3OEj6mTbmI YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjn3w5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 17:21:57 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56301100034;
 Mon, 25 Jan 2021 17:21:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 323D8219835;
 Mon, 25 Jan 2021 17:21:55 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Jan
 2021 17:21:54 +0100
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT fixes for v5.11 #1
Message-ID: <b7379980-857e-736a-85d8-58e2bd300141@foss.st.com>
Date: Mon, 25 Jan 2021 17:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_06:2021-01-25,
 2021-01-25 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_112205_993252_9F5CC0EA 
X-CRM114-Status: GOOD (  15.86  )
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
Cc: Marek Vasut <marex@denx.de>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125162152.dOAfKGjlgxHAbQ7THyCZTUuySB00zcNaNDvsJaA9lXE@z>

Hi Arnd, Olof and Kevin,

Please consider this first round of STM32 DT fixes for v5.11. It 
concerns DHCOM/DHCOR fixes.

Thanks
Alex

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.11-fixes-1

for you to fetch changes up to 83d411224025ac1baab981e3d2f5d29e7761541d:

   ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02 (2021-01-14 
18:17:26 +0100)

----------------------------------------------------------------
STM32 DT fixes for v5.11, round 1

Highlights:
-----------

  -Fixes are for DHCOM/DHCOR boards:
   - Fix DRC02 uSD card detect polarity
   - use uSD card detect on DHCOM
   - Disable uSD WP on DHCOM
   - Disable TSC2004 on DRC02
   - Fix GPIO hogs on DHCOM boards

----------------------------------------------------------------
Marek Vasut (7):
       ARM: dts: stm32: Fix polarity of the DH DRC02 uSD card detect
       ARM: dts: stm32: Connect card-detect signal on DHCOM
       ARM: dts: stm32: Disable WP on DHCOM uSD slot
       ARM: dts: stm32: Disable optional TSC2004 on DRC02 board
       ARM: dts: stm32: Fix GPIO hog names on DHCOM
       ARM: dts: stm32: Fix GPIO hog flags on DHCOM PicoITX
       ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02

  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi   | 16 +++++++++++-----
  arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi |  4 ++--
  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi     |  3 ++-
  3 files changed, 15 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
