Return-Path: <SRS0=Yx92=OE=pdp7.com=drew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E44C3271F
	for <soc@archiver.kernel.org>; Thu,  4 Jul 2024 17:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52854C4AF0A; Thu,  4 Jul 2024 17:49:31 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 593CEC3277B
	for <soc@kernel.org>; Thu,  4 Jul 2024 17:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 593CEC3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d84546a05bso462499b6e.1
        for <soc@kernel.org>; Thu, 04 Jul 2024 10:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720115368; x=1720720168; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DvhJcUGw5mSDBm9HbHfggA/39XLYnhdmnTEhZw5rXs=;
        b=EOZFVhsqRXsEhFg5RHD41X3lmAhFpwa4tS0hxuEKxk4WiVy4yAiho7AIbRSVzhz1HU
         O2eFvSvU01BrIIGDqHdfZT3dZi9SNmombsILEo7Y6jz+RMClnVyF8PEgxlCFnkSHpsft
         FNlDagnFFD9+f64RqSl3dRPolvSYlGYsJcodEypsYmpUYKwfm/po8xtAVrYZGU6wwoRk
         4016CMe30enMYKpLe4eCYYTICayCWrVN2ke2IjtzESU8inf0wRW+51918JEUnqkRtx9V
         PcfrEl+VwTEGI20Ctqobjg4OgsgKUXdS57M2tPIo2t7ZswxVBJGFh/lrG6A8tEdMJNvg
         +tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115368; x=1720720168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DvhJcUGw5mSDBm9HbHfggA/39XLYnhdmnTEhZw5rXs=;
        b=LGgCfv5EXLSDhQCRtmol/5E4p8Y2X5sxknUKZHbLis+pVOKE3JnQ5gZDMDv0jTK6uQ
         mjtWQTvnCNqXuzrA37JouAUQ4n0ImazUNBNeoV1WHvgLmK818LmeR06GMCW5zWpa5UK7
         1yLkaB4OphNS2baewXgCaPwv6SzCZSv0jlZatyZenWQA2Z3iOeX40BQSv73lALOMKDis
         uu/K84jgjPGT7eojr69ms6giNyATBwA/lAJsav9BThaYN047NqiLYfyvp3XVRBS6JggH
         akFQfup+7XzvMnlfMS2bY0ydUKnaW5VthjJYZ01ykjwrcS3YqcgXYeI05hqQuBT0jfJn
         bocw==
X-Gm-Message-State: AOJu0YxXlKfhuuR98rPEykQvYgoWOlg59kYVYjqX2AwEX0hsGB7ml6gd
	DDyYV00qXE/w9rl7M3PZ4OLkoq8/dYOTaRS+r/vmxgA05M8+F8JcH4TdRGNP2HL7d0KLrVztZrD
	C
X-Google-Smtp-Source: AGHT+IFRKfWFPHYOQNNsDxONsyfHFn5PWuz2aud4gnlOxL74K1BKCKd+mNILE8YgXYiSSjdmvpxcmQ==
X-Received: by 2002:a05:6808:3090:b0:3d5:6306:97af with SMTP id 5614622812f47-3d914eae92dmr2516155b6e.46.1720115368421;
        Thu, 04 Jul 2024 10:49:28 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205ebbcsm12505399b3a.40.2024.07.04.10.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:49:28 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH] MAINTAINERS: thead: add git tree
Date: Thu,  4 Jul 2024 10:49:21 -0700
Message-Id: <20240704174921.2514921-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add git tree for T-Head device tree files and, in the future, drivers for
the T-Head TH1520 SoC.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120351e41ef7..d60b066d5880 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19322,6 +19322,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+T:	git https://github.com/pdp7/linux.git
 F:	arch/riscv/boot/dts/thead/
 
 RNBD BLOCK DRIVERS
-- 
2.34.1

