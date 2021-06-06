Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20C2C47096
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39DA611CA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A39DA611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MpZiaWa+o2gLDmnGEqUvrDBCua4j9HNd1Wo+/85cN0=; b=qgXKZ9Tt9mK0B4
	qQvhbAahn18iQ7+qaQV/j8LG2a4DK3waH9jSNongVvi+COag1oRQeWaV0j/JZ4DrEyaClT/765oAd
	anBUBHRU2+ZprvmURRjwho0UR0/z4I67dF8BQNmZ6kUOFEV7ltkThRuAeFUI34dFKRvtpZ+wiEmIa
	Zw2jWYM2DZUvBM4r7gO49thJ5ew00ye9RRxGtOpXvVavv+qzHZKEsUP76BGSPb79fvpZOFInjuH7P
	Xj/ccK/zNRjcKfZouMka5s0TtzJn53Sd45z4p+tulOeDOgvG4xAHOtsSLhKdv8m2RHrq1TJc/1AbQ
	UvSiaYPIJapQzRsmyKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lprip-000EBE-EU; Sun, 06 Jun 2021 12:17:43 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri2-000Dzw-Nj; Sun, 06 Jun 2021 12:16:56 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBlpC-1ldicJ2LKG-00C9pI; Sun, 06 Jun 2021 14:16:35 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 4/7] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to DT
 schema
Date: Sun,  6 Jun 2021 14:16:14 +0200
Message-ID: <1622981777-5023-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:cVfJsNfHgKU+HrX1Rd1+afRjOiBINazQoXGANvMB0aZbjGuQPLP
 tnJBRpYd6LOnJxUZ+JIbgxx68zrfem/FCkflXR9DGRSr47xAuwXvbhBOrDqqyr2MfIK5Jch
 XsO5Y+x16L1NacsMDCiqSvFjdsaxCU9eBlllAqsIvMqyHb/c12T8ItlBMdW6H3xqtANbTf/
 m4DWBRUBZO9Wjlm6bsq2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mWXsb6CCr94=:ZVJWJtVEi2BqtnJgmRV4bH
 1Jk/5OHS13vu9mlqWJu1kOs2xQ7TIEdpFEwWAskPBmiGK44wRzyfV4jiYCAu1ETfePIY5Tu9M
 xNzn/Y3fCQFYYXLxd0/wwiMwmi9BBwgAQlAQc4Cjl5H4yOhZQsPKYgg9ctUnyFsTj2FyUh9N9
 soPWFTwcTmqZUwlJjU6ti48pETg88qDkjZcd5z/nJjvhZVssIoA5FkMPDEQfsdwdvHW1rYt7l
 ttn12espMb95Y1r1dPjaDRNSlP5iBQowYJRQd43hoMGZgZxgdSvPBDvz1DU+e+cburLkh5K20
 UJKj4vEe9FzOxFTfltEkQY47k4xeqEEcZCuxD3HSFpWmdct4nyWSOb86PAds3SMyumxrWwWvT
 Nm2fM5yI7NVSbpsNU0LZiw64GJO2nHbza1QET7iku8cOZZhNq67wjPXUoTiAM4UjwEwXr3wAK
 10hRXkJNNDsjw7oN2GBvptb+yez942bzL1N7l3jxV4T1M6Z7zx0WspHsmNi10ItJO83/YZzU1
 5aLRamq6ELMrhBztXS72ZY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051655_102352_F98C957C 
X-CRM114-Status: UNSURE (   9.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606121614.zivYl-zR2AhHz51r7s9lUjwobFSDsBu-F--FqmDcNrw@z>

Add new Raspberry Pi 400 to DT schema.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 812ae8c..230b80d 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -18,6 +18,7 @@ properties:
       - description: BCM2711 based Boards
         items:
           - enum:
+              - raspberrypi,400
               - raspberrypi,4-model-b
           - const: brcm,bcm2711
 
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
