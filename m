Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80990C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 14:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EAEB6109F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 14:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EAEB6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eOdRWrsnOf5GpMHeX831ZZ633UF3MSMzIXNd263WVsw=; b=M3i0Y033KLxz9t
	LkeLgPLjT7+BeqvfD9XEH5VBEr9iGA1ZFRLQsoYb782c+6jsFFE9zT64gD4rMYd7WD1Xxdj5PZ7vq
	85ncjUKhjUsBZbwZVBmDlzPyQAfOwfK1+PqcOdtG3GmIyr46KX/Ux58u9g9Wdhx5Ah4MB3RYRbjiZ
	9lsqvXY6mveFd8+Btz1sG2Ix2sVeJ8WDqdw7VO+Df8lu2oEYFyFfMxcorUWW7yiHN8MV1Wo+iXQO2
	xajXJ0hBkKHI2+ucY94GkzrkPELYqihz3XwT2jnSFNNz5GCFOvkFV/7aXGqmdJYBIzezzyV1vio2g
	XAYNWooWbpRhaX4gF04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvHF-00BDpW-Kk; Fri, 22 Oct 2021 14:12:09 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvH7-00BDmj-OX
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 14:12:03 +0000
Received: by mail-oi1-f171.google.com with SMTP id r6so5183459oiw.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 07:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fntq8tUMlB+L0yN28C+/8oiQ/tqnhvbVaVy+XCHM97M=;
 b=2dW6xCAf9scc2PInlzNOaHVI/CU8y8IUGo5LqsylFLd7MD05zsFwmJamPtoZgZiCZr
 UpBYNaZnNi6ENY9DtrbUEp4UmbyfvfXPEQkbD0fVWxAMH0D+kh+MC5mQ9rhQYoc+hlbk
 pqlAjkbgJNVrUrWSGJzF4k666RRMY5T0czVkAKU41JcEpnOLxqyFJncN4SXkrkA3YaiT
 BKPDFeHa4RiTD7p2sexu1HGA1EtUHb0U3FPYLjGzc5lYFyAAC86o9OIv19f55CiyBaAM
 Gs2Nbw7t53pI4nEgswWYsfhtzdo7Ka9YJ6JLnNs2nq2r5BwYSy9YghhHUlXe+kdUin5D
 hyTg==
X-Gm-Message-State: AOAM531BXuto37CVwi9wijBF2oMH79NfERHEnrazmxNe8gDiAV/5l3VM
 rHN2r5qR5yp6TZ1vSbT3jQ==
X-Google-Smtp-Source: ABdhPJwQ2dCgcSgOjl+llkhisJut4OFc60/Z9ZVdZK9ftiZjWbJd0kP0dC9thm618B3k/7CcA122Eg==
X-Received: by 2002:a05:6808:1287:: with SMTP id
 a7mr10108534oiw.45.1634911917877; 
 Fri, 22 Oct 2021 07:11:57 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id a15sm2037958oiw.53.2021.10.22.07.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 07:11:57 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v2] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI
 nodes
Date: Fri, 22 Oct 2021 09:11:56 -0500
Message-ID: <20211022141156.2592221-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_071201_831264_B1DA168A 
X-CRM114-Status: GOOD (  10.27  )
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
Message-ID: <20211022141156.DTQU-xqPG6jPZcA8P_iv2kZf9zCVGHckKF-I0rJO40A@z>

The spear13xx PCI 'interrupt-map' property is not parse-able.
'#interrupt-cells' is missing and there are 3 #address-cells. Based on the
driver, the only supported interrupt is for MSI. Therefore, 'interrupt-map'
is not needed.

Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---

Arnd, Olof, Please apply.

 arch/arm/boot/dts/spear1310.dtsi | 6 ------
 arch/arm/boot/dts/spear1340.dtsi | 2 --
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
index c4b49baf9804..2f746a9428a7 100644
--- a/arch/arm/boot/dts/spear1310.dtsi
+++ b/arch/arm/boot/dts/spear1310.dtsi
@@ -82,8 +82,6 @@ pcie0: pcie@b1000000 {
 			reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 68 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 68 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy0 1>;
 			phy-names = "pcie-phy";
@@ -101,8 +99,6 @@ pcie1: pcie@b1800000 {
 			reg = <0xb1800000 0x4000>, <0x90000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 69 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 69 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy1 1>;
 			phy-names = "pcie-phy";
@@ -120,8 +116,6 @@ pcie2: pcie@b4000000 {
 			reg = <0xb4000000 0x4000>, <0xc0000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 70 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 70 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy2 1>;
 			phy-names = "pcie-phy";
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index 1a8f5e8b10e3..827e887afbda 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -47,8 +47,6 @@ pcie0: pcie@b1000000 {
 			reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
 			reg-names = "dbi", "config";
 			interrupts = <0 68 0x4>;
-			interrupt-map-mask = <0 0 0 0>;
-			interrupt-map = <0x0 0 &gic 0 68 0x4>;
 			num-lanes = <1>;
 			phys = <&miphy0 1>;
 			phy-names = "pcie-phy";
-- 
2.32.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
