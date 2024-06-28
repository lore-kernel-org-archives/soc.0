Return-Path: <SRS0=KOMS=N6=foss.st.com=prvs=790927b5b1=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A5C2BBCA
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 08:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2A3AC4AF0B; Fri, 28 Jun 2024 08:27:13 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DAABC116B1;
	Fri, 28 Jun 2024 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DAABC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S14fSc023109;
	Fri, 28 Jun 2024 10:26:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=0+QQHGV3+UyhPl62xrtyxM
	d89OJfO/01eA8mRA77fAE=; b=vnXl4FVVH6pd5Y7lyRHJTnqCJm+/tsXV1lQpqj
	IxD0i95BXdMndTUG42oAflANynoD+DhBUYKBYZQneLg1qs5iiEncB7/ja7w7WB8y
	C67nVNfUCi/dt09oY32v220bnjkhYImR/kxqmbhpAU3at74EIAiNQu+1IX8dZvRY
	2ZDKDR4/iXCTElJ5yJMgaxZfIhWPkLvI3WIW3/Pj2u18hIyxHpium2jaqFMTjQ3N
	u5TFYmSeu8cLDD94lRV40wrvBge7g0zT3EzsUrGu9s8FEylfqvKQ7pI67EyvOnSJ
	tnhH+Dgd6unBAqN1JsgnCR90UqIcmhnVj8OxYCVCMUlENe9A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjpbjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 10:26:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5790E40046;
	Fri, 28 Jun 2024 10:26:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 072A8216608;
	Fri, 28 Jun 2024 10:26:26 +0200 (CEST)
Received: from [10.252.9.143] (10.252.9.143) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 28 Jun
 2024 10:26:25 +0200
Message-ID: <9bb7a807-358d-47ac-a4a8-674720bcf2a6@foss.st.com>
Date: Fri, 28 Jun 2024 10:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        olof
 Johansson <olof@lixom.net>, "arm@kernel.org" <arm@kernel.org>,
        <soc@kernel.org>
CC: Raphael Gallais-Pou <rgallaispou@gmail.com>, <patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.11 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.9.143]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_04,2024-06-28_01,2024-05-17_01

Hi ARM SoC maintainers,

Please consider this first round of STi DT for v6.11 cycle

Patrice

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git sti-dt-for-v6.11-round1

for you to fetch changes up to b664f6f7a77a41b0e8da7e12534debc94c9d23db:

  ARM: dts: sti: add thermal-zones support on stih418 (2024-06-28 10:17:22 +0200)

----------------------------------------------------------------
STi DT for v6.11 :

_ Add #thermal-sensor-cells property on stih410.dtsi and stih418.dtsi
_ Add thermal-zones support on stih418
_

----------------------------------------------------------------
Raphael Gallais-Pou (2):
      ARM: dts: st: add thermal property on stih410.dtsi and stih418.dtsi
      ARM: dts: sti: add thermal-zones support on stih418

 arch/arm/boot/dts/st/stih407-family.dtsi |  6 ++++--
 arch/arm/boot/dts/st/stih410.dtsi        |  1 +
 arch/arm/boot/dts/st/stih418.dtsi        | 42 +++++++++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 5 deletions(-)
