Return-Path: <SRS0=qp11=C6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3857CEB64DD
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 08:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CB02C433C9; Wed, 12 Jul 2023 08:41:44 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 149A2C433C7
	for <soc@kernel.org>; Wed, 12 Jul 2023 08:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 149A2C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e56749750so4466716a12.0
        for <soc@kernel.org>; Wed, 12 Jul 2023 01:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689151301; x=1691743301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/8q7gkdwr/BrCDqoyz31fyjMWdFi221FyF4qfS1iTk=;
        b=WbQEEHw+wTXjlvAlkmvcyKPPQ1lFW+/pcjio/9fWKTrKT4J+I7npAXXOzgvTDO5/Se
         bbswC8PyDEE1c5cwp4tAkSpw49h252SBQZ5K6ESU3geiRRvptJhyYfgvkYS7wMeeGH1G
         YmnOX4RqZQ66xtwoaVHGLb67pXGwU1bRcV+FaS0/7Ee9Kx4pYkcFTlukt79+nDqptWTt
         XCcIh+GklixeqHI2n9vg3GThJWhqeAD6zykBUFx5ffOJ3zfMujRyqA/uZg1VToWe/RtF
         8SMWd2CjWYlZ93l/ljmZl33n0kNO0foY6tFk7NDGG19wuX+fFD0+ypjA/rGAknuHjkVZ
         tmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151301; x=1691743301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/8q7gkdwr/BrCDqoyz31fyjMWdFi221FyF4qfS1iTk=;
        b=hk/gljwAR89+7jwLCCvfbUVTjGJgG0qkkVP5d7GJqxI7L+I7gdF+aaBVto3STgtP/Q
         JYaUX+n6nMO+7vZn5/0BjKg+WmjMPs4Y5Y0r71j3VvGnuTee52PErAXUKscK0CqEh8wF
         I/lRn+o50U35g8rULIheBAaYmHSjTKbRGKfBTbrTM4CIHJjpMccVfx/JYkYe1XWPL+1Q
         APf7o4yFEXlBWRREmvNBBBbu8fHRotH5St/hcHnPqlCxx73WLrkvONWdMfcvzmf9uZiC
         7xuZ05oQM5G/bUa6q1GL4/gMiFZUTmz5AGwTYVFhAgTQbY0Jatw1ID9VkqAXFTfqFz3h
         haJw==
X-Gm-Message-State: ABy/qLadefhd17N0OCyRmx+/WIAGA0/A8f3HPoSltZvPo8Goktg674zS
	Q+EYvSfrYRRr0VCvK0K+0Dom1g==
X-Google-Smtp-Source: APBJJlFvFQbAdGMgg1Ate5TQGNzSTflGEsWFqGw7mIgHfXMkQ7khqIwPPGWd/8oANb1nquf0ECXWQg==
X-Received: by 2002:a17:906:f6cb:b0:98e:4c96:6e1f with SMTP id jo11-20020a170906f6cb00b0098e4c966e1fmr17968958ejb.69.1689151301084;
        Wed, 12 Jul 2023 01:41:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t14-20020a17090616ce00b0094e7d196aa4sm2216496ejd.160.2023.07.12.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:41:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] Documentation/process: maintainer-soc: document dtbs_check requirement for Samsung
Date: Wed, 12 Jul 2023 10:41:31 +0200
Message-Id: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
bring any new dtbs_check warnings.  In fact this have been already
enforced and tested since few release.

Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not sure where to document this. Creating new maintainer profile for
Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
this list, so this also scales poor.
---
 Documentation/process/maintainer-soc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 49f08289d62c..12637530d68f 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -133,8 +133,8 @@ with the dt-bindings that describe the ABI.  Please read the section
 more information on the validation of devicetrees.
 
 For new platforms, or additions to existing ones, ``make dtbs_check`` should not
-add any new warnings.  For RISC-V, as it has the advantage of being a newer
-architecture, ``make dtbs_check W=1`` is required to not add any new warnings.
+add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
+required to not add any new warnings.
 If in any doubt about a devicetree change, reach out to the devicetree
 maintainers.
 
-- 
2.34.1

