Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A7FC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 11:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8BA61184
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 11:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E8BA61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:CC:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9LnXmXk5i9RKXgw53IztZjD8kXQQ16aOhrFyoQ9o1eg=; b=tWp1Pb+LxXzBGvVs42AoCF1CL5
	KIxU8VjB0zOS73GNPyA3G1ECItQ6835PV4kYM070VT2aaeUd+E8h+8MYgtbPM+RrSmsT+fY7pSxmp
	IdPEWrn7B24xK1By3mRPTNo+pxKYU064eBZzz1zTCjkq8f7FIUluDHWXwN84/0qvPdWmfVZjxfTO4
	VPl9h7dedRZ8yyxTboMoFecqyKEfRXzJ+iHQQ0dG4Ipao0W47ER21dUMxUoqFBJ7FvMJfuOIcELH4
	Lfw3MMEfOoesUMZE7xCQF4WEwAbI/32szs5WxNnPSXj9v3aaXRGh0HzkjEv8hA8P8ViHiBTyxnJbJ
	ukOzCgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBxYi-00CB3k-KK; Fri, 06 Aug 2021 10:58:36 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBxYb-00CAzs-NW
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 10:58:32 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176Apvov022607; Fri, 6 Aug 2021 12:58:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=3v5wrbxNai9vUx7PEbA9Luax+ZtNpOotFBfg0Aba5Ks=;
 b=D7CaSI8lTDajembzoxRr5OqK46fkjpjjohg1IhrjViaataQ3WSE9FKFkU0V1PtCQ/4oe
 XTX73HqS+sMqLZOVBNI7W3ZwgQQt6TlI0FQ4IiWXtiz7UaNpxiJgebq8GB6iVy4blgr9
 un+e6TmS+MTwtPE6Mp4DH2JlIlqk3a9VGAI5sHGN3akDeBc4l3FMAGYyXKX43edgWOzy
 df7qQXgBPNFtt1sj4edgteb2dvPi1k6UNpuoXxPBEnJgvW5AJYu729gWsPxYgtyIcXDj
 dNFJJvAh8G4IuphZSjn4wj2sSxaG1GBDbsEHOEovZ0PBJrTx8X6/jrHIcntUQj7S0VMD ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a91q08pru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 12:58:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CAAB6100034;
 Fri,  6 Aug 2021 12:58:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6C9821ED4E;
 Fri,  6 Aug 2021 12:58:18 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 6 Aug
 2021 12:58:18 +0200
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>, arm-soc
 <arm@kernel.org>
CC: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Marek Vasut
 <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v5.15 #1
Message-ID: <e4f0bea3-4065-38d5-f1b2-007e4094c4a8@foss.st.com>
Date: Fri, 6 Aug 2021 12:58:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_03:2021-08-05,
 2021-08-06 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_035830_262496_22CEC9D5 
X-CRM114-Status: GOOD (  13.89  )
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
Message-ID: <20210806105817.93HT79U5GZkMRU6yjifDpFQX7xygqlSgMjz_ris2NDE@z>

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT updates for v5.15. A small 
PR containing mainly dtbs_check warnings fix for ST and DH boards.

regards
Alex

The following changes since commit 15f68f027ebd961b99a1c420f96ff3838c5e4450:

   ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM 
(2021-07-30 15:34:51 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git 
tags/stm32-dt-for-v5.15-1

for you to fetch changes up to 1e6bc5987a5252948e3411e5a2dbb434fd1ea107:

   ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check (2021-07-30 
15:38:11 +0200)

----------------------------------------------------------------
STM32 DT for v5.15, round 1

Highlights:
----------

-MPU:
  - ST boards:
   - Add coporcessor detach mailbox on ED and DKx boards
   - Fix dtbs_check SAI warnings

  - DH boards:
   -Fix some dtbs_check warnings: usb, backlight, hdmi

----------------------------------------------------------------
Arnaud Pouliquen (2):
       ARM: dts: stm32: Add coprocessor detach mbox on stm32mp157c-ed1 board
       ARM: dts: stm32: Add coprocessor detach mbox on stm32mp15x-dkx boards

Marek Vasut (5):
       ARM: dts: stm32: Set {bitclock,frame}-master phandles on DHCOM SoM
       ARM: dts: stm32: Add backlight and panel supply on DHCOM SoM
       ARM: dts: stm32: Add usbphyc_port1 supply on DHCOM SoM
       ARM: dts: stm32: Set {bitclock,frame}-master phandles on ST DKx
       ARM: dts: stm32: Update AV96 adv7513 node per dtbs_check

  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  4 ++--
  arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     |  4 ++++
  arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 25 
++++++++++++++++++----
  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |  6 ++----
  arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             | 12 +++++------
  5 files changed, 35 insertions(+), 16 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
