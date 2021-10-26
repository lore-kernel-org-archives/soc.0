Return-Path: <SRS0=np67=PO=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE6AC433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5EBAF60F9B; Tue, 26 Oct 2021 09:47:28 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6F960EC0
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A6F960EC0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ED3D53FFFA
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635241646;
	bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=I4xrG7cFUuVFPxYscuJIyVVTvzcg0w2TXZ9iPpO1GTdWPBi9rtTUoy8oYpIWWCsQH
	 al9tn1CRei6UYnZZZYyCnvtfI7LU89IeyjwYPnMSQe9jYpXS6HIXmFZGPgjTBQN9Fe
	 L+aqHa97Ng7yqoLRgGJTO9coGrIBSMIugDb7evk8CzKleZ2L19OyJkKT4WE4mjqZSz
	 ko/jARznL0pUyf1CgMEL/5beHYg9bgNbzBdVNzl9wv8U1rdhLJjxOaAtMK7hzecsWR
	 BJHDeanz+VYP791IUyaz4FngRu0UJLq/mL8dCvviCtbyyuDfPPLyVv1Qj7f8Oi8cvI
	 LboW2PRxKNOTg==
Received: by mail-ed1-f71.google.com with SMTP id m16-20020a056402431000b003dd2005af01so427688edc.5
        for <soc@kernel.org>; Tue, 26 Oct 2021 02:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rL7wDI9BhVHC252CW+CxxpCQUhhfA8amv8WUbteCqVg=;
        b=A8a8lPGiqLv2U2wpGNZx6Icvmno1odBLZmd3PQVNRPe08yeqN9w9LjIabG3FWv2rJA
         QmMJ/WQzxG9/k+UoYmnQK+L4+LCVe/3HQR1dFRiBsynIj/Qm3gkntBsEOtlOptkTTm83
         hq8hgAy71/FrCOU9JUVm/1awISwUXHQaSfBiwRsUGwkqR7H20Bsy7msI682AlUSE6N/t
         DgUHBYVudtruAeg+4fHZ9ifnNXJjGAwobt7Gz5+yoUhKSsyCaWouxZPezQl12f9Hm5Ml
         Gn9Hxh+KiSbjUaShyK05QSduzOs3LQcgE/+EgPjbom8/C2AjLIh5Wjj8j3kZWM5IiRVt
         CegA==
X-Gm-Message-State: AOAM532RlK7VBAumg+pBqYTMm0z+ODONLlc64WUUOmWD2pwM2P0fV/kk
	HrbZIQ1Zq2aQW4u3cfDzFC07kDZy/4ckpeTgj99baZ06iDVXOojyg2G13IFUcGc15VgaUwMikTC
	Vfokx+QMI68G9IXiCVUddy3k=
X-Received: by 2002:a17:907:1ca3:: with SMTP id nb35mr27143848ejc.155.1635241646279;
        Tue, 26 Oct 2021 02:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj15dtEVfN26R0cv7huGEYK/rYbVAl8R0+VUld7zFjW27HL1TfRHGuG6Mr78Cler2U3kJh2A==
X-Received: by 2002:a05:6512:1190:: with SMTP id g16mr21983643lfr.609.1635241635178;
        Tue, 26 Oct 2021 02:47:15 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: dts for v5.16
Date: Tue, 26 Oct 2021 11:47:07 +0200
Message-Id: <20211026094709.75692-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull.

Best regards,
Krzysztof


The following changes since commit 7ec804d6025c952e3122ad7fe768178efca3300e:

  ARM: dts: exynos: use spaces instead of tabs around '=' (2021-09-30 13:45:55 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16-2

for you to fetch changes up to 7b06c1ad884ee80e43604ba2a0bbc5f8ef3524e1:

  ARM: dts: s5pv210: add 'chassis-type' property (2021-10-19 10:57:40 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.16, part two

Add chassis-type property.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: add 'chassis-type' property
      ARM: dts: s5pv210: add 'chassis-type' property

 arch/arm/boot/dts/exynos3250-rinato.dts         | 1 +
 arch/arm/boot/dts/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/exynos4412-i9300.dts          | 1 +
 arch/arm/boot/dts/exynos4412-i9305.dts          | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 1 +
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts   | 1 +
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1 +
 arch/arm/boot/dts/exynos5250-snow-rev5.dts      | 1 +
 arch/arm/boot/dts/exynos5250-snow.dts           | 1 +
 arch/arm/boot/dts/exynos5250-spring.dts         | 1 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
 arch/arm/boot/dts/s5pv210-fascinate4g.dts       | 1 +
 arch/arm/boot/dts/s5pv210-galaxys.dts           | 1 +
 16 files changed, 16 insertions(+)
