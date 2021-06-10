Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59229C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:31:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28274611B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28274611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CB8E8OsNznZCAYGQF5TRl5j6cAnezx/JVutxy7indmQ=; b=jbBkBaW7Xz7zvV
	xqGvwPLsFEh4g0T+MezwQPv96Xr0QWpSDY6etyEZCq1TV0OaihG/HykXGSvXHe/ujmPlLevlLcrb6
	mi2pYOYrAXTAcCPwCT/SaloTN4LFlVIFJaru+pU2T18IN5xQVJWY15eSkdILS9XxchgSxfaA2OLRh
	Fq5sb3jq6XDulSgT1yZ9bLdaM8TrLEb0z2pY8uHT7dw+iJqyCoAduVcPS42ZqBJnm24OgaCbNAkRt
	bZ6jKZclCLoANyxht6QqTkPeapLo1830Bk5kmd4k0EXtSmxryIZz7qpVkXLfDRup0tERnLTat1C61
	mylZ8OCZnADBSHJjB2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU7B-002tMP-MC; Thu, 10 Jun 2021 23:29:34 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU76-002tK9-IN
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:29:29 +0000
Received: by mail-wr1-f48.google.com with SMTP id m18so4041616wrv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
 b=Eq89jfHz5HtM/LYs41rCP41gcszr+5aevF46W868z1ggqWA7F2YEIbtWSBnz8t0fOb
 G5WKgiPzhOkWyom+ib0Q48I5t+kZYmWkM01ILBhz5ooilZCDOQ6fDUQI0C/CRGX1Fevt
 WK/MRIQOWUbg4yy1SFOB/Bs2aQwYzsopQ3ULXUwROcnkRK7HCB+JjAry/wYP99GgoyW0
 cwJRLfVel4p5nK31KDMlW2Sh5Qmhag7QVxJ3c3WjnYNI4yvk1PE0SWH39XfgUL+rOTfY
 iWOJlv7ngdCWc80UXbPKAwMAX0s7/Cik774swDTXSOXV5IRmoT/ZQycXo6PYKuWaC53/
 yYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
 b=ck0e21vt4YkysNi1pgfmbDJb68M96+PvDbyJEO1N1rCHrUqw1RMP++Z9GpAqHbMQ2K
 ECC+w2AWz0S8nfr83rMTrozOzD/ojo1V8cwRowSGtz0unAkzPtllfeFYhnzm5Ml941SI
 iOFtHaSxYgxR9wJ+eFV66zXd1MZEL+VXHtehwH574I/Ov/NPHjmJOPl+GlFhACQfzvh6
 UkufkI35/rkSNB/sTpwymz5Dv7LUKkm5TH7agvjSS9RT8yj1FoUxy9fr3cL5stQbM2Is
 slS/w2R3YmvjIC1gr/Mpp0Ir5BnDhvG85WeGx/Gz4ZhaXZe8L6JtU3JEaRDIB0Kr5Juq
 1EeA==
X-Gm-Message-State: AOAM533ysGVs4l6gQKeQlcBJGr3ITCVByiIFzRqiS4IQvdiSQhBOnoZD
 gxtG66sCqJXFMS6e2DEvbmRGZDhZpqk=
X-Google-Smtp-Source: ABdhPJzkq1CzfZQJ8JofM0yC65tXnI8aWTVOPbJZPZymMPGbOqTy3A8A+IWO3hilqAsMDEWhYfPW0Q==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr820358wrx.102.1623367705704; 
 Thu, 10 Jun 2021 16:28:25 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id d13sm3196182wrs.41.2021.06.10.16.28.25
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:28:25 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri, 11 Jun 2021 00:27:13 +0100
Message-ID: <20210610232727.1383117-2-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_162928_642632_30BF5AB5 
X-CRM114-Status: GOOD (  11.79  )
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
Message-ID: <20210610232713.g8jty6gCCzE5874XaQHkurzNe4aXnyNlaF_nVbIId2U@z>

Add bindings for the Meraki MX64/MX65 series. Note this patch should be
applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 78dfa315f3d0..7d184ba7d180 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -62,6 +62,12 @@ properties:
           - enum:
               - brcm,bcm958625hr
               - brcm,bcm958625k
+              - meraki,mx64
+              - meraki,mx64-a0
+              - meraki,mx64w
+              - meraki,mx64w-a0
+              - meraki,mx65
+              - meraki,mx65w
           - const: brcm,bcm58625
           - const: brcm,nsp
 
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
