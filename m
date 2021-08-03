Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B814C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19AD2604AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 13:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19AD2604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOzJIL4JTP9QiA5C4F0LmmQsv4+1D4+TgBnIO+fG/+M=; b=0CDSrglpOE2kDO
	wOfg+HQOy2i9OTd9YmaSfkb6M4tQyYob6z7DBR6rbp9UROzJDQTiwiOFAXQ4IiSOPGVFUYoBU3g+F
	4biEUsgTnSPWSSAZn871/uSJNt20llPIsjWZoZ48twhyTtQFoiUga1+TrWjyZX+tn7o3sG0s22vFr
	sv3x1VUrr7aYC0c4jB/LaF5qqdMPY/fdYjApxvxHAVy9j5SNrHfHF+aCXVdWVl7pusa+cwE/H4Zor
	bW7mxPFqWxUrqUXzRVy7r5AfZH9059eQ34wDhdBmKsjTJcVRrAX+9MVblKW7f9v6OaZQKSf2i5tZD
	HlphreGkjJo4LauJ/m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu9c-002rbB-Km; Tue, 03 Aug 2021 13:08:22 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtnV-002j6o-QD
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 12:45:31 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173CXPvd016091; Tue, 3 Aug 2021 14:45:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=AJna003Q10W/+AZ5ZTjszT9vB3KIT8aQHPZsbyJWEzY=;
 b=naOxMYm5hD6lqgjZqsFvYW9rhjep8OPM28sij0ySA1tfS8KWfW2n3hrWXsvO+XIGp1LQ
 awccHXzS5ujkMhTTXg4Ys+bvqoG79kT7zgcbFudFpllczpxCi4I1gdYHv3PpbbdRTlY6
 HSB6LqK7BGf+lTgucJJgCdfgoUCPvKhHWe9LISUnAGaS1qetvOSbsvXkeZMlWtOV1QKy
 PLgHjOnmKbSfslVFMH9Y9U3KKqnD95yuSXYh8BYVLxDzexDOQha3IqRcDV7RPlgro5Lm
 7Ys3rcNJnEcx/bk842gnQ7491PUWAWfiRMLe5Fevpg0ksUYVfGVDN5UY0FW9e5w30Rkt ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a73jugr4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 14:45:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A841110002A;
 Tue,  3 Aug 2021 14:45:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99755222C87;
 Tue,  3 Aug 2021 14:45:21 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 14:45:20
 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <patrice.chotard@foss.st.com>, <soc@kernel.org>
Subject: [PATCH 3/4] ARM: dts: sti: remove clk_ignore_unused from bootargs for
 stih418-b2199
Date: Tue, 3 Aug 2021 14:45:05 +0200
Message-ID: <20210803124506.23365-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054530_205228_0EB195CC 
X-CRM114-Status: GOOD (  15.55  )
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
Message-ID: <20210803124505.905u-M9N3J3PbOHUJaxGDRQDMTC1y-qW1AcBgnj5LRM@z>

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove clk_ignore_unused from bootargs as it's no more needed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/stih418-b2199.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih418-b2199.dts b/arch/arm/boot/dts/stih418-b2199.dts
index 48c3c64e4c48..b66e2b29edea 100644
--- a/arch/arm/boot/dts/stih418-b2199.dts
+++ b/arch/arm/boot/dts/stih418-b2199.dts
@@ -11,7 +11,6 @@
 	compatible = "st,stih418-b2199", "st,stih418";
 
 	chosen {
-		bootargs = "clk_ignore_unused";
 		stdout-path = &sbc_serial0;
 	};
 
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
