Return-Path: <SRS0=tnVs=M2=foss.st.com=prvs=28490fd7ee=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916BAC432BE
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 12:45:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65C3760F94; Tue,  3 Aug 2021 12:45:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA24D60F58;
	Tue,  3 Aug 2021 12:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA24D60F58
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 173CVPsG006658;
	Tue, 3 Aug 2021 14:45:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=SxjmlgjZIeZyGGpM7p5YTE2fctkmpue8VWW/bRT6hKs=;
 b=twqFbzRcpRv+m6Jn/oOf2udthohO7+dQNgdRfCaW1LAa7UrFk281VrJxF0KD12qP/2ai
 4ytzDFP9VoBkyd1vWbvTMfCSbdJ5s45Q1sXECy3sqDB6Qdm5Phz4SW5vbJfGNHS6nLQH
 9OrqAPfAs8vf7GYa54gwI+SJmURpH2zfMiv713OeyWJ+4G621q/okcoTpeWmcCKN516d
 BQx2M6GGIgDRflHs96Z75V8qk32Nux20nGnqugWt0DowUVsuvxSufKDTRjWKS8kz4fu2
 Z2i8PpB0+1Rc3xgffjvfv2DnspHibfJYQo/YUHc4ZxfetMejm2BOTWV7iiCLuqE1ciso 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3a6tqkkahb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Aug 2021 14:45:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB78310002A;
	Tue,  3 Aug 2021 14:45:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A2E1222C86;
	Tue,  3 Aug 2021 14:45:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 14:45:16
 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <patrice.chotard@foss.st.com>, <soc@kernel.org>
Subject: [PATCH 0/4] ARM: dts: sti: remove clk_ignore_unused from bootargs
Date: Tue, 3 Aug 2021 14:45:02 +0200
Message-ID: <20210803124506.23365-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-03_02:2021-08-03,2021-08-03 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove clk_ignore_unused from bootargs from STi boards DT.

Patrice Chotard (4):
  ARM: dts: sti: remove clk_ignore_unused from bootargs for
    stih407-b2120
  ARM: dts: sti: remove clk_ignore_unused from bootargs for
    stih410-b2120
  ARM: dts: sti: remove clk_ignore_unused from bootargs for
    stih418-b2199
  ARM: dts: sti: remove clk_ignore_unused from bootargs for
    stih410-b2260

 arch/arm/boot/dts/stih407-b2120.dts | 1 -
 arch/arm/boot/dts/stih410-b2120.dts | 1 -
 arch/arm/boot/dts/stih410-b2260.dts | 1 -
 arch/arm/boot/dts/stih418-b2199.dts | 1 -
 4 files changed, 4 deletions(-)

-- 
2.17.1

