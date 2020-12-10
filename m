Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04019C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A847022D5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A847022D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NUuXDqPwCCAni6krf0Gil9PGYr+GaGazbKzyRnPmjGg=; b=Ua6BKOE6Oep17uO6kci5wnNKm
	6fKH3UWG30ZKhtldvbd/to4/U0HLbXiYisQwQYWj0WZNSsFD2glrD96bP0v58a809M8Ao2IHPjyKQ
	/wiDhR7tvxt98PlHxa6Tj+yokbBtpycmhm0FW3P7tUR7er+qMn5FXQGqqH65HqsnspRT1kJJDCtXz
	+UsMjSgVWSePWI9majDtyr9ICCnb6sKpw6oab6UCBz1Zbk9dKExwiNHLCV0cRdq4oQrGnChNTOpFH
	m+Tpo+tjaY2M/gON3egKHTVN04+19sLeDrowQJLAwN4Mre0i8ibO6OD44ONChd69WWr/h+IhZoK6P
	3Osys9q7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knSA4-0001gL-4w; Thu, 10 Dec 2020 20:03:36 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knS9t-0001eL-Qy
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 20:03:28 +0000
Received: by mail-oi1-f193.google.com with SMTP id k2so7096290oic.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 12:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYT6D6yOTVKMl9lCBQT5EHKzZ4TTN7Y8gqIdAhxWbzU=;
 b=Y3IxKoQrcwQfQ9wMIfxBxzeg/TZi+IOnPBQ/uXnk6wwTB3qC1fB+c3PTxYLE5NUGC8
 m/83gNQ8JJlUWCl2NmhA3veRfaS/qrgC5pDRHKM8SCnKuDAlRryLFUSoO3+SEi1bA65P
 61EozuNEjn4J+YWhrY6Soa9vXvqqrBVKEyi8uN1MMza1MoZyfm3YZjxoDa6t+mModoEo
 Im4wJ9ldTcNjyFkXYzDviFszo/aOhtphmdMFFN4VzKB7rNIMVWBD0HYNsxmKxsG41W8u
 TBCnVVDRKjTgntRDJ3KMbC2UCLAzyw24lhVfKgyqgvZZHvbpZ4fj28j84VqIa2EkVADh
 AuXA==
X-Gm-Message-State: AOAM530wUceeYRtk2/8xN6EW3U3ns96raKUt0s2lqCzHZqjTrKEONqbI
 LJbtTuS0ZHaYeWQu4GlWwQ==
X-Google-Smtp-Source: ABdhPJxZ/fKWmJZJ0n2BGw8t4WfwQQfcXvuzPetiSTDtYG86R1HrAOQX1YNSu6f3c/T+vqBwQMbyaQ==
X-Received: by 2002:aca:2418:: with SMTP id n24mr6393172oic.62.1607630604964; 
 Thu, 10 Dec 2020 12:03:24 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id o82sm1220636oih.5.2020.12.10.12.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:03:23 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, soc@kernel.org
Subject: [PATCH 4/4] dt-bindings: Remove PicoXcell bindings
Date: Thu, 10 Dec 2020 14:03:15 -0600
Message-ID: <20201210200315.2965567-5-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_150325_980108_B671EEB2 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210200315.4TOXv55XapHu4QoakECX6qtPZHgTYgmEOmFCUZ7WlM8@z>

PicoXcell has had nothing but treewide cleanups for at least the last 8
years and no signs of activity. The most recent activity is a yocto vendor
kernel based on v3.0 in 2015.

Cc: Jamie Iles <jamie@jamieiles.com>
Cc: linux-crypto@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I'll take this via the DT tree.

 .../devicetree/bindings/arm/picoxcell.txt     | 24 -------------------
 .../bindings/crypto/picochip-spacc.txt        | 21 ----------------
 .../devicetree/bindings/net/macb.txt          |  2 --
 .../bindings/timer/snps,dw-apb-timer.yaml     |  7 ------
 4 files changed, 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
 delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt

diff --git a/Documentation/devicetree/bindings/arm/picoxcell.txt b/Documentation/devicetree/bindings/arm/picoxcell.txt
deleted file mode 100644
index e75c0ef51e69..000000000000
--- a/Documentation/devicetree/bindings/arm/picoxcell.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Picochip picoXcell device tree bindings.
-========================================
-
-Required root node properties:
-    - compatible:
-	- "picochip,pc7302-pc3x3" : PC7302 development board with PC3X3 device.
-	- "picochip,pc7302-pc3x2" : PC7302 development board with PC3X2 device.
-	- "picochip,pc3x3" : picoXcell PC3X3 device based board.
-	- "picochip,pc3x2" : picoXcell PC3X2 device based board.
-
-Timers required properties:
-    - compatible = "picochip,pc3x2-timer"
-    - interrupts : The single IRQ line for the timer.
-    - clock-freq : The frequency in HZ of the timer.
-    - reg : The register bank for the timer.
-
-Note: two timers are required - one for the scheduler clock and one for the
-event tick/NOHZ.
-
-VIC required properties:
-    - compatible = "arm,pl192-vic".
-    - interrupt-controller.
-    - reg : The register bank for the device.
-    - #interrupt-cells : Must be 1.
diff --git a/Documentation/devicetree/bindings/crypto/picochip-spacc.txt b/Documentation/devicetree/bindings/crypto/picochip-spacc.txt
deleted file mode 100644
index df1151f87745..000000000000
--- a/Documentation/devicetree/bindings/crypto/picochip-spacc.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Picochip picoXcell SPAcc (Security Protocol Accelerator) bindings
-
-Picochip picoXcell devices contain crypto offload engines that may be used for
-IPSEC and femtocell layer 2 ciphering.
-
-Required properties:
-  - compatible : "picochip,spacc-ipsec" for the IPSEC offload engine
-    "picochip,spacc-l2" for the femtocell layer 2 ciphering engine.
-  - reg : Offset and length of the register set for this device
-  - interrupts : The interrupt line from the SPAcc.
-  - ref-clock : The input clock that drives the SPAcc.
-
-Example SPAcc node:
-
-spacc@10000 {
-	compatible = "picochip,spacc-ipsec";
-	reg = <0x100000 0x10000>;
-	interrupt-parent = <&vic0>;
-	interrupts = <24>;
-	ref-clock = <&ipsec_clk>, "ref";
-};
diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 0b61a90f1592..46dc52c0739a 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -7,8 +7,6 @@ Required properties:
   Use "cdns,sam9x60-macb" for Microchip sam9x60 SoC.
   Use "cdns,np4-macb" for NP4 SoC devices.
   Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
-  Use "cdns,pc302-gem" for Picochip picoXcell pc302 and later devices based on
-  the Cadence GEM, or the generic form: "cdns,gem".
   Use "atmel,sama5d2-gem" for the GEM IP (10/100) available on Atmel sama5d2 SoCs.
   Use "atmel,sama5d3-macb" for the 10/100Mbit IP available on Atmel sama5d3 SoCs.
   Use "atmel,sama5d3-gem" for the Gigabit IP available on Atmel sama5d3 SoCs.
diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index 2fc617377e2c..d65faf289a83 100644
--- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -38,13 +38,6 @@ properties:

   clock-frequency: true

-  clock-freq:
-    $ref: "/schemas/types.yaml#/definitions/uint32"
-    description: |
-      Has the same meaning as the 'clock-frequency' property - timer clock
-      frequency in HZ, but is defined only for the backwards compatibility
-      with the picoxcell platform.
-
 additionalProperties: false

 required:
--
2.25.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
