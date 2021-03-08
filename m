Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55847C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1877865243; Mon,  8 Mar 2021 17:10:02 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB3565230
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDB3565230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f71.google.com ([209.85.128.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOK-0003L0-FV
	for soc@kernel.org; Mon, 08 Mar 2021 17:10:00 +0000
Received: by mail-wm1-f71.google.com with SMTP id o9so2284603wmq.9
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4pUbqXfXgnnLhDhksCamnOqM1YsLoMYiBC/1NCNg+0=;
        b=PoL+/gTY6/CICizebu/y3lywr4T0MbNeS6pbbkKuhkI/FgAgh09QGkm8FD1WAgyQJQ
         GFPKYKU8Mrsp0bqnHSLdG3wQokkZyOUu6akGKagBRbIzNHVxCrxrWTAVBllEWmu6e4uC
         XYXQ0iSU81u9w85DLe/F9w3y8QpfENN4GX/ap8/GMUYkpN0eh+16R4BNkyITn+YScTC7
         Df11Y5BLwhslVInF6Kocvmzkg9rZl3I5IYBaTl0bKsW49HB3sMxC4pi51Kc05O3ULIsz
         46pZlaUECZVsdgzDtmIh5Y+Ha8Lr0yuKGPt8D3TLKU9K4M1DRnwAcPID5yJzqQXvuLxH
         We0g==
X-Gm-Message-State: AOAM5325TTxrCcEzw3o0zHn5WCRw3z20rXz0cSNtD+VSkFbtDcyxh/pP
	huRieaaWY6OO4CjuSK570xQMa7rW5a5tuxf2jGvgfsoA2zzmpv6uZ/aFqwByajDc/N4QqvUmZwh
	DnWfkCPpj4/9p2kVdwWagan8=
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr23367774wmh.30.1615223400279;
        Mon, 08 Mar 2021 09:10:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDoAApcr5gaPCMJBgkDD5QBgXndL+LmIS5tK2e0cy377KXLKCREY1WOwOMtQJZ38tBp1Z3Nw==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr23367768wmh.30.1615223400166;
        Mon, 08 Mar 2021 09:10:00 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 2nd PATCH 05/10] arm64: dts: intel: socfpga_agilex: remove default status=okay
Date: Mon,  8 Mar 2021 18:09:40 +0100
Message-Id: <20210308170945.161468-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

New nodes are okay by default.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 25882faccbdb..f46d678ba775 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -472,7 +472,6 @@ uart1: serial1@ffc02100 {
 		usbphy0: usbphy@0 {
 			#phy-cells = <0>;
 			compatible = "usb-nop-xceiv";
-			status = "okay";
 		};
 
 		usb0: usb@ffb00000 {
-- 
2.25.1

