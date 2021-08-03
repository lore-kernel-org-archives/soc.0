Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61446601FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61446601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWkqaqizZyGCWAe8ryVldJkcj7nEuA+IVfhGlGpr4pA=; b=LIfINRBR0jNLc8
	rgXTQ6P4mSg/q63DH9rp7XgWWWZfHfMMSr3kgHWZDprC1KfYX1+uCW3YpF7K7tFEUSwTCyx6XIaQW
	rERmmZi457wDg5UJnt+d6SEzMORIgW6nKsout1ThZwDh+Vtl+5hDzDIqszBlL7jXhlEizDHSt38b0
	NAOjvfbpGqYfDXZ/VZRlqYt9feS8cQsaUNA8pnfGUk/SrI15fRg4vUwXm5OTVxC4J5BzAxC0wQzGD
	jnL3NLgDHLe57gxzImkwqlSo9h8glwRFT39xWInFEbNCTdvxgZsNiZiB/pB9ml11FpVHVMWSCVWS2
	Ab5sgJdqqliKR1nb7FBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu8w-002rKN-II; Tue, 03 Aug 2021 13:07:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtnU-002j64-1r
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 12:45:30 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173Cfude029523; Tue, 3 Aug 2021 14:45:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=t33nap2m+wTs8JCQipvrVQGIr/dqZ3SB4X0QkZjBKfc=;
 b=BUoUMmLXE8nH1PLGUyilUAednM8S59P8TLA/a4paDd60ySqy7Iiv9p0mqoK9YJRmhZWD
 R0SMK00Mg9+nmt7sDFn9o5whY2WboRVVEMXkL0H9yzeWke14iC2K4KNl2FCnccMWhUB4
 s4FphflfWdqLxJxtiUxHljMgvUx6WD5BK5+H28jtr4+Fk1s03z/Nz+gOQRDOt2Snjqoe
 Sn+RKDniNMYgNr3WHwf7rvbcBJBJIE3zfqxHmnByOWf3SRABd3uIoPUYNDmCneUgOnlG
 CFM0KsfU3AVvVa3Vy4iUpdGVEaskEn4RD2ipDBpAbvIFcgfksmT/9XN1arHTLuuOzItK YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a70js1utg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 14:45:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AC87100034;
 Tue,  3 Aug 2021 14:45:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F30A222C87;
 Tue,  3 Aug 2021 14:45:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 14:45:21
 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <patrice.chotard@foss.st.com>, <soc@kernel.org>
Subject: [PATCH 4/4] ARM: dts: sti: remove clk_ignore_unused from bootargs for
 stih410-b2260
Date: Tue, 3 Aug 2021 14:45:06 +0200
Message-ID: <20210803124506.23365-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054528_441104_3F613FCD 
X-CRM114-Status: GOOD (  15.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210803124506.cBoNGTjwKo7XlmopO93i3bbGPd8ZXOczvvrK-QJoDVI@z>

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove clk_ignore_unused from bootargs as it's no more needed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/stih410-b2260.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih410-b2260.dts b/arch/arm/boot/dts/stih410-b2260.dts
index e2bb59783146..9d579c16c295 100644
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@ -12,7 +12,6 @@
 	compatible = "st,stih410-b2260", "st,stih410";
 
 	chosen {
-		bootargs = "clk_ignore_unused";
 		stdout-path = &uart1;
 	};
 
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
