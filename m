Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC678EB64DA
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 14:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1336C433C7; Wed, 19 Jul 2023 14:33:20 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6525FC433CA
	for <soc@kernel.org>; Wed, 19 Jul 2023 14:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6525FC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-992af8b3b1bso954025466b.1
        for <soc@kernel.org>; Wed, 19 Jul 2023 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=JxURig7FBAAC/3I9yT3aHiTqXeWWAq0k+MGxx7xZ1vdG66aZ7E/pUW+2Vufm3nF5nt
         PQRijfFThwLLN+R5vZT+cepzhH9bJqUTHAarRy2saW3hXq0sJ+TgQOkCl+S7betr+2r4
         I1Zsk8Y7AgA3q1gZu0RQooyDAQxZjPz6YNJQzKEERCq/hVknWzKJFTWLjFxbal365wUH
         higiPiWNIGJF2pPpBfQgRyGJaMGwb1cxsbX9puXisiBFXZQrdHTSdqFzuFAunWwO7ky5
         n2Ptixa7nFwWUw+pilJzQBH9JRPhhLbsxRKczXkhgBHDa0LDjyKeZ5DgA9xVDlY0EP/t
         jfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777197; x=1692369197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v1Uf60tNTGfAfR1+MaSMHHKItd8uNKnfMyyizLcMis=;
        b=FqnSuWrAoBLHF75O4sZ5Ov+Uof6pQVp9uIdypSpFXucvIAY11KqkaI8lxCIfPTKwmM
         W/ZLfVTqbuyPnf6A7mlaC7l59t1q+a+MgEHscp/AKPIIF5mUjA/ud+/M1sq8zBNhaGzZ
         1u5pQRxy5ksenuxG/sjR/oGJX+qU/TWsLi7jubBmY6Nl7zQ+hTjnrr03wrkaUNjdkqK4
         eXQRhClnB3jjZgAKxnslQmXpCC9nAWQLDNlkv6Vfoprwg3fhhOL/paO/Z4S6Rv8+787U
         L0fOSDWyy7L5HpvGAO9zTE/VVbbshbNH+zSq4CchlDIb/FH0illOPAD7KAIppcC0flMV
         Uw+g==
X-Gm-Message-State: ABy/qLbtbkjRYoMO15zKkHNGFjqGbYhxK9XlvY+eT3Hd0ewV2NH7FUHu
	TqN3+g4QyOUL9nFHynLuasTPxQ==
X-Google-Smtp-Source: APBJJlF+JcEt0XZP2Tw59JukE7GuYig+Z35mtFzxo15uZB8/KXGNf8iKMl16iFRTuItUUfVn/5VsyA==
X-Received: by 2002:a17:906:77cf:b0:993:d47f:3c84 with SMTP id m15-20020a17090677cf00b00993d47f3c84mr2864253ejn.7.1689777197337;
        Wed, 19 Jul 2023 07:33:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
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
Subject: [PATCH v2 2/3] Documentation/process: maintainer-soc: add clean platforms profile
Date: Wed, 19 Jul 2023 16:33:08 +0200
Message-Id: <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
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

Changes in v2:
1. Add Rb tag.
2. Implement Conor's feedback: change doc title, follow->should follow,
   minor style changes.
---
 .../process/maintainer-handbooks.rst          |  1 +
 .../process/maintainer-soc-clean-dts.rst      | 23 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 25 insertions(+), 1 deletion(-)
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
index 000000000000..c460923f39be
--- /dev/null
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -0,0 +1,23 @@
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
+Documentation/process/maintainer-soc.rst.  However platforms referencing
+this document impose additional requirements listed below.
+
+Strict DTS DT Schema Compliance
+-------------------------------
+
+No changes to the SoC platform Devicetree sources (DTS files) should introduce
+new ``make dtbs_check W=1`` warnings.  The platform maintainers have automation
+in place which should point out any new warnings.
+
+If a commit introducing new warning gets accepted somehow, the resulting issues
+shall be fixed in reasonable time (e.g. within one release) or the commit
+reverted.
diff --git a/MAINTAINERS b/MAINTAINERS
index ba5e7344f30e..a70c32790427 100644
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

