Return-Path: <SRS0=n51u=57=foss.st.com=prvs=03985e4a13=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A61C61DA4
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 13:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 617B0C4339C; Fri,  3 Feb 2023 13:52:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2609C4339B;
	Fri,  3 Feb 2023 13:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2609C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3139qVaY027466;
	Fri, 3 Feb 2023 14:52:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=EtzfbCcxs7p5/EFbhCYEbGjaWt4NbkR5NejH+c79F70=;
 b=cEkf67PLn3yKqq232Cve7rKdxXKPHiEDNoaOwL2HnrJjinWz7gOyclNtOeKqtlMBaJUn
 qTyjYwdOncfeyfnROaFo4k8/ljSdecqWwQK8dvwd3ZBmqEjgfcfxw1r+Iz85DFw6APPX
 Ajgw4XNOpmtTUQJs1V4JOvhuA9aOw6zF4XtcmSDnX8DNjOv9VAnnZqiJIOSdmU5SMYbq
 oHSNe/N/k66kVHhVm2liM3U3nsEm1L9wKJRcsSiaF8CGPNcsf89DCW7fm9RZtws+SGCj
 wpi528hRhgU1Ofb5XGxvNS4w25Xv/v2YHebrI/TV670bEf4w7lRNDiWE2qNAdblywaz5 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfny5f8ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 14:52:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A572510002A;
	Fri,  3 Feb 2023 14:52:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7739E21862E;
	Fri,  3 Feb 2023 14:52:10 +0100 (CET)
Received: from [10.252.18.17] (10.252.18.17) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 3 Feb
 2023 14:52:10 +0100
Message-ID: <8e05c729-89bc-20f3-acf6-096fb85d7e36@foss.st.com>
Date: Fri, 3 Feb 2023 14:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, kevin Hilman <khilman@baylibre.com>,
        olof
 Johansson <olof@lixom.net>, <soc@kernel.org>,
        "arm@kernel.org"
	<arm@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [GIT PULL] STi DT changes for v6.3 #1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.18.17]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_13,2023-02-03_01,2022-06-22_01

Hi ARM SoC maintainers,

Please consider this first round of STi DT update for v6.3.

Thanks
Patrice

The following changes since commit 6d796c50f84ca79f1722bb131799e5a5710c4700:

  Linux 6.2-rc6 (2023-01-29 13:59:43 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pchotard/sti.git tags/sti-dt-for-6.3-round1

for you to fetch changes up to 4722dd4029c63f10414ffd8d3ffdd6c748391cd7:

  ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port (2023-02-03 14:41:50 +0100)

----------------------------------------------------------------
Fix polarity of reset line of tsin0 port for stihxxx-b2120

----------------------------------------------------------------
Dmitry Torokhov (1):
      ARM: dts: stihxxx-b2120: fix polarity of reset line of tsin0 port

 arch/arm/boot/dts/stihxxx-b2120.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
