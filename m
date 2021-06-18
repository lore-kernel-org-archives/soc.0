Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4263C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766A461260
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766A461260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xLZIyEUQb5yIiJDYGg2DXy79Nn4h8Rc5HJzFhbH1gQw=; b=GeNs8YI6+TxUs2
	+L6JaL1/gBmLZ0mrNzCriLxXy/pHraeK7+FYGtvEexEbYN7C/BLIHF5l1F1R7pD8EZXw8ZV+etFy3
	zVr5BB7gn5WdytD2Yn2kbshiLXQDQEM4nD9ME9zCjMr5rT5SPWmqE55VkCv8cHzHjtfWMLa6NhH5/
	cU6b0uRl7eFWUMr7IVpEyLs34boNJGoRYeFB7MaSfj1XI9Bg5jUcN218LRgr5ngz9wtKRQF9jO/rg
	vN2IzxUjUCHCNipZ1opBIiD0YfwfoQszhxBu2eVmQ9aUfsBE6NgeS0/rOCqtImjx50IlqyBQFFMbo
	t+kmVRyh7Ymw7Hk650kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLWl-00FV8g-JF; Fri, 18 Jun 2021 20:55:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWg-00FV6r-PE
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:44 +0000
Received: by mail-wr1-x42b.google.com with SMTP id f2so12079649wri.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLy32YRyoZ5czfNPvX937n5z68mS5Dt/8atvgtKFvwQ=;
 b=o/CxikdrQRF61Z372ZRwM8wBTTiCxbifjXJIC3UGwCkgtcL13kW7xV0v/vTJs2Sr3F
 vlPtDKAg8kJYDqOmDjgxNdAFaCR04GmBfkXNUhPrev9TOHVMZeL2+Wfov/QhfOVKLFOG
 jegTkNUcslewWDomJoVX0T5ZLe11r3JNKcolewJTcbOv3wd/6iWA2vA/rjaZhwb41Szx
 DioqP02R44mK7ygcc3qEswJDNyUigoT/UOHVudcQEn0rfOEvffu5wczNPas/qR+79Svl
 BmP/XDKP2/FnlaZ7ShvOX9ZXNhkXWdEbRYqVl2JDUslwtDVdmgSvGyWu1DVzK3CtcCat
 P4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLy32YRyoZ5czfNPvX937n5z68mS5Dt/8atvgtKFvwQ=;
 b=Jl9EQnrZVFv2hADcPuLXHNqPuhH7y0mMvZY2rTJCscP7t8am42FTd34ez187+mAMpt
 YaI4RHIbFUv1QEqBiqq7AD9KnYBddnFIN9wDWPBGPxzRQDDxVUgS//7xAAY2qnOHGMwK
 1YrW5rfAzJmXqO9tCe7rosnbCRxJ/NnsNc7ICZdwbmD7s5wi+cumt7F3/b1fU3jiU0hR
 TvngnsUl/S2yRgmnTnTqJuf6jvALKZi0/7nwE4YasN3rRkV4k5C1wVrJobDGKuPTi8C/
 k/LgBa/KDxQ28kX+tuucJr7J0a2OcVqgS8q7Q9mwefONCo3/VZ3zBPhfwquUw8l5Vcxe
 6J0w==
X-Gm-Message-State: AOAM530KgJQKc1RbFPXv5Xc1zSe2v01JSvcwd2XmNQx9x/X++jDUpPj3
 gBgcLbKp9u7WLPU+mTCDNcpeGg==
X-Google-Smtp-Source: ABdhPJwvWUKDVSAk9UEA2yUXUvp1Q8PkiE4s34baCHlp7pzILntItWvnWGhPX6sz0+OyVzlYwdJe+g==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr14828957wro.37.1624049740671; 
 Fri, 18 Jun 2021 13:55:40 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:40 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/5] ARM: gemini: add two more board
Date: Fri, 18 Jun 2021 20:55:28 +0000
Message-ID: <20210618205533.1527384-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135542_865720_DFF99A65 
X-CRM114-Status: GOOD (  11.39  )
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
Message-ID: <20210618205528.jASP3QYbG-DKsUE23bjq1VRvmjjvsOUOW67IOVsO440@z>

I have two boards with a SL3516 SoC. Both are NAS box.

Changes since v1:
- ssi1328 use now redboot-fis partitions
- added pinctrl as asked by Linus Walleij

Corentin Labbe (5):
  ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
  dt-bindings: add vendor prefix for edimax
  dt-bindings: add vendor prefix for ssi
  ARM: gemini: add device tree for edimax NS2502
  ARM: gemini: add device tree for ssi1328

 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/gemini-ns2502.dts           | 148 ++++++++++++++++++
 arch/arm/boot/dts/gemini-ssi1328.dts          | 138 ++++++++++++++++
 arch/arm/boot/dts/gemini.dtsi                 |  12 +-
 5 files changed, 298 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
