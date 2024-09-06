Return-Path: <SRS0=OjNc=QE=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F0ECE7B1C
	for <soc@archiver.kernel.org>; Fri,  6 Sep 2024 14:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0691C4CECC; Fri,  6 Sep 2024 14:05:22 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDAE3C4CEC4
	for <soc@kernel.org>; Fri,  6 Sep 2024 14:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BDAE3C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a86a1abc05eso16006866b.0
        for <soc@kernel.org>; Fri, 06 Sep 2024 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725631520; x=1726236320; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sTKA9799tNHggSqxU2/u6jwP6G56MM3BVuVl/Oq12g=;
        b=HyRpoYi46igusZrepWOcc1Kt3TZMAHj/sp7Fiz0o5SKudoQggEfjIpjVGlJMYMn6Zc
         U6vx6uOD64F8cuPWn8vZx+ha4L9clgIBYLPYd4xp9Xa/63bos0jt0E5ur9XoL/urwoSG
         3Vi8cn3+wi4W1/uL3SX31MeDMMZ281UMRYiAHS6f7Zyjl5vXO3oQxEWjsB8HKIQwc3r0
         SLL4vBK4CUnNp2bKj00Mp1JW2POO8P3XtES5mQA3sc3PuOeu/QRYlJBPTzqk6o3JH0f8
         71dYkRWShZrdTe8zvvPLe3+8YXJQ6hJlVwJyyD905IfwvBuvAie6NL6KQ8RBdnzCFO93
         rGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631520; x=1726236320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sTKA9799tNHggSqxU2/u6jwP6G56MM3BVuVl/Oq12g=;
        b=bHGVXsFXPwQTSMtp4kZbajDj2nKrxIA92UOpLcqZeYw1bdpsURibsvi5h1CHdC+e0y
         s99JxAujoILxW5pLHoEPWXTzxGpSF9WPFhPWoHmjG7+VEtNllQgbISGXxFOhUrAYwLSK
         sDj63XFysmeiV6mvup9sRzjbqDztzfOL2zX7lUQWnfW+NWGo0dYk1dgzSp1199Lh4xR3
         +Hmu6aFhK0Kjumjtwzx1lBYgLc9rfNmFAyVziYPwIszxBksVDlo/9iT7GR53lm5kCGZG
         yWxrmlHeetim/e9StVAgvfa/A+Kx3L3NRAlZW/0r1gahP+PH463Fr8TuqowNS/ihaaK0
         iZZw==
X-Forwarded-Encrypted: i=1; AJvYcCUJUEXO3ShxUtqrzO0JOJPG9Au3EFwvUFTqIRzqg3g+4z2rAH7V8B8NeeylAyExOyvDBCU=@kernel.org
X-Gm-Message-State: AOJu0YzHD5W0wOAjSoMk/fzxpmlWfKXw4rhDOMXkoYEwAEr85dTDzknv
	vR3SpgMVDy3pp3QTDp9kIYsIazUKWycnO8HxLxIV5ibEJNeENPNQMXtv5lmr4P8=
X-Google-Smtp-Source: AGHT+IFKZwtHtV9PO6LP/3lo8dMOMciYzMRKwbxAmyvhPemXsrkNEfo4BYYP6vzoUfeFVdSPS1fmxQ==
X-Received: by 2002:a17:907:25c9:b0:a86:9e3f:fdc8 with SMTP id a640c23a62f3a-a8a885fb901mr127136166b.4.1725631519392;
        Fri, 06 Sep 2024 07:05:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a7e223498sm162319666b.196.2024.09.06.07.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:05:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: minor improvements for v6.12
Date: Fri,  6 Sep 2024 16:05:12 +0200
Message-ID: <20240906140513.71307-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
References: <20240906140513.71307-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.12

for you to fetch changes up to c7b44ed960ddecb3604d1e273494a932f00f384b:

  ARM: dts: nuvoton: wpcm450: align LED and GPIO keys node name with bindings (2024-08-12 12:07:04 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.12

1. Realview: correct unit addresses (e.g. drop when not valid).
2. Nuvoton: correct node name to match bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: nuvoton: wpcm450: align LED and GPIO keys node name with bindings

Rob Herring (Arm) (1):
      arm: dts: realview: Add/drop missing/spurious unit-addreses

 arch/arm/boot/dts/arm/arm-realview-eb-mp.dtsi                       | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pb11mp.dts                       | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pba8.dts                         | 2 +-
 arch/arm/boot/dts/arm/arm-realview-pbx-a9.dts                       | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)
