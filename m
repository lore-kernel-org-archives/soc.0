Return-Path: <SRS0=3x1w=F3=foss.st.com=prvs=8650ac4076=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B30FCDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 07:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00094C433CA; Fri, 13 Oct 2023 07:58:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43C1BC433C7;
	Fri, 13 Oct 2023 07:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43C1BC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39D310oR011064;
	Fri, 13 Oct 2023 09:58:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=selector1; bh=VtaROO0xyCAbWB6ZaKUh
	aDmUfXST8mXSRgk3vcmOUvs=; b=bGkNZ5pzA8ZpKzCw0Niuw+ht/0+pv6yYK7R7
	Rn0JYIofWSYkcuFrRDHzzqKYSWlBRJczDHWB0pl3RCO9QC6nAir1QlR6ecFAAbBX
	hMcHTbej70e8J5dZxUh9cgoinlSsW2/14ZabOojfk9JBT7nYZk5UgAyRbpHuNxEB
	L/gJV3K97K/RRyn1qgX6XvHI7Mj57fXTE47imf7oyw0RmOYOlAg1wbXE/vVmmgsl
	DvSQD2JPIgXooQzsoCqlkwRwnPO6C9wZ7Q/G4vgGdQoN094bH5KROlBPXJbludUs
	vLEIsAaSUm9J6+/IGfdELPQToQafTMz7B9BDZQ3vp5d6tCDYHw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhjgqdr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 09:58:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53F2910004F;
	Fri, 13 Oct 2023 09:58:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C7B620F548;
	Fri, 13 Oct 2023 09:58:34 +0200 (CEST)
Received: from [10.252.11.99] (10.252.11.99) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 13 Oct
 2023 09:58:33 +0200
Message-ID: <e6b975f2-9936-465a-8253-6fcead974006@foss.st.com>
Date: Fri, 13 Oct 2023 09:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        olof
 Johansson <olof@lixom.net>, "arm@kernel.org" <arm@kernel.org>,
        <soc@kernel.org>
CC: "moderated list:ARM/Microchip" <linux-arm-kernel@lists.infradead.org>,
        <patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.7 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.11.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02

Hi ARM SoC maintainers,

Please consider this first round of STi DT for v6.7 cycle

Patrice

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-v6.7-round1

for you to fetch changes up to b2e847012cbc5476b0fa93351f74ea623e43e9c8:

  dt-bindings: arm: sti: add STi boards and remove stih415/stih416 (2023-10-13 09:03:51 +0200)

----------------------------------------------------------------
STi DT for v6.7, round 1 :

stih418-b2264: leds and serial fixes
stih407: drop max-duty-cycle property
stih415/416: remove boards from yaml
stih407/410/418: add boards to yaml

----------------------------------------------------------------
Alain Volmat (5):
      ARM: dts: st: correct serial alias in stih418-b2264.dts
      ARM: dts: st: move leds out of soc in stih418-b2264.dts
      ARM: dts: st: correct led level in stih418-b2264.dts
      dt-bindings: soc: sti: add STi platform syscon
      dt-bindings: arm: sti: add STi boards and remove stih415/stih416

Krzysztof Kozlowski (1):
      ARM: dts: st: stih407: drop max-duty-cycle

 Documentation/devicetree/bindings/arm/sti.yaml               | 23 +++++++++++++++--------
 Documentation/devicetree/bindings/soc/sti/st,sti-syscon.yaml | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stih407-family.dtsi                     |  1 -
 arch/arm/boot/dts/st/stih418-b2264.dts                       | 16 ++++++++--------
 4 files changed, 69 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/sti/st,sti-syscon.yaml
