Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE91C47096
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60962608FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60962608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBnA5FvgNn+l5wX4Jrd5aIl15PIRjXUBd0IlgYkDIbw=; b=MCVxj646XuE/eE
	z7Ertl5yqEcud8921oNmLPlrGGvRfv/qg40QAVFkByyMhMy8DD4S3tvoMwc6mcVByVepL/10SMuGU
	nElQE8tiA8oNS5sWlOA0o/aH2SYAXHEk10moZ4hFpyv+x3uSoWzgCaRmzfYjq/gG61uERuKpprz0l
	KFg2RibFaVqSY/G15exObKWkYDRehUjTLKekOFf8iHaGGyoCuRlra4xhACkzhN3+cmzhEJabIjF02
	GyLs77QGKPB6jPMjG5POeRcBCrXK8WL8FWJjbtA76dyva2lAfuwgtdTNEl92FjumFErSuGVajZngV
	FwQTWAbqH97W/DpajW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lprj0-000EEM-Rf; Sun, 06 Jun 2021 12:17:54 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri2-000E01-22; Sun, 06 Jun 2021 12:16:56 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGz9p-1ldRVH0QNv-00E4AZ; Sun, 06 Jun 2021 14:16:36 +0200
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
Subject: [PATCH V2 5/7] ARM: dts: bcm283x: Fix up GPIO LED node names
Date: Sun,  6 Jun 2021 14:16:15 +0200
Message-ID: <1622981777-5023-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:lj4rkCcAppsQBhrwcqPM0+9yHieqEuKpHjIxgRRN8B25CcTdHmr
 HBWEPc9oP9vcG7j3VaHizzR+URg2qlNH/CbE5YsqYRFlf/mROQNWYY0TM0mjmlpi9okIUVE
 lXhPDD0NOllFujaXDGlgvQJ/uS9+FXKRbJ05MwUIcwc5Ot4nN/Ixtts/Nkh/ETU9WK6DGMB
 7Ln6lbWjt/hbmsufbvCSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bsDfukr2g14=:rcE2QmPOP4CRqd05khF9mL
 c8ZzZLB2fiiuj15XBK589wSIs1ajIvX1EMVYj9IPpoef5yHagjRrIlSTGbYNciZcZn3KttYPJ
 C6WvF3Vv76V+cp7mICP7tcgFM8V8U/tGQiM7pdHMqJeYIICNbbz6GMMrtbZMRpRwW5XyeJVx8
 x0EbL7YRf9mPRWq3IXN6LZ3Vez4DQ4UeGme8i7WVmUy5hAQQGvy3RG3Om3853Sw+esnxufifJ
 xwA6JsLbmqbwvEVFkwio7Eu6glqp3tzXnxeFRQTeHm/3oe+buuh1nzQviF6dacDld/dxBZIK2
 DKpfmdSOyVq+1cJf9J4dqn41/ce8OeAq0bvL4AejAOvK9krT8bhx+2VNnp1n+c6SeIkRAPSWO
 g/yVsf+um/45+fh0VBAsyR167i63uJnGxOj+x41YkeuPVZKCNo5x1nTq38b8wA0+vkjXpvwAL
 iPpp8bt5r3tZv+YjaGG+4wKt9O5bUP9BxK2/G67QTrzR6KmqVD5NkNBlbJH6Qk1p0hynEnKk9
 T1bzEBkmLSpYN5oCmDOXVg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051654_416967_C22A8354 
X-CRM114-Status: GOOD (  13.42  )
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
Message-ID: <20210606121615.3LdGoGTqcmYn1VqWbWQPFf2XZzprTq4t7KkttI7NhAg@z>

Fix the node names for the GPIO LEDs to conform to the standard node
name led-..

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts      | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts   | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-a.dts        | 2 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts   | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts   | 2 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts        | 2 +-
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi     | 2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts   | 2 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts     | 2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi         | 2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 4 ++--
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 2 +-
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi     | 2 +-
 15 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index c54854a1..f24bdd0 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -14,11 +14,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
index 6c8ce39..40b9405 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -14,11 +14,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a.dts b/arch/arm/boot/dts/bcm2835-rpi-a.dts
index 17fdd48..11edb58 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a.dts
@@ -14,7 +14,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index b0355c2..1b435c6 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -15,11 +15,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index 33b3b5c..a23c25c 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -15,7 +15,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index 2b69957..1b63d6b 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -15,7 +15,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
index 58059c2..e4e6b6ab 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
@@ -5,7 +5,7 @@
 
 / {
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
index f65448c..33b2b77 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -23,7 +23,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
index 6dd93c6..6f9b3a9 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -18,7 +18,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index d94357b..87ddcad 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -4,7 +4,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		act {
+		led-act {
 			label = "ACT";
 			default-state = "keep";
 			linux,default-trigger = "heartbeat";
diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
index 0455a68..d8af8ee 100644
--- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -15,11 +15,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&gpio 35 GPIO_ACTIVE_HIGH>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
index 28be033..77099a7 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
@@ -19,11 +19,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 29 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
index 3734314..6101026 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -20,11 +20,11 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&gpio 29 GPIO_ACTIVE_HIGH>;
 		};
 
-		pwr {
+		led-pwr {
 			label = "PWR";
 			gpios = <&expgpio 2 GPIO_ACTIVE_LOW>;
 			default-state = "keep";
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index 054ecaa..dd4a486 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -20,7 +20,7 @@
 	};
 
 	leds {
-		act {
+		led-act {
 			gpios = <&expgpio 2 GPIO_ACTIVE_HIGH>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
index 925cb37..828a205 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
@@ -14,7 +14,7 @@
 		 * Since there is no upstream GPIO driver yet,
 		 * remove the incomplete node.
 		 */
-		/delete-node/ act;
+		/delete-node/ led-act;
 	};
 
 	reg_3v3: fixed-regulator {
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
