Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B995C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 473532389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 473532389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/zfMzEc0+aOOf1gJHDEiwBWJwpYyAiZE5z9XqzaUaGU=; b=zhppwC0Z5cRPj/1EYjsVeDHxl
	N45Ptx/eONCSVhx7QsBy7H3nMpXSz+u3znpg2gTcHIW2q+Jsfy5uWm3PciOyYS1x1Z8w3PopmekFR
	49D7+aCgiaBY0kn2v4kdfQIQlGuT/LBWfUt+ZQznbh9cDG9jEXSv1sDw/OPlEoVr8xYj+4oxje++L
	7nJXE9C+0zCB945Ss1wI3VMH65tpBBajwiDTEYkak1qBWFteXLgwuLz165iX+KWPQsixM5ik8B9BN
	VVJucaWC0P+qf68WKneXGzZGuoqxfM1WjRrL1c6uaTVv3bY4Cf2LqZVBOgOYF4ozlQDEo7mS2h2oN
	RKPtuf0Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Qs0-0006P2-TD; Thu, 21 Jan 2021 03:42:53 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqq-00066x-Q9
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:46 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id CADF7E0A82;
 Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4n9HQ1RkZOpe; Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 91785E0AA5;
 Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id imcHLL4-8G53; Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 5C01CE0A82;
 Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 05/12] ARM: dts: mmp3-dell-ariel: Drop linux,
 usable-memory from /memory
Date: Thu, 21 Jan 2021 04:41:23 +0100
Message-ID: <20210121034130.1381872-6-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224141_016972_03CFB6D5 
X-CRM114-Status: GOOD (  10.53  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121034123.l0sBkQd-1pjYUe58pm1TEeof9pDTSRy7CKGXUHl04KI@z>

Drop the linux,usable-memory properties; the schema is unhappy about
them.

They've been cargo-culted from Open Firmware and I don't know what
purpose they serve. Perhaps they are meant to provide the OFW runtime.
In that case it's still okay to drop them from here; OFW is welcome to add
it upon boot.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp3-dell-ariel.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp3-dell-ariel.dts b/arch/arm/boot/dts/mmp3-dell-ariel.dts
index fe3b1cd695eeb..53714cb0d171e 100644
--- a/arch/arm/boot/dts/mmp3-dell-ariel.dts
+++ b/arch/arm/boot/dts/mmp3-dell-ariel.dts
@@ -26,7 +26,6 @@ chosen {
 	};
 
 	memory@0 {
-		linux,usable-memory = <0x0 0x7f600000>;
 		available = <0x7f700000 0x7ff00000 0x00000000 0x7f600000>;
 		reg = <0x0 0x80000000>;
 		device_type = "memory";
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
