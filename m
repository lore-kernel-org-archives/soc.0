Return-Path: <SRS0=CwTY=KG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDC3C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 10:48:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A912761927
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 10:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A912761927
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZS5i6D/TmJFdwKPQwYZ/C3EhfB6l02PgMBPYNUMygGc=; b=YUsPsFKdsGvbovtd3cM3wOh8Z9
	/JqgcHETC8M2gfYwtJmCYSBmE5l0isq6x/TfhymetmxwDknCfcy573zgOfM1uxHaSFUdChLITdeuC
	KmyJjTTGe4UC1BRYAk4p5QJmNKfFxb4o00AWYEnzIxVz0JvJWMK36UYXvw/676wH4nIdOyFixx7Ht
	LOxHPLnNv/0dODY3Zv/SZA0uEveRbnnJ6XUy1m1lDkBY8l7DdB2IoMeFXkGEcx6ELjMjzjXIykl58
	dHi876PDO/WZFqeXGfmGj39mr8G/L874e7lFaVGQrbgtvv/hU5uiNAA1Gp4LDTJ3Idv/TclyftVhD
	CuS7BO3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPuX-00H0Mw-Qj; Tue, 11 May 2021 10:46:46 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMZU-00GU0M-L4
 for linux-arm-kernel@desiato.infradead.org; Tue, 11 May 2021 07:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=5MsAqf9rjFCNNwfhYudK0v6/Lwf7yjyUGC8pEH/Z8uc=; b=t7vnbh963rIZKTBRDyo1BRxEmU
 E46kxGDouzirVGYEI+eJU972MpROXXOIBEIM+tYOndYG+B9/pvXyQoLwV4BwdyJqdf/WAPWDiivpb
 HrPCgPcGX1WDX5SvjsLYuXmRqsz2M8q78hn5v/BwUx4YucCRY8h7jA6rL96eQxPNFYz5xZk4PHM6Z
 /r6NS7FkuSA9Ns2j+sYozbEe6JukzG5683m3IvtQqu1xsiWUSYwLmW5OjOpP2QXfYQee4rPCo7tsT
 4sKF3rd+OD4abVX3yyi+LI8rH7BXonfLzPKYzL0KDeEReVPHBhoq6w6aQwUDMeOOMq2iIFkNwDDzZ
 AkgSWexg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMZO-009M2g-Dx
 for linux-arm-kernel@lists.infradead.org; Tue, 11 May 2021 07:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620717162; x=1652253162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
 b=k4+8fgRM2DNUCT/fQbyOydoMMqaZIHutlFZmxLqetMMZKxj7U6WHYwKo
 jo5sEld7ciXC3La/4VIOLixjtd4Z++SMsvBVabHiQmQ7mbvozouWMLT3O
 ABrw9PmgQq5eIEZaY//G0h7i7dHpAybQKKdu84hK5t/uw7Yv0EwdQhgOV
 g/VUQGXnaSiQip2DUkaD1KYJidYKciKlWni5lIOYp/hzZgVy6vii/rJiC
 gGfITzWDCKCVO6exDK8KLQiV03OQiQInKVppgm4JUvGXcGrcEXBiNNwGs
 IMQG8nmhJiOjZU+zjcI9G1n60C4xZNXujdOnoaXb/B1MiDzFwHG9SHTWC A==;
IronPort-SDR: U1wcL16wsUcFPGnZ+c2LFMisb+Y0E+3rqgCPM/aSODXfWAAJ/O4hqnh6Dlb6GtSJzMV9Tem+j1
 1CG6q4BcCf3QKpF/vt89DI6OjhNOkOFRVjhzqA3w4pMNHWtGzivgmx7eHzSKGu8lqXhr2/OYFj
 hIo4blqIl91FUgYbLRQQ/jJHp3DMqadRQaH+4WCPKyCJVbroZEtisXJzEsLuNv8k85pO1s05YN
 6hI5KTz91/p0bV4V5499ZwFnJxIBNAqliTofX/2rknWbaZDAFoioMmjP7lM4Fpk8axFoMWL0SU
 ZKc=
X-IronPort-AV: E=Sophos;i="5.82,290,1613458800"; d="scan'208";a="121163380"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 00:12:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 00:12:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 11 May 2021 00:12:33 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Tue, 11 May 2021 10:12:20 +0300
Message-ID: <20210511071223.71379-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001242_518392_0966ECF1 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001242_518392_0966ECF1 
X-CRM114-Status: UNSURE (   3.48  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210511071220.3fWnXq_yxW17ip-Ow0jWSNg7GQIYp1Li4kyg8JnWP24@z>

Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 6fc5a22ad962..fba071b9af1d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -145,6 +145,11 @@ properties:
           - const: atmel,sama5d4
           - const: atmel,sama5
 
+      - items:
+          - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
+          - const: microchip,sama7g5
+          - const: microchip,sama7
+
       - items:
           - enum:
               - atmel,sams70j19
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
