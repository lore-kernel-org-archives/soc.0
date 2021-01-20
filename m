Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E811C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 865CC2343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 19:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 865CC2343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HLDvQZ+NNEm92TsPmUFA4U3X/0kXtb1VWVjx9sjb1Zc=; b=JmVfO67IAK71/rHcYfE2ojRpV
	5qANdSBMXCmG8/DD8aF5oqpzsW1X8dOb2bLteRsjcMtmDLRTmipv+mbJgUR/ngIebZOP6IUroclbD
	qIbRV155eutk1cB0CJ2Cv61LSkSIUvzYrPRx6C4FHU01tLQoj605758SSPJzh1jfJILA7qjLhZwvk
	YI2RHhQBOVA1lP+Idl7E/Zj+WP7zhXFk4+P6+bsWfrbUYMr8GfSN8cRmB+ECHCJ0LZkcJRs6t4v3R
	XfekbUL0dy5kmhDrqGT9vAdBiqokPoF8H17/iJw4l9nMJuYDLKjZl1ylCPVJlXXXBA0DdOS5UPIky
	+9GmfL5sQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JLg-0006l8-5X; Wed, 20 Jan 2021 19:41:00 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JLU-0006id-9e
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 19:40:49 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9D2F422F2E;
 Wed, 20 Jan 2021 20:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611171646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TUNEdX1xsXS+xaqEvGcbFxFXSQhaIVG++G28Ywp3eJM=;
 b=FBuXTD1dmS90BuqPQyyFO2hpk8Ww6JjN1cuCvjA+UcmF0vesXkG74WtaD0WY7K6qaazNdt
 zBMnBfdGs7yZa2s6tnysQhpTe/4OpCuEozzlsgRvUJ0b/Tp2gavEz1xrey5NN8c+sgDR6a
 xNth+PTuSpquIZ0vYk7Y6U8CFXcHiSY=
From: Michael Walle <michael@walle.cc>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: add Ebang EBAZ4205 board
Date: Wed, 20 Jan 2021 20:40:32 +0100
Message-ID: <20210120194033.26970-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120194033.26970-1-michael@walle.cc>
References: <20210120194033.26970-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144048_517408_8F258F01 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
 Michal Simek <michal.simek@xilinx.com>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120194032.Bk_w6gHN7cJ4am-HBsXSnrqkHOesqytGH23cyAl2Mcg@z>

Add the Ebang EBAZ4205 board to the Zynq-7000 board category.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 Documentation/devicetree/bindings/arm/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/xilinx.yaml b/Documentation/devicetree/bindings/arm/xilinx.yaml
index e0c6787f6e94..aaca69d0199f 100644
--- a/Documentation/devicetree/bindings/arm/xilinx.yaml
+++ b/Documentation/devicetree/bindings/arm/xilinx.yaml
@@ -22,6 +22,7 @@ properties:
               - adapteva,parallella
               - digilent,zynq-zybo
               - digilent,zynq-zybo-z7
+              - ebang,ebaz4205
               - xlnx,zynq-cc108
               - xlnx,zynq-zc702
               - xlnx,zynq-zc706
-- 
2.20.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
