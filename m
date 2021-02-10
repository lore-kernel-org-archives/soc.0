Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0FDC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E812A64EAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E812A64EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPelHrbTAJnW1VIAcZzyPd9VxTxOZeG+EKtYlN+fB8c=; b=HgRV0lLdL4uY9WQoYPiq7nZ9TE
	e6h6cidl+gASNoyk2oQ95BEAhg5uAPyGEs9mB0e/1VdGwqxic6a3h77xk1OasiHE1aTgphS6fP0Ck
	Wcc+jR4harcIjB3N+pYBdOaPyiAjHzJ6bZ1PfcmOjQqlZ5bzV1+BsKE0z/GZWQA236cjT9DrM5G7H
	wfuXpiCJ7jlnI3evCwmzLr4oHYvfV6gTqXlvb69qF8/uMUB9cjrqbOpB8dSEn4HePNRjCPIVT35xL
	SuODLkH+SuU8m5JFYUQ+SdNcWQt+b4waL70y1DI9soQ8GSsGEor2XXJvs8g2L7s3vc53rMQaGEUI5
	dWgogU2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t8m-000822-Cp; Wed, 10 Feb 2021 17:19:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t8j-00081B-ND
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:18:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D1AA64E7E;
 Wed, 10 Feb 2021 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977536;
 bh=HOJJQK2Wbw/T/wpENVoHq52Xn3TLKJjmr4NIAslcCMc=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=bdOkZ9pYngNNSmKqdALiPnB+H3QT3fZ/IvrTBdSkxCQOc+7azsWiTr34gif7zY16O
 bvcbyiyzpec0G3Cv4ayWXOf6e6FkcRFkXg5Y/J6FuBp45ABxZ219aWF15+a9CLyz/M
 /GC9QUQp/8sZ3Ro83hntnKNEzSP+Xcm4bxT8fmM8ue3gd4cpq1wfDc+XAX7GKZ+pxn
 BkcxrWYZUzg/ClSQBdux48onPAUEBZWznkfO9CNqInMq73ulLc4rcwLuZzQOfG6BnN
 8Xsk8gq5rH59k8owYYOvu4e46QTtczMO1ATOMB7umzrzT+9E5QBPqGtBGu9QkrUMg1
 YMomVVBXOEfgw==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 01/11] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and
 Keem Bay SoC
Date: Wed, 10 Feb 2021 18:18:13 +0100
Message-ID: <20210210171823.333802-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121857_852865_8113250F 
X-CRM114-Status: GOOD (  11.29  )
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
Message-ID: <20210210171813.rM3wDS51z_yaFzyaWYQas2PGJUzk76VtAPFkU0Zl6c8@z>

Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
and Keem Bay SoC.  This allows compile coverage when building default
config.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5348c0be2fcf..008314d8d1af 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_ACTIONS=y
 CONFIG_ARCH_AGILEX=y
+CONFIG_ARCH_N5X=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
@@ -41,6 +42,7 @@ CONFIG_ARCH_K3=y
 CONFIG_ARCH_LAYERSCAPE=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y
+CONFIG_ARCH_KEEMBAY=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
