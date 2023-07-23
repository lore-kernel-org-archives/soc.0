Return-Path: <SRS0=Cgkb=DJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325A1C001B0
	for <soc@archiver.kernel.org>; Sun, 23 Jul 2023 13:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB50DC433C7; Sun, 23 Jul 2023 13:19:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91FF1C433CB
	for <soc@kernel.org>; Sun, 23 Jul 2023 13:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91FF1C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-317009c0f9aso3083855f8f.0
        for <soc@kernel.org>; Sun, 23 Jul 2023 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690118374; x=1690723174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENETnkocXZi6dl4NhjFyWgfk3+p5JzgNLDZ8yvhlSSE=;
        b=qwj3Uno2LcoIiU1bvwWEdgC9M4R6885fys9S+g24ZVmcbMOI3G2vBvXkUjm9zozJfO
         o/Cw9C7U70/pHY+mjkfPwtHB3srjLyrb6oMLqn0OW6bYuxpmhwDFBOjvkB7pRSUdR+4w
         esxviqIzSvO0KNzXqTiYUUPCN1lQIk2WwESvnMOqVwDtErHvJVSl4dvAiPS+SrSNLRyn
         aZ1ktFTN6QDhkoJED41ND4fpYliEgX94AD7LU52VSe7XVm944B+/WBci5ooRJbJQpOXF
         fHp06Tw602sklEyo8ODwPA8NVlL8kJ0SPpi5siPg1Ew0YFffTDabX7BXkwwBrPFFWEo7
         1k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690118374; x=1690723174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENETnkocXZi6dl4NhjFyWgfk3+p5JzgNLDZ8yvhlSSE=;
        b=cmWE+DzTlF1dWQFV18TnvTNmhbA8zaJ2A6i16F1vaorJ/cbJNBFsWHHLJCtMXgIbjH
         nHcgBW/K83c0yj4CYW3r29njR0FTJCjSVgIr5fQ3Zkr/0zauDJlQwfvD20blLolfIxJ9
         ifeGinB+nMv+LqSssMnZEKlHYCxH2z2fpeVbqTI5oJf/l9b8p+Y99IwQyrgMFN+ZOg6R
         yDWkHQhkd0TpdT3a8f3ArgFQF6K1tQ9oIA/nd7DeaDIFcD8TVQF2x3qCcEgIRLvbACIX
         /XzeCBLGQxrxqaHGf4m5JR4AmTKMAu1lxQPSxmMqhZ4a4WIQfrojH1ZtWgpCozLi7e7N
         nNxA==
X-Gm-Message-State: ABy/qLY6C3CqX0FVfJ5t3RUZ2hYSe4g253B9PUIHognTvnnkSIUlwu31
	uvnRAIpuG0ej3dn242qRQ08NTg==
X-Google-Smtp-Source: APBJJlE1mh/A7SHpG1M3wY7olKbn/R8UGGriuIeym+XzmrhUYQAyuTY62uc5V7JdcDXSZqRFR3uajQ==
X-Received: by 2002:adf:e68d:0:b0:313:fe1b:f447 with SMTP id r13-20020adfe68d000000b00313fe1bf447mr5564326wrm.71.1690118374599;
        Sun, 23 Jul 2023 06:19:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d49cf000000b003143765e207sm9700257wrs.49.2023.07.23.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 06:19:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	arm@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] Documentation/process: maintainer-soc: add clean platforms profile
Date: Sun, 23 Jul 2023 15:19:23 +0200
Message-Id: <20230723131924.78190-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
References: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoC platforms require that commits must not bring any new
dtbs_check warnings.  Maintainers of such platforms usually have some
automation set, so any new warning will be spotted sooner or later.
Worst case: they run the tests themselves.  Document requirements for
such platforms, so contributors can expect their patches being dropped
or ignored, if they bring new warnings for existing boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v3:
1. Rephrase according to Rob's comments (this document when referenced
   in maintainers, "... and dtc Compliance", existing warnings are not
   new warnings).

Changes in v2:
1. Add Rb tag.
2. Implement Conor's feedback: change doc title, follow->should follow,
   minor style changes.
---
 .../process/maintainer-handbooks.rst          |  1 +
 .../process/maintainer-soc-clean-dts.rst      | 25 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 9992bfd7eaa3..976391cec528 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -17,5 +17,6 @@ Contents:
 
    maintainer-netdev
    maintainer-soc
+   maintainer-soc-clean-dts
    maintainer-tip
    maintainer-kvm-x86
diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
new file mode 100644
index 000000000000..1b32430d0cfc
--- /dev/null
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================================
+SoC Platforms with DTS Compliance Requirements
+==============================================
+
+Overview
+--------
+
+SoC platforms or subarchitectures should follow all the rules from
+Documentation/process/maintainer-soc.rst.  This document referenced in
+MAINTAINERS impose additional requirements listed below.
+
+Strict DTS DT Schema and dtc Compliance
+---------------------------------------
+
+No changes to the SoC platform Devicetree sources (DTS files) should introduce
+new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
+results of issues in an included DTSI file, are considered existing, not new
+warnings.  The platform maintainers have automation in place which should point
+out any new warnings.
+
+If a commit introducing new warnings gets accepted somehow, the resulting
+issues shall be fixed in reasonable time (e.g. within one release) or the
+commit reverted.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7624eb231b65..9fe3870300f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1573,7 +1573,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
-F:	Documentation/process/maintainer-soc.rst
+F:	Documentation/process/maintainer-soc*.rst
 F:	arch/arm/boot/dts/Makefile
 F:	arch/arm64/boot/dts/Makefile
 
-- 
2.34.1

