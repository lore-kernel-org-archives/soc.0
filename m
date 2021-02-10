Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D5DC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE5F64E9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE5F64E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHLTdCIwC+brrIHoGswyKrfAevnEEAkgXgDh2piHrN0=; b=PMDPXOGZfS3ivXA8zfe7ChhZA
	w8rQgX7YR6MqqbkJ8lGN71vt82CVAnCm1EXvE4XsrYpQGYSVfPXd+kWmj3LYOGBR6wwiVae0ZlpBg
	ttH/rCYmCfH5bOIgvDjjk2u6GF+tAYcoiCca9tttpJ6+g2V7t+IID8aS0KcYSyxg8yUUXUKZdK8Gf
	Eu7GRNcnG+sLAMj/W53rMKmXZr1ZSTzwW+LDIl7OFvOi4VrlH7n82JvjGdZUzVEJpbYmC2+l+IzuN
	v4HkSa4MZIDUuxy7yWgoabVhZWIzNtqk+kDzagplOIG1Q/mZH7IYGPckkB0m2tbC5MG1XYlxv+ixc
	UaUI5TbMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t9A-00089n-UK; Wed, 10 Feb 2021 17:19:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t8z-000864-7F
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3823364EC7;
 Wed, 10 Feb 2021 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977552;
 bh=UQZmJPyUrCZnK9e0DT6jGZRT4VtnkmY1IlgeadpSMF8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B395kkAGg9fEAGQVXKxSPdBfTzxIGYmbWR4+45Y3eKQP1CivpCglNQ7rOB+i7x08m
 yb+fDZTJ/G8yISBXhCGvy3JxKFY+3htJmmTM1SrVrrssyIM+UrWQpySfVPD7awOTIl
 d4AC+w0uPzktTOp7wPol3dQhtR04GZN7BKyH6jOpDDC5zQQQW/9UKmdzKzCJC3Zp3C
 M/HK42lh2zjOl8eIZy9mePqVdc2VapeVk+klrIUHq4A5m3sxqsHxRhWGxegeSJJxAf
 SEBqkazyj3DestiGTT79Z0xw9uPBNVjnhMBUxeeAyZ1FnFBy5EOBjwAdle0voPag/Y
 Khlf6imRHgsuA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 06/11] arm64: dts: intel: socfpga_agilex: remove default
 status=okay
Date: Wed, 10 Feb 2021 18:18:18 +0100
Message-ID: <20210210171823.333802-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121913_400334_C5F3DB97 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210171818.Gm3pTyYOV4peZPl7yyVbGU6_sHlPfVMMIVVbgzUJzM4@z>

New nodes are okay by default.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 30dcf9978067..750237b9c5c1 100644
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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
