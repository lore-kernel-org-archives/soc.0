Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A6EC433E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E822389A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E822389A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ps3fUc7G3BVbeXafoCyMABwRmz2DvmPpxQpL1emNu0o=; b=b0frzEHCkHcsNRf2TCO+m/oUK
	JGDYo9VcAMo47qlb9PaNN2O8/fI05ky//kCE4aVds2vK/vPar+qg0UllpkPSAJ1Ch+PNDwpvAIYbS
	+67jWA/5qf3X+FNH65CUz8z3sigknRVpMdVhLDKo9ymVL0qxSYiwVjG6LU9ZE49qYahR3LZ8b2Tbo
	gcvVkrmR6Yqj+EZHE6fyXI3cbNy9tGA07QUWK5O3oVtLQQ2KEMhST0pXil1dAYcjTdWQEsHOAUSM8
	58Zw4YScRkvdg+ik5D0IWw03YwFFQeBGr7GGyea8RMeBS68AYOSsj3d0DhbFbaFdLxIsUhVlfKZTF
	YdkcYHmog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2QrF-0006Dk-HN; Thu, 21 Jan 2021 03:42:05 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Qqo-000659-TU
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 03:41:42 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 4E37FE0AA4;
 Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HsLto3Ueifax; Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 0DF9CE0A82;
 Thu, 21 Jan 2021 03:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1CLtL-kJSw_c; Thu, 21 Jan 2021 03:37:40 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id CEB8BE0AA5;
 Thu, 21 Jan 2021 03:37:40 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Subject: [PATCH 04/12] ARM: dts: mmp2-olpc-xo-1-75: Drop linux,
 usable-memory from /memory
Date: Thu, 21 Jan 2021 04:41:22 +0100
Message-ID: <20210121034130.1381872-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_224139_138968_A61A16DA 
X-CRM114-Status: GOOD (  10.65  )
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
Message-ID: <20210121034122._j15MGPN1U0Nhe-vTdLqr6-qr3zd8ydle__DaTQd0dU@z>

Drop the linux,usable-memory properties; the schema is unhappy about
them:

  mmp2-olpc-xo-1-75.dt.yaml: /: memory: False schema does not allow
  {'linux,usable-memory': [[0, 528482304]],
   'available': [[847872, 519245824, 4096, 782336]],
   'reg': [[0, 536870912]], 'device_type': ['memory']}

They've been cargo-culted from Open Firmware and I don't know what
purpose they serve. Perhaps they are meant to provide the OFW runtime.
In that case it's still okay to drop them from here; OFW is welcome to add
it upon boot.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
index e16171ddd93ec..0f8b5ad48deed 100644
--- a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
@@ -33,7 +33,6 @@ framebuffer@1fc00000 {
 	};
 
 	memory@0 {
-		linux,usable-memory = <0x0 0x1f800000>;
 		available = <0xcf000 0x1ef31000 0x1000 0xbf000>;
 		reg = <0x0 0x20000000>;
 		device_type = "memory";
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
