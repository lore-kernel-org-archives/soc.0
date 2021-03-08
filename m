Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E706C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:48:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 55D82652AC; Mon,  8 Mar 2021 17:48:46 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4E664FBE
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB4E664FBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f72.google.com ([209.85.221.72])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJzo-0000R9-6T
	for soc@kernel.org; Mon, 08 Mar 2021 17:48:44 +0000
Received: by mail-wr1-f72.google.com with SMTP id p12so2563744wrn.18
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnNh9ESdQq+5EcjLvckU0Dxe1tNhusY1hCWeqolcbKk=;
        b=Vkh11vJg85EMu6dUvt806yzda7/8eLRBJuaovFYMNdQ12KkGV7dWUd/SK2ntdLNuwD
         pZmTxXvsG2atA1ZO1MyiN/F/HA2Rs5+hPzShQVORKwByqAqYas8ituZZn+Pqx2+XaVa9
         s2d1Yzoj1kCk7RNkDmUGdvBg4JdNqe6A5khFH0QkECPhV6iwchynHlIHQxggi6996ldC
         7fqvc8HIV33ElhOwJvkAS0Ri1Ooi2FLnqjT6Fl6LE+O7ZU7q8Ee00/qJvZcfNA4I9PDW
         PgEvnkiRJjFvvyvUhN5rrj0zKnt6oKQeEPUuZ5cYeZsa7v66GFqvV/uo3Zn/enTIFgXq
         FsPQ==
X-Gm-Message-State: AOAM533e8Uh56WxEQ4+gPgRH5ZfMIsZax5dHaGmem6EwiQaoPS03sMsT
	c1yxHI1Yvl3DJOAFJMdLexYA9fp9vR5FRytBShPKdgU8A9gJkB0kwWKygJKbpwImRFV10oJGJXo
	Q0k1sA24ffNwbidyZyCNdsCI=
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr23605182wmh.111.1615225723889;
        Mon, 08 Mar 2021 09:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUaRuyx4RAtpOe0d5//r1TyywE48mqQx+LxCJ9l9WcQNO5Z2DIZ1cd0UL5cpHe6W7MSrd2mQ==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr23605174wmh.111.1615225723756;
        Mon, 08 Mar 2021 09:48:43 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r11sm20977867wrm.26.2021.03.08.09.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:48:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] arm64: defconfig: enable Intel's eASIC N5X SoCFPGA and Keem Bay SoC
Date: Mon,  8 Mar 2021 18:48:24 +0100
Message-Id: <20210308174824.278372-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Enable in defconfig two Intel ARM64 architectures: the eASIC N5X SoCFPGA
and Keem Bay SoC.  This allows compile coverage when building default
config.

For the N5X (and Agilex) enable also DesignWare SPI controller in MMIO.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Hi Arnd,

You asked me to check if all drivers are enabled for these platforms.
In general the answer is yes. In particular:
1. Keem Bay is does not have much in upstream, but everything described
   in DTS is there,
2. N5X shares a lot with Agilex SoCFPGA which already (mostly) is
   supported.

Changes since v1:
1. Enable also SPI_DW_MMIO
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d612f633b771..9f9adcb8b0e9 100644
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
@@ -465,6 +467,9 @@ CONFIG_SPI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
+CONFIG_SPI_DESIGNWARE=m
+CONFIG_SPI_DW_DMA=y
+CONFIG_SPI_DW_MMIO=m
 CONFIG_SPI_FSL_LPSPI=y
 CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_NXP_FLEXSPI=y
-- 
2.25.1

