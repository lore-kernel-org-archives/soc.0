Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51931C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143E3613C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143E3613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/vgIy2PglzRcbDGC76ZAqewQIZ9XDHWfllJKjFls1Fo=; b=DrXnyu8uJrMFQTdBlp+OWpr0k
	YaobnX9JGM3TXjiFHzvxsza1aek7DN8Gpb71Pp5rML2I05uQqM++Ow1ydrJAPs24cw54ySDAlWYo8
	JAq8ItkvNvfDzIEnbOz62ZYpV5ZOd+XNzq7gJaCp6o7ljYtKwAvN8UGbqpFZKJ+K43mq3IyLvDT35
	F7iOnsLj74Zyo0pZ61Y3Ge/dqR1GNmOyrKSMtEiY3OHzaY4ASaAtntSzXB1/aIg8HrmkSP5XiK2pd
	aqpQcMT5Kqi5/C58qJYl/zbYULPYnz2nqlnfIr27epL51KOiHjxM5Lsdu7x5SVGQ3kgfEyHQDqSHH
	ogPlYEPtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0ps-00GuG3-9U; Tue, 04 May 2021 19:36:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p7-00Gu9b-9I
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ECt4IwwEy7FG3zWZdqheu507ZfKamNdvmBcqaTIjkuk=; b=RXu1a+FFj8tFfJ4sR4K/+AzdrP
 VMHG3eqsTfl0KYVDRIaBeedklt9B1jsWAVu9WuqUHHA5/tW4ISnMlG89OMYke97Hydg/2zKLbik4C
 cxrzVD93KMNyKJA0/5FwTfuakkROHvJ03x0HOw+egnYvQzA3+y32G0/2rAMs9VCKCSFWCK85X6dFU
 6J9zBVTgeX9UzumdJofH6MNw72nfED/WSXOEMInYClAthFlikOxyvM5aTy/dkXakAE7RMuxaeunAV
 6QOSdL3pvDTUfib4WTQXR+ITAxePGUb1VFBzjgVI3SA2DEz4fR48jw6Wguor3MKkWAQLOs3ksBSF9
 KdK2Nv/Q==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p4-004DmO-Jz
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id d4so10639018wru.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ECt4IwwEy7FG3zWZdqheu507ZfKamNdvmBcqaTIjkuk=;
 b=Mxe4nYHFsLV8wxZ7XHXPTU3l0fP6YkdfwhuBUv43kA7M0CyJUV4vG21Mu3p7uOj3tw
 +gh9dqFTqYrJXuoXmQFolrLyaQ+5ytlgQPZlB59oisvqstBDT/3+HYY+oR0psZV0khit
 XufuwgIHLwkrhVjEwjg4HyKtovNKDOP90fSdgQfPLwWiB6y+8SrLTR2gGo/QJgVM1t4/
 UeOzKT5cNl1DWqQUCozBTY1z2ULnD55ptmj3HQbYMof6ybPwOYlK2kL8c8J/QKuMVxdY
 +P2KxqBmnopJWAYTTQrtB/3njPWqfuA7hdW7E5foU0VVJqS6bslake8/dnCenMPjxqjT
 Uq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ECt4IwwEy7FG3zWZdqheu507ZfKamNdvmBcqaTIjkuk=;
 b=JPWQuyBlJtMTgeyY526y/NTE3+GzJpExLh/+q0T1+xBTrpRSZIvtRk/qN8phg9uFla
 Q8vDKu6z/j5+GLbQ7X6K9JzZeqlcDPguB59HpMUCbthddhUfk7VTcHehPvQurF6NMHMp
 4TOvqYmJXN2tTSxDOv/kMNBeufDyR7NHOKExTuFtamkhwZSS6WvFyZ3Z9RQvgpeiRRCE
 gnDvkU/EDjelqcmwwmJeDtW/Ku6yKfKpdLWZXbI8i2B2+BVhlqadhKLlG1x0zY2VbcrJ
 dS9FntjaNEwqXRqzx3vLQylQQzZ6hHgU/fQEhrJ+roQMHzwPzjXFsIaoMB3wRLL1Ja40
 AR+A==
X-Gm-Message-State: AOAM531w7BvRODPmWrxnUVH1wy7R5SgOGwXDnUVnMEqUsFZA0oIHdREM
 FjgGOnLe1UFdG99iAC0KHAsSmg==
X-Google-Smtp-Source: ABdhPJwjwaW9YWol8TjtRGI9aOHMyyniv2xovQHdKggE5A/YFOemELHYW0A8a+iyWw3PG94j2veKtQ==
X-Received: by 2002:adf:f212:: with SMTP id p18mr33315887wro.120.1620156907386; 
 Tue, 04 May 2021 12:35:07 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:07 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/5] dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
Date: Tue,  4 May 2021 19:34:56 +0000
Message-ID: <20210504193457.4008384-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123510_688515_9A92359E 
X-CRM114-Status: GOOD (  10.89  )
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
Message-ID: <20210504193456.UV10O9aI_sf9irx0iF_X8TU_4UHivWwx60pgMEUlrUo@z>

Adds welltech,epbx100 as a valid intel-ixp4xx board.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
index d72e92bdf7c1..230bffeec0e5 100644
--- a/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
+++ b/Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
@@ -17,6 +17,7 @@ properties:
       - items:
           - enum:
               - linksys,nslu2
+              - welltech,epbx100
           - const: intel,ixp42x
       - items:
           - enum:
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
