Return-Path: <SRS0=bhQt=S6=foss.st.com=prvs=8045eadff1=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA86AC433F5
	for <soc@archiver.kernel.org>; Tue, 15 Feb 2022 17:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91E3BC340F0; Tue, 15 Feb 2022 17:32:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86C07C340EB;
	Tue, 15 Feb 2022 17:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86C07C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FEiVYA025990;
	Tue, 15 Feb 2022 18:32:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=F6rUc9hOMUbQpXc1jEYThYaiazMN58gHQCMe4mmTPBU=;
 b=i49QnurfV0yV3jfZS1td2J8fJC6WAs6AFx/yno/V6+Nw8Mxc+ueUMPUcTnsYacd91Yr3
 o8VkxtYcyo6D4mMOfU1znVb5tjWY8320OcMWJMwx+3wHdlgrDApGdJXD2DALnHX4X5j7
 BnBARGNvpb/56iJ9oHX23+Ifqmtvp/MfT+ga4C+kjFK9bHUfAoiqZ4v+qXiSxmdy7nep
 eW5Jo4kSBs71otr3xPnqTyGwXQuLyrkROIyVIvps5BOGTSKp+CRP68dIo24jHvNWFLgt
 rBa8B/04VBwATbQZ9PXjq7zZ2SJS27hm+lHpWFlfkJ31WxE6XIA+fUHFEQC8mJ9M6vWU ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e89b5jt6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Feb 2022 18:32:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96FBB100038;
	Tue, 15 Feb 2022 18:32:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F541231507;
	Tue, 15 Feb 2022 18:32:28 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb
 2022 18:32:28 +0100
Message-ID: <f7d9ebf8-3f75-35bf-974e-a1a0651e8c63@foss.st.com>
Date: Tue, 15 Feb 2022 18:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@kernel.org>, SoC Team <soc@kernel.org>,
        "arm@kernel.org"
	<arm@kernel.org>
CC: Alain Volmat <avolmat@me.com>,
        Patrice CHOTARD - foss
	<patrice.chotard@foss.st.com>,
        Linux ARM Mailing List
	<linux-arm-kernel@lists.infradead.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT update for v5.18 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01

Dear ARM SoC maintainers,

Please consider this first round of STi DT updates for v5.18.

Thanks
Patrice

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v5.18-round1

for you to fetch changes up to 44d5061fe2fd31928fae4c5a5623c0365f60e2d0:

  ARM: dts: sti: move usb picophy nodes out of soc in stih418.dtsi (2022-02-15 18:08:55 +0100)

----------------------------------------------------------------
STi DT update:
- various DT fixes to avoid warnings when build with W=1
- DT clean-up

----------------------------------------------------------------
Alain Volmat (7):
      ARM: dts: sti: ensure unique unit-address in stih407-clock
      ARM: dts: sti: ensure unique unit-address in stih410-clock
      ARM: dts: sti: ensure unique unit-address in stih418-clock
      ARM: dts: sti: move some nodes out of the soc section in stih407-family.dtsi
      ARM: dts: sti: remove delta node from stih410.dtsi
      ARM: dts: sti: move usb picophy nodes out of soc in stih410.dtsi
      ARM: dts: sti: move usb picophy nodes out of soc in stih418.dtsi

 arch/arm/boot/dts/stih407-clock.dtsi  | 101 ++++++-------
 arch/arm/boot/dts/stih407-family.dtsi | 262 ++++++++++++++++------------------
 arch/arm/boot/dts/stih410-b2120.dts   |  16 +--
 arch/arm/boot/dts/stih410-b2260.dts   |  30 ++--
 arch/arm/boot/dts/stih410-clock.dtsi  | 100 +++++++------
 arch/arm/boot/dts/stih410.dtsi        |  52 +++----
 arch/arm/boot/dts/stih418-b2199.dts   |  22 +--
 arch/arm/boot/dts/stih418-clock.dtsi  | 101 +++++++------
 arch/arm/boot/dts/stih418.dtsi        |  38 +++--
 arch/arm/boot/dts/stihxxx-b2120.dtsi  |  22 +--
 10 files changed, 351 insertions(+), 393 deletions(-)
