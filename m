Return-Path: <SRS0=Yx92=OE=pdp7.com=drew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EBFC3271F
	for <soc@archiver.kernel.org>; Thu,  4 Jul 2024 18:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 568D3C32781; Thu,  4 Jul 2024 18:13:24 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F9DAC3277B
	for <soc@kernel.org>; Thu,  4 Jul 2024 18:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F9DAC3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25e00f348e6so488946fac.1
        for <soc@kernel.org>; Thu, 04 Jul 2024 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720116801; x=1720721601; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1zfXTojJsKe3wzSJXZA6AZrGX/lJFvmn/u+9Krof3k=;
        b=sbCLEET+9iefbZVyvyNF8A5t3pAi42bz4/9hEq2W5MDUjesVYteWGUQh+7VZdcmBVn
         dKbNnbsALDqiIgZJEchVB5rqYaxoyo03DcWnEz3AXFof5Z8mxwD8/2ebNn2MqUFHoW08
         HpdKUUJcgc/8mvRCLqaqI78abPJxPBEK7P+sf73WlOR54nfIe4lnTaFUMI/AYNzUoomQ
         KR6CR0Q8CvEo4hM8w/H7LnM3QjSFh8BgAzSD4Ut8l+2Hg6K9R/3pUqI7/JHply486/Y9
         nPIzKUf0hQl/1Qoj96hSJklgx9WW5irr0Dgtmbp5cVM66IqAGuK4Nih1oLGdZt1Kt1ct
         1v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720116801; x=1720721601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1zfXTojJsKe3wzSJXZA6AZrGX/lJFvmn/u+9Krof3k=;
        b=Uq1BcdjLtuPLFz9ehgHEzGphFHnY7TwIF+KVny9cmhFVNUA6J4+RNTYdG8hr/dxISm
         lq+TGZIEyyyehNgcSbVGd+RyXWhJJ61veWxbNAX2UCYLuzB8FZfWT6EDLmxYQZXmDb84
         WeVcV4PGg6tpFlEd8zdI6Q9+JP9Cwq5V26SHUXK/LyPY98vIoQAiLvhKJcz0Y+TY4r2I
         B6b6+hTnNzWQHAAWAQeGNaJZvPIMT4ANmZb954ltV/ePPINletXLuLPMDhOaZNZevDCn
         vBVXaeSjcmdja0RYUxiahTOFZMUzOLvLtb81qXvSmRaBKDwQgZpDJK9Ihf8fm1lo0CFK
         CAuA==
X-Gm-Message-State: AOJu0YzoViS9icGQgTWQsHj9JS174QX61pAvzBRNhLLcBqHfaPZQnlQX
	1RqVBhyKM4WCoDh/AphnyUzUdR9JuEE+xTIpojzk0iIWENYgBYGwx66jc7a+6qkuekTHZ+fJfRZ
	G
X-Google-Smtp-Source: AGHT+IECInmMyw8Royp+E9lIm6aV35f6xO/4XHeeEgDRWi71l+BBUa5MaOnn/GnWrwUqYtT3LbrnHw==
X-Received: by 2002:a05:6870:b523:b0:24f:ebcd:6aa9 with SMTP id 586e51a60fabf-25e2b8cf1f8mr2162512fac.1.1720116801683;
        Thu, 04 Jul 2024 11:13:21 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d100ea3sm10049195a12.78.2024.07.04.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:13:21 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Drew Fustini <drew@pdp7.com>
Subject: [PATCH v2] MAINTAINERS: thead: add git tree
Date: Thu,  4 Jul 2024 11:09:17 -0700
Message-Id: <20240704180913.2516959-1-drew@pdp7.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add git tree for T-Head device tree files and, in the future, drivers for
the T-Head TH1520 SoC.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
Changes from v1:
- Add exclusion for thead in the RISC-V MISC SOC SUPPORT entry so that
  there are not two git trees covering the same platform

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 120351e41ef7..503d2bd5caef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19306,6 +19306,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/thead/
 
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>
@@ -19322,6 +19323,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+T:	git https://github.com/pdp7/linux.git
 F:	arch/riscv/boot/dts/thead/
 
 RNBD BLOCK DRIVERS
-- 
2.34.1

